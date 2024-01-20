<?php

namespace App\Http\Controllers;

use App\Mail\ActionUser;
use App\Mail\create_user;
use App\Models\Area;
use App\Models\Charge;
use App\Models\Companie;
use App\Models\Shop;
use App\Models\Theme_user;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class UsersController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function show_users(){
        $user = Auth::user();
        $validation_jefe = DB::selectOne("SELECT * FROM users u
        INNER JOIN charges c ON u.id_chargy = c.id
        WHERE c.chargy = 'JEFE DE AREA' AND u.id = $user->id");
        $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
        $users = UsersController::users($user, null);
        return view('dashboard.users.users', compact('users', 'validation_jefe', 'validate_user_sistemas'));
    }

    public function users($user , $search){
        if ($search != null) {
            if($user->id_area == 1 || $user->id_area == 2){
                $sql = " WHERE u.id <> $user->id AND u.id <> 2 AND
                (u.name LIKE '%$search%' OR u.email LIKE '%$search%' OR u.nit LIKE '%$search%' OR c.company LIKE '%$search%' OR ch.chargy LIKE '%$search%' OR u.id LIKE '%$search%' OR a.area LIKE '%$search%' OR s.state LIKE '%$search%') ORDER BY u.id DESC";


            }else{
            $sql = " WHERE u.id_area = $user->id_area AND u.id <> $user->id AND u.id <> 2 AND
                (u.name LIKE '%$search%' OR u.email LIKE '%$search%' OR u.nit LIKE '%$search%' OR c.company LIKE '%$search%' OR ch.chargy LIKE '%$search%' OR u.id LIKE '%$search%' OR a.area LIKE '%$search%' OR s.state LIKE '%$search%') ORDER BY u.id DESC";

            }
        }else{
    if($user->id_area == 1 || $user->id_area == 2){
        $sql = " WHERE u.id <> $user->id AND u.id <> 2 ORDER BY u.id DESC";


    }else{
    $sql = "WHERE u.id_area = $user->id_area AND u.id <> $user->id AND u.id <> 2 ORDER BY u.id DESC";

    }
}
$users = DB::select("SELECT u.id, u.name, u.nit, u.email,c.company, s.state, a.area, ch.chargy, u.id_state
FROM users u
INNER JOIN companies c ON u.id_company = c.id
INNER JOIN states s ON u.id_state = s.id
INNER JOIN areas a ON u.id_area = a.id
INNER JOIN charges ch ON u.id_chargy = ch.id $sql");
    return $users;
}

public function search_users(Request $request){
    $user = Auth::user();
    $validation_jefe = DB::selectOne("SELECT * FROM users u
    INNER JOIN charges c ON u.id_chargy = c.id
    WHERE c.chargy = 'JEFE DE AREA' AND u.id = $user->id");
    $users = UsersController::users($user,$request->search);
    return view('dashboard.users.users', compact('users', 'validation_jefe'));
}


public function edit_profile($id){


    $user = User::find($id);
    $id = Auth::user()->id;
    $validate_user_administrator = DB::selectOne("SELECT * FROM users WHERE id_area = 1 AND id=$id");
    $validation_jefe = DB::selectOne("SELECT * FROM users u
        INNER JOIN charges c ON u.id_chargy = c.id
        WHERE c.chargy = 'JEFE DE AREA' AND u.id = $id");
        if (!$validation_jefe) {
            $validation_jefe == null;
        }
    $areas = Area::all()->where('id', '<>', '1');
    $companies = Companie::all();
    $charges = Charge::all();
    $shops = Shop::all();
    $themes_users = Theme_user::all();
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
    return view("dashboard.users.edit_profile", compact("validate_user_administrator","themes_users","user", "validation_jefe", "companies", "areas", "charges", "shops", "validate_user_sistemas"));

}

public function view_user($id){

    $user = DB::selectOne("SELECT u.id, u.name, u.nit, u.email,c.company, s.state, a.area, ch.chargy
    FROM users u
    INNER JOIN companies c ON u.id_company = c.id
    INNER JOIN states s ON u.id_state = s.id
    INNER JOIN areas a ON u.id_area = a.id
    INNER JOIN charges ch ON u.id_chargy = ch.id
    WHERE u.id = $id");
    $phone = DB::selectOne("SELECT u.phone FROM users u WHERE u.id = $id");

    $shop = DB::selectOne("SELECT s.shop FROM users u INNER JOIN shops s ON u.id_shop = s.id WHERE u.id = $id");
    if ($shop) {
        $shop = $shop->shop;
    }else{
        $shop = null;
    }
    if ($phone) {
        $phone = $phone->phone;
    }else{
        $phone = null;
    }

    return view('dashboard.users.view_user', compact('user', 'shop','phone'));
}

public function save_changes(Request $request){
    $my_user = Auth::user();
    $user = User::find($request->id);
    $user->name = $request->name;
    $user->nit= $request->nit;
    $user->id_company = $request->id_company;
    $user->id_chargy = $request->id_chargy;

    if ($request->id_shop){
        $user->id_shop = $request->id_shop;
    }

    if ($request->id_theme_user) {
        $user->id_theme_user = $request->id_theme_user;
    }
    if($request->phone){
        $user->phone = $request->phone;
    }
    ReportController::create_report("Se han modificado los datos del usuario $user->email", $my_user->id, 2);
    $user->save();
    return redirect()->route('dashboard.users.edit_profile', $request->id)->with("message","Usuario actualizado con exito!");

}

public function delete_user(Request $request){
    $my_user = Auth::user();
    $user = User::find($request->id);
    $jefe = User::find($request->id_jefe);
    if ($user->id_state == 1) {
       $user->id_state = 2;
    }else{
        $user->id_state = 1;
    }
    ReportController::create_report("El usuario $my_user->email ha cambiado el estado del usuario $user->email a ACTIVO O ELIMINADO", $my_user->id, 3);
    $states = DB::selectOne("SELECT * FROM states WHERE id = $user->id_state");
    $user->save();
    Mail::to($user->email)->send(new ActionUser($user->name, $jefe->email, $states->state, $jefe->name));
    $myuser = Auth::user();
   return redirect()->route('dashboard.users');
}
public function change_password($id){
    $user = User::find($id);
    return view("dashboard.users.edit_password", compact("user"));
}

public function save_changes_password(Request $request){
    $user = User::find($request->id);
    $my_user = Auth::user();
    if (Hash::check($request->password_now, $user->password)) {
        if ($request->password2 == $request->password) {
            $user->password = Hash::make($request->password);
            ReportController::create_report("Se ha modificado la contraseña del usuario $user->email", $my_user->id, 2);
            $user->save();
            return redirect()->route('dashboard.users.change_password', $request->id)->with("message","Contraseña actualizada con exito!");
        }else{
            return redirect()->route('dashboard.users.change_password', $request->id)->with("message_error","Las contraseñas no coinciden!");
        }

    }else{
        return redirect()->route('dashboard.users.change_password', $request->id)->with("message_error","Contraseña actual no valida!");
    }
}

public function new_user(){

    $user = User::find(Auth::user()->id);
    $themes_users = Theme_user::all();
    $companies = Companie::all();
    $charges = Charge::all()->where('id_area','=',$user->id_area);
    $shops = Shop::all();
    $area = DB::selectOne("SELECT * FROM areas WHERE id = $user->id_area");
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
    return view('dashboard.users.new_user', compact ('user', 'companies', 'charges', 'shops', 'area','themes_users', 'validate_user_sistemas'));
}


public function save_user(Request $request){
    $my_user = User::find(Auth::user()->id);
    $validation_email = DB::selectOne("SELECT * FROM users WHERE email ='$request->email'");
    $validation_nit = DB::selectOne("SELECT * FROM users WHERE nit ='$request->nit'");
    $validation_form_email = strpos($request->email, '@eltemplodelamoda.com.co');
    $validation_form_email2 = strpos($request->email, '@eltemplodelamodafresca.com.co');
    if (!$validation_form_email && !$validation_form_email2) {
        return redirect()->route('dashboard.users.new_user')->with("message_error","Formato de correo no permitido");
    }else
    if ($validation_email) {
        return redirect()->route('dashboard.users.new_user')->with("message_error","Usuario con correo existente");
    }else if ($request->password !== $request->password2) {
        return redirect()->route('dashboard.users.new_user')->with("message_error","Las contraseñas no coinciden");
    }else if ($validation_nit) {
        return redirect()->route('dashboard.users.new_user')->with("message_error","Usuario con nit existente");
    }else{
        $user = new User();
        $user->name = $request->name;
        $user->nit= $request->nit;
        $user->email= $request->email;
        $user->id_company = $request->id_company;
        $user->id_state = 1;
        $user->id_area = $my_user->id_area;
        $user->password = Hash::make($request->password);
        $user->id_chargy = $request->id_chargy;
        if ($request->id_theme_user) {
            $user->id_theme_user = $request->id_theme_user;
        }
        if ($request->id_shop){
            $user->id_shop = $request->id_shop;
        }
        ReportController::create_report("Se ha creado el siguiente usuario $user->email", $my_user->id, 1);
        $user->save();
        $user = DB::selectOne("SELECT * FROM users WHERE email='$request->email'");
        Mail::to($user->email)->send(new create_user($user->id, $request->password));
        return redirect()->route('dashboard.users')->with("message","Usuario creado con exito");

    }

}

public function getcharges($id){
    $charges = DB::select("SELECT c.chargy, c.id FROM charges c WHERE c.id_area = $id");
    return response()->json(['charges' => $charges], 200);
}
public function getshops($id){
    $shops = DB::select("SELECT s.shop, s.id FROM shops s WHERE s.id_company = $id");
    return response()->json(['shops' => $shops], 200);
}


}
