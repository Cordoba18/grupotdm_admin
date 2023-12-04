<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use App\Mail\ActionUser;
use App\Models\Area;
use App\Models\Charge;
use App\Models\Companie;
use App\Models\Shop;
use App\Models\User;
use DateTime;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class ProfileController extends Controller
{
    /**
     * Display the user's profile form.
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

     public function index(){
        return view('dashboard');
     }
    public function edit(Request $request): View
    {
        return view('profile.edit', [
            'user' => $request->user(),
        ]);
    }

    /**
     * Update the user's profile information.
     */
    public function update(ProfileUpdateRequest $request): RedirectResponse
    {
        $request->user()->fill($request->validated());

        if ($request->user()->isDirty('email')) {
            $request->user()->email_verified_at = null;
        }

        $request->user()->save();

        return Redirect::route('profile.edit')->with('status', 'profile-updated');
    }

    /**
     * Delete the user's account.
     */
    public function destroy(Request $request): RedirectResponse
    {
        $request->validateWithBag('userDeletion', [
            'password' => ['required', 'current_password'],
        ]);

        $user = $request->user();

        Auth::logout();

        $user->delete();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return Redirect::to('/');
    }

    public function show_users(){
        $user = Auth::user();

        $users = ProfileController::users($user);

        return view('dashboard.users.users', compact('users'));
    }
    public function delete_user(Request $request){

        $user = User::find($request->id);
        $jefe = User::find($request->id_jefe);
        if ($user->id_state == 1) {
           $user->id_state = 2;
        }else{
            $user->id_state = 1;
        }
        $states = DB::selectOne("SELECT * FROM states WHERE id = $user->id_state");
        $user->save();
        Mail::to($user->email)->send(new ActionUser($user->name, $jefe->email, $states->state, $jefe->name));
        $myuser = Auth::user();
       return redirect()->route('dashboard.users');
    }

    public function users($user){
        $validation_jefe = DB::selectOne("SELECT * FROM users u
        INNER JOIN charges c ON u.id_chargy = c.id
        WHERE c.chargy = 'JEFE DE AREA' AND u.id = $user->id");
        if ($validation_jefe) {
        if($user->id_area == 1){
            $users = DB::select("SELECT u.id, u.name, u.nit, u.email,c.company, s.state, a.area, ch.chargy, u.id_state
            FROM users u
            INNER JOIN companies c ON u.id_company = c.id
            INNER JOIN states s ON u.id_state = s.id
            INNER JOIN areas a ON u.id_area = a.id
            INNER JOIN charges ch ON u.id_chargy = ch.id
            WHERE u.id <> $user->id");

        }else{
        $users =   DB::select("SELECT u.id, u.name, u.nit, u.email,c.company, s.state, a.area, ch.chargy, sh.shop, u.id_state
         FROM users u
        INNER JOIN companies c ON u.id_company = c.id
        INNER JOIN states s ON u.id_state = s.id
        INNER JOIN areas a ON u.id_area = a.id
        INNER JOIN charges ch ON u.id_chargy = ch.id
        INNER JOIN shops sh ON u.id_shop = sh.id
        WHERE u.id_area = $user->id_area AND u.id <> $user->id");
        }
            # code...
        }else{
            $users = null;
        }
        return $users;
    }


public function show_tickets(){

    return view('dashboard.tickets.show');
}

public function create_ticket(){


    return view('dashboard.tickets.create');
}

public function edit_profile($id){



    $user = User::find($id);
    $id = Auth::user()->id;
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
    return view("dashboard.users.edit_profile", compact("user", "validation_jefe", "companies", "areas", "charges", "shops"));

}

public function save_changes(Request $request){

    $user = User::find($request->id);
    $user->name = $request->name;
    $user->nit= $request->nit;
    $user->id_company = $request->id_company;
    $user->id_state = 2;
    $user->id_area = $request->id_area;
    $user->id_chargy = $request->id_chargy;
    if ($request->id_shop){
        $user->id_shop = $request->id_shop;
    }
    $user->save();
    return redirect()->route('dashboard.users.edit_profile', $request->id)->with("message","Usuario actualizado con exito!");

}
public function change_password($id){
    $user = User::find($id);
    return view("dashboard.users.edit_password", compact("user"));
}

public function save_changes_password(Request $request){
    $user = User::find($request->id);

    if (Hash::check($request->password_now, $user->password)) {
        if ($request->password2 == $request->password) {
            $user->password = Hash::make($request->password);
            $user->save();
            return redirect()->route('dashboard.users.change_password', $request->id)->with("message","Contraseña actualizada con exito!");
        }else{
            return redirect()->route('dashboard.users.change_password', $request->id)->with("message_error","Las contraseñas no coinciden!");
        }

    }else{
        return redirect()->route('dashboard.users.change_password', $request->id)->with("message_error","Contraseña actual no valida!");
    }
}
}
