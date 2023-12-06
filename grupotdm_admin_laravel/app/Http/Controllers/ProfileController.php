<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use App\Mail\ActionUser;
use App\Mail\create_ticket;
use App\Mail\create_user;
use App\Models\Area;
use App\Models\Charge;
use App\Models\Companie;
use App\Models\Prioritie;
use App\Models\Shop;
use App\Models\Ticket;

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
        $validation_jefe = DB::selectOne("SELECT * FROM users u
        INNER JOIN charges c ON u.id_chargy = c.id
        WHERE c.chargy = 'JEFE DE AREA' AND u.id = $user->id");
        $users = ProfileController::users($user);
        return view('dashboard.users.users', compact('users', 'validation_jefe'));
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
        $users = DB::select("SELECT u.id, u.name, u.nit, u.email,c.company, s.state, a.area, ch.chargy, u.id_state
         FROM users u
        INNER JOIN companies c ON u.id_company = c.id
        INNER JOIN states s ON u.id_state = s.id
        INNER JOIN areas a ON u.id_area = a.id
        INNER JOIN charges ch ON u.id_chargy = ch.id
        WHERE u.id_area = $user->id_area AND u.id <> $user->id");

        }

            # code...
        }else{
            $users = null;
        }

        return $users;
    }


public function show_tickets(){
    $user = Auth::user();
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
if ($validate_user_sistemas) {
    $tickets = DB::select("SELECT t.id, t.name, t.description, t.date_start, t.date_finally, p.priority, s.id AS id_state, s.state, us.name AS name_sender,  ud.name AS name_destination, ud.id AS id_user_destination
    FROM tickets t
    INNER JOIN priorities p ON t.id_priority = p.id
    INNER JOIN users us ON t.id_user_sender =us.id
    INNER JOIN users ud ON t.id_user_destination = ud.id
    INNER JOIN states s ON t.id_state = s.id  WHERE t.id_state <> 2 ORDER BY t.id DESC");



} else {
    $tickets = DB::select("SELECT t.id, t.name, t.description, t.date_start, t.date_finally, p.priority, s.id AS id_state, s.state, us.name AS name_sender,  ud.name AS name_destination, ud.id AS id_user_destination
    FROM tickets t
    INNER JOIN priorities p ON t.id_priority = p.id
    INNER JOIN users us ON t.id_user_sender =us.id
    INNER JOIN users ud ON t.id_user_destination = ud.id
    INNER JOIN states s ON t.id_state = s.id WHERE us.id = $user->id OR ud.id = $user->id AND t.id_state <> 2 ORDER BY t.id DESC");

}

foreach ($tickets as $t) {
    $ticket = Ticket::find($t->id);
    if ($t->id_user_destination == $user->id && $t->id_state == 3) {
        $ticket->id_state = 4;

    }

    // Fecha y hora actual
$fechaActual = new DateTime();

// Fecha que deseas validar
$fechaStr = $t->date_finally;

// Convertir la cadena de fecha a un objeto DateTime
$fecha = DateTime::createFromFormat('d/m/Y H:i:s', $fechaStr);

// Comparar las fechas (ignorando la parte de la hora para comparar solo la fecha)
if ($fecha->format('Y-m-d') < $fechaActual->format('Y-m-d')) {
$ticket->id_state = 6;
}
$ticket->save();
}
    return view('dashboard.tickets.show',compact('tickets' , 'validate_user_sistemas'));
}


public function state(Request $request){
    $user = User::find($request->id);
    $Ticket = Ticket::find($request->id_ticket);

    if ($Ticket->id_state == 4) {
        $Ticket->id_state =5;
    }else if ($Ticket->id_state == 5) {
        $Ticket->id_state =7;
    }else{
        $Ticket->id_state =2;
    }
    $Ticket->save();
    return redirect()->route('dashboard.tickets')->with('message', 'Peticion realizada');
}

public function create_ticket(){
    $user = Auth::user();
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
    $priorities = Prioritie::all();
    $users = DB::select("SELECT * FROM users WHERE id_area = 2 AND id_state = 1");

        return view('dashboard.tickets.create', compact('user', 'validate_user_sistemas', 'priorities','users'));
}

public function save_ticket(Request $request){
    $user = Auth::user();
    $new_ticket = new Ticket();
    $new_ticket->name = $request->name;
    $new_ticket->description = $request->description;
    $new_ticket->date_start = $request->date_start;
    $new_ticket->date_finally = $request->date_finally;
    $new_ticket->id_priority = $request->id_priority;
    $new_ticket->id_user_sender = $user->id;
    $new_ticket->id_state = 3;
    $user_sistemas = DB::selectOne("SELECT u.id FROM users u
        INNER JOIN charges c ON u.id_chargy = c.id
         WHERE c.id_area = 2 AND c.chargy = 'JEFE DE AREA' AND u.id_state = 1");
    if ($request->id_user_destination) {
        $new_ticket->id_user_destination = $request->id_user_destination;
    }else{

         $new_ticket->id_user_destination = $user_sistemas->id;
        }
    if ($request->hasFile('image')) {
        $file = $request->file('image');
        $fechaHoraActual = now()->format('Y-m-d_H-i-s');
        $name_file = $fechaHoraActual . '.' . $file->getClientOriginalExtension();
        $rutaImagen = public_path('storage/files/' . $name_file);
        $file->move(public_path('storage/files'), $name_file);
        $new_ticket->file = $name_file;
    }
    $user_destination = DB::selectOne("SELECT * FROM users WHERE id=$new_ticket->id_user_destination");
    Mail::to($user_destination->email)->send(new create_ticket($user, $user_destination, $new_ticket));
    $new_ticket->save();
    return redirect()->route('dashboard.tickets')->with("message","Ticket generado con exito!");

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

public function new_user(){

    $user = User::find(Auth::user()->id);

    $companies = Companie::all();
    $charges = Charge::all()->where('id_area','=',$user->id_area);
    $shops = Shop::all();
    $area = DB::selectOne("SELECT * FROM areas WHERE id = $user->id_area");
    return view('dashboard.users.new_user', compact ('user', 'companies', 'charges', 'shops', 'area'));
}

public function save_user(Request $request){
    $my_user = User::find(Auth::user()->id);
    $validation_email = DB::selectOne("SELECT * FROM users WHERE email ='$request->email'");
    $validation_nit = DB::selectOne("SELECT * FROM users WHERE nit ='$request->nit'");
    $validation_form_email = strpos($request->email, 'eltemplodelamoda.com.co');
    if (!$validation_form_email) {
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
        if ($request->id_shop){
            $user->id_shop = $request->id_shop;
        }
        $user->save();
        $user = DB::selectOne("SELECT * FROM users WHERE email='$request->email'");
        Mail::to($user->email)->send(new create_user($user->id, $request->password));
        return redirect()->route('dashboard.users')->with("message","Usuario creado con exito");

    }

}

public function get_id($id){
    $hora = Prioritie::find($id)->hour;
    return response()->json(['hour' => $hora], 200);
}
}
