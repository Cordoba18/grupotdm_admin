<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use App\Mail\accept_certificate;
use App\Mail\action_permission;
use App\Mail\ActionUser;
use App\Mail\calification_ticket;
use App\Mail\comment_ticket;
use App\Mail\create_certificate;
use App\Mail\create_permission;
use App\Mail\create_product;
use App\Mail\create_ticket;
use App\Mail\notificate_finish_ticket;
use App\Mail\create_user;
use App\Mail\edit_ticket;
use App\Mail\modificate_ticket;
use App\Mail\new_file;
use App\Mail\new_repository;
use App\Mail\notification_certificate;
use App\Models\Certificate;
use App\Models\Origin_Certificate;
use App\Models\Area;
use App\Models\State_Certificate;
use App\Models\Type_Component;
use App\Models\Calification;
use App\Models\Charge;
use App\Models\Report_product;
use App\Models\Comment;
use App\Models\Image_product;
use App\Models\Companie;
use App\Models\Directorie;
use App\Models\File as ModelsFile;
use App\Models\Files_modified;
use App\Models\Permission;
use App\Models\Prioritie;
use App\Models\Proceeding;
use App\Models\Reason;
use App\Models\Replenish_time;
use App\Models\Report_detail;
use App\Models\Row_Certificate;
use App\Models\Shop;
use App\Models\Theme_user;
use App\Models\Ticket;
use App\Models\Product;
use Illuminate\Support\Facades\File;
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
use Carbon\Carbon;
use Illuminate\Support\Str;
use Directory;

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
        $users = ProfileController::users($user, null);
        return view('dashboard.users.users', compact('users', 'validation_jefe'));
    }

    public function getcharges($id){
        $charges = DB::select("SELECT c.chargy, c.id FROM charges c WHERE c.id_area = $id");
        return response()->json(['charges' => $charges], 200);
    }
    public function getshops($id){
        $shops = DB::select("SELECT s.shop, s.id FROM shops s WHERE s.id_company = $id");
        return response()->json(['shops' => $shops], 200);
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

    public function users($user , $search){
        $validation_jefe = DB::selectOne("SELECT * FROM users u
        INNER JOIN charges c ON u.id_chargy = c.id
        WHERE c.chargy = 'JEFE DE AREA' AND u.id = $user->id");
        if ($validation_jefe) {
            if ($search != null) {
                if($user->id_area == 1){
                    $users = DB::select("SELECT u.id, u.name, u.nit, u.email,c.company, s.state, a.area, ch.chargy, u.id_state
                    FROM users u
                    INNER JOIN companies c ON u.id_company = c.id
                    INNER JOIN states s ON u.id_state = s.id
                    INNER JOIN areas a ON u.id_area = a.id
                    INNER JOIN charges ch ON u.id_chargy = ch.id
                    WHERE u.id <> $user->id AND
                    (u.name LIKE '%$search%' OR u.email LIKE '%$search%' OR u.nit LIKE '%$search%' OR c.company LIKE '%$search%' OR ch.chargy LIKE '%$search%' OR u.id LIKE '%$search%' OR a.area LIKE '%$search%' OR s.state LIKE '%$search%') ORDER BY u.id DESC");


                }else{
                $users = DB::select("SELECT u.id, u.name, u.nit, u.email,c.company, s.state, a.area, ch.chargy, u.id_state
                 FROM users u
                INNER JOIN companies c ON u.id_company = c.id
                INNER JOIN states s ON u.id_state = s.id
                INNER JOIN areas a ON u.id_area = a.id
                INNER JOIN charges ch ON u.id_chargy = ch.id
                WHERE u.id_area = $user->id_area AND u.id <> $user->id AND
                    (u.name LIKE '%$search%' OR u.email LIKE '%$search%' OR u.nit LIKE '%$search%' OR c.company LIKE '%$search%' OR ch.chargy LIKE '%$search%' OR u.id LIKE '%$search%' OR a.area LIKE '%$search%' OR s.state LIKE '%$search%') ORDER BY u.id DESC");

                }
            }else{
        if($user->id_area == 1){
            $users = DB::select("SELECT u.id, u.name, u.nit, u.email,c.company, s.state, a.area, ch.chargy, u.id_state
            FROM users u
            INNER JOIN companies c ON u.id_company = c.id
            INNER JOIN states s ON u.id_state = s.id
            INNER JOIN areas a ON u.id_area = a.id
            INNER JOIN charges ch ON u.id_chargy = ch.id
            WHERE u.id <> $user->id ORDER BY u.id DESC");


        }else{
        $users = DB::select("SELECT u.id, u.name, u.nit, u.email,c.company, s.state, a.area, ch.chargy, u.id_state
         FROM users u
        INNER JOIN companies c ON u.id_company = c.id
        INNER JOIN states s ON u.id_state = s.id
        INNER JOIN areas a ON u.id_area = a.id
        INNER JOIN charges ch ON u.id_chargy = ch.id
        WHERE u.id_area = $user->id_area AND u.id <> $user->id ORDER BY u.id DESC");

        }
    }

            # code...
        }else{
            $users = null;
        }

        return $users;
    }


public function show_tickets(){

    $tickets_all = Ticket::all();
    $user = Auth::user();
    $search =null;
    $filter =null;
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
    $tickets = ProfileController::get_tickets($validate_user_sistemas, $user ,null, null);
$filters = DB::select("SELECT * FROM states WHERE id = 3 OR id=4 OR id=5 OR id=6 OR id=7");
    return view('dashboard.tickets.show',compact('tickets' , 'validate_user_sistemas', 'filters','search','filter','tickets_all'));
}





public function show_tickets_filter_search(Request $request){

    $tickets_all = Ticket::all();
    $user = Auth::user();
    $search = $request->search;
    $filter = $request->filter;
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
    $tickets = ProfileController::get_tickets($validate_user_sistemas, $user ,$request->search,$request->filter);
$filters = DB::select("SELECT * FROM states WHERE id = 3 OR id=4 OR id=5 OR id=6 OR id=7");
    return view('dashboard.tickets.show',compact('tickets' , 'validate_user_sistemas', 'filters', 'search', 'filter','tickets_all'));
}

public static function get_tickets($validate_user_sistemas, $user, $search, $filter){
    $consult = null;
    if ($validate_user_sistemas) {
        if ($search != null && $filter != null) {
            $consult = "WHERE t.id_state <> 2
            AND (t.id LIKE '%$search%'
                OR t.name LIKE '%$search%'
            OR t.description LIKE '%$search%'
            OR t.date_start LIKE '%$search%'
            OR t.date_finally LIKE '%$search%'
            OR p.priority LIKE '%$search%'
            OR us.name LIKE '%$search%'
            OR ud.name LIKE '%$search%') AND t.id_state = $filter ORDER BY t.id DESC";
        } else if ($search != null){
        $consult = "WHERE t.id_state <> 2
        AND (t.id LIKE '%$search%'
            OR t.name LIKE '%$search%'
        OR t.description LIKE '%$search%'
        OR t.date_start LIKE '%$search%'
        OR t.date_finally LIKE '%$search%'
        OR p.priority LIKE '%$search%'
        OR us.name LIKE '%$search%'
        OR ud.name LIKE '%$search%') ORDER BY t.id DESC";
        }else if ($filter != null) {
            $consult = "WHERE t.id_state <> 2 AND t.id_state = $filter ORDER BY t.id DESC";
        }else{
            $consult = "WHERE t.id_state <> 2 AND t.id_state <> 7 AND t.id_state <> 6 ORDER BY t.id DESC";
        }


    } else {

        if ($search != null && $filter != null) {
            $consult = "WHERE (us.id = $user->id OR ud.id = $user->id) AND (t.id LIKE '%$search%'
            OR t.name LIKE '%$search%'
        OR t.description LIKE '%$search%'
        OR t.date_start LIKE '%$search%'
        OR t.date_finally LIKE '%$search%'
        OR p.priority LIKE '%$search%'
        OR us.name LIKE '%$search%'
        OR ud.name LIKE '%$search%') AND  t.id_state <> 2 AND t.id_state = $filter ORDER BY t.id DESC";
        } else if ($search != null) {
            $consult = "WHERE (us.id = $user->id OR ud.id = $user->id) AND (t.id LIKE '%$search%'
            OR t.name LIKE '%$search%'
        OR t.description LIKE '%$search%'
        OR t.date_start LIKE '%$search%'
        OR t.date_finally LIKE '%$search%'
        OR p.priority LIKE '%$search%'
        OR us.name LIKE '%$search%'
        OR ud.name LIKE '%$search%') AND  t.id_state <> 2 ORDER BY t.id DESC";
        }else if ($filter != null) {
            $consult = "WHERE (us.id = $user->id OR ud.id = $user->id) AND t.id_state = $filter AND t.id_state <> 2 ORDER BY t.id DESC";
        }else{
            $consult = "WHERE (us.id = $user->id OR ud.id = $user->id) AND t.id_state <> 2 ORDER BY t.id DESC";
        }



    }

    $tickets = DB::select("SELECT t.id, t.name, t.description, t.date_start, t.date_finally, p.priority, s.id AS id_state, s.state, us.name AS name_sender,  ud.name AS name_destination, ud.id AS id_user_destination, us.id AS id_user_sender
    FROM tickets t
    INNER JOIN priorities p ON t.id_priority = p.id
    INNER JOIN users us ON t.id_user_sender =us.id
    INNER JOIN users ud ON t.id_user_destination = ud.id
    INNER JOIN states s ON t.id_state = s.id  $consult");
    $tickets_all = Ticket::all();
    foreach ($tickets_all as $t) {
        $ticket = Ticket::find($t->id);
        $action = false;
        // Fecha y hora actual
    $fechaActual = new DateTime();

    // Fecha que deseas validar
    $fechaStr = $t->date_finally;

    // Convertir la cadena de fecha a un objeto DateTime
    $fecha = DateTime::createFromFormat('d/m/Y H:i:s', $fechaStr);

    // Comparar las fechas (ignorando la parte de la hora para comparar solo la fecha)
    if ($fecha->format('Y-m-d') < $fechaActual->format('Y-m-d') && $t->id_state !== 7 && $t->id_state !== 6 ) {
    $ticket->id_state = 6;
    $action = true;
    }
    $ticket->save();
    if ($action) {

    $infoticket = DB::selectOne("SELECT t.id, s.state FROM tickets t INNER JOIN states s ON t.id_state = s.id WHERE t.id = $ticket->id");
    $user_sender = User::find($ticket->id_user_sender);
    $user_destination = User::find($ticket->id_user_destination);
    if ($ticket->id_state != 6) {
        ReportController::create_report("El ticket con ID $ticket->id para el usuario $user->email ha vencido", $user->id, 7);
        Mail::to($user_sender->email)->send(new modificate_ticket($user_sender,$user_destination, $infoticket));
    }else{
        Mail::to($user_destination->email)->send(new modificate_ticket($user_destination,$user_destination, $infoticket));
        Mail::to($user_sender->email)->send(new modificate_ticket($user_sender,$user_destination, $infoticket));
    }

    }
    }

    return $tickets;
}

public function delete_ticket(Request $request){

    $user = Auth::user();
    $Ticket = Ticket::find($request->id_ticket);
    if($Ticket->id_state == 7){
        $Ticket->id_state =3;
        ReportController::create_report("El usuario $user->email Re abrio el ticket con id $Ticket->id", $user->id, 11);
    }else{
        $Ticket->id_state =2;
        ReportController::create_report("El usuario $user->email ha eliminado el ticket con id $Ticket->id", $user->id, 6);
    }

    $Ticket->save();
    $infoticket = DB::selectOne("SELECT t.id, s.state FROM tickets t INNER JOIN states s ON t.id_state = s.id WHERE t.id = $Ticket->id");
    $user_sender = User::find($Ticket->id_user_sender);
    $user_destination = User::find($Ticket->id_user_destination);
    Mail::to($user_destination->email)->send(new modificate_ticket($user_destination,$user_destination, $infoticket));
    return redirect()->route('dashboard.tickets')->with('message', 'Ticket eliminado con exito');
}

public function state(Request $request){
    $user = Auth::user();
    $Ticket = Ticket::find($request->id_ticket);
    $user_sender = User::find($Ticket->id_user_sender);
    $user_destination = User::find($Ticket->id_user_destination);
    if ($Ticket->id_state == 4) {
        $Ticket->id_state =5;
        $Ticket->save();
        $infoticket = DB::selectOne("SELECT t.id, s.state FROM tickets t INNER JOIN states s ON t.id_state = s.id WHERE t.id = $Ticket->id");
        ReportController::create_report("El usuario $user->email inicio la ejecución del ticket con id $Ticket->id", $user->id, 7);
        Mail::to($user_sender->email)->send(new modificate_ticket($user_sender,$user_destination, $infoticket));
    }else if ($Ticket->id_state == 5 || $Ticket->id_state == 6) {
        $Ticket->id_state =7;
        $Ticket->save();
        $infoticket = DB::selectOne("SELECT t.id, s.state FROM tickets t INNER JOIN states s ON t.id_state = s.id WHERE t.id = $Ticket->id");
        ReportController::create_report("El usuario $user->email finalizo la ejecución del ticket con id $Ticket->id", $user->id, 7);
        Mail::to($user_destination->email)->send(new modificate_ticket($user_destination,$user_destination, $infoticket));
    }





    return redirect()->route('dashboard.tickets')->with('message', 'Peticion realizada');
}

public function create_ticket(){
    $user = Auth::user();
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
    $priorities = Prioritie::all();
    $users = DB::select("SELECT * FROM users WHERE id_area = 2 AND id_state = 1 AND id <> $user->id");
    $themes_users = Theme_user::all();
        return view('dashboard.tickets.create', compact('user', 'themes_users','validate_user_sistemas', 'priorities','users'));
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

    if ($request->id_user_destination) {
        $new_ticket->id_user_destination = $request->id_user_destination;
    }else{

         $id_theme_user =  $request->id_theme_user;
         $user_sistemas = DB::selectOne("SELECT u.id FROM users u
         INNER JOIN charges c ON u.id_chargy = c.id
        WHERE c.id_area = 2 AND u.id_theme_user = $id_theme_user AND u.id_state = 1 ORDER BY RAND() LIMIT 1");

        if (!$user_sistemas) {
            $user_sistemas = DB::selectOne("SELECT u.id FROM users u
            INNER JOIN charges c ON u.id_chargy = c.id
           WHERE c.id_area = 2 AND u.id_state = 1 ORDER BY RAND() LIMIT 1");
        }
        $new_ticket->id_user_destination = $user_sistemas->id;
        }
    if ($request->hasFile('file')) {
        $file = $request->file('file');
        $fechaHoraActual = now()->format('Y-m-d_H-i-s');
        $name_file = $fechaHoraActual . '.' . $file->getClientOriginalExtension();
        $rutaImagen = public_path('storage/files/' . $name_file);
        $file->move(public_path('storage/files'), $name_file);
        $new_ticket->file = $name_file;
    }
    ReportController::create_report("El usuario $user->email creo un ticket llamado $new_ticket->name", $user->id, 4);
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
    $themes_users = Theme_user::all();
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
    return view("dashboard.users.edit_profile", compact("themes_users","user", "validation_jefe", "companies", "areas", "charges", "shops", "validate_user_sistemas"));

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

public function get_id($id){
    $hora = Prioritie::find($id)->hour;
    return response()->json(['hour' => $hora], 200);
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

public function ticket_detail($id){
    $user = Auth::user();
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
    $ticket = DB::selectOne("SELECT t.id, t.name, t.description, t.date_start, t.date_finally, p.priority, s.id AS id_state, s.state, us.name AS name_sender,  ud.name AS name_destination, ud.id AS id_user_destination , us.id AS id_user_sender
    FROM tickets t
    INNER JOIN priorities p ON t.id_priority = p.id
    INNER JOIN users us ON t.id_user_sender =us.id
    INNER JOIN users ud ON t.id_user_destination = ud.id
    INNER JOIN states s ON t.id_state = s.id WHERE t.id = $id");
    $file = DB::selectOne("SELECT t.file FROM tickets t WHERE t.id = $id")->file;
    $comments = DB::select("SELECT c.id, c.comment, c.date, u.name, u.id AS id_user, c.id_ticket FROM comments c INNER JOIN users u ON c.id_user = u.id WHERE c.id_ticket = $id ORDER BY c.id DESC");
    $calification = Calification::where("id_ticket", $id)->first();
    $user_sender = User::find($ticket->id_user_sender);
    $user_destination = User::find($ticket->id_user_destination);

    if ($ticket->id_user_destination == $user->id  && $ticket->id_state == 3) {
        $save_ticket = Ticket::find($id);
        $save_ticket->id_state = 4;
        $save_ticket->save();
        $ticket = DB::selectOne("SELECT t.id, t.name, t.description, t.date_start, t.date_finally, p.priority, s.id AS id_state, s.state, us.name AS name_sender,  ud.name AS name_destination, ud.id AS id_user_destination , us.id AS id_user_sender
        FROM tickets t
        INNER JOIN priorities p ON t.id_priority = p.id
        INNER JOIN users us ON t.id_user_sender =us.id
        INNER JOIN users ud ON t.id_user_destination = ud.id
        INNER JOIN states s ON t.id_state = s.id WHERE t.id = $id");
        ReportController::create_report("El usuario $user->email ha visto el ticket con id $ticket->id", $user->id, 7);
        Mail::to($user_sender->email)->send(new modificate_ticket($user_sender,$user_destination, $ticket));

    }
    return view("dashboard.tickets.view_ticket", compact("calification","validate_user_sistemas","ticket","file","comments"));

}

public function calification_ticket(Request $request){
    $user = Auth::user();
    $estrellas = $request->estrellas;
    $comment = $request->comment;
    $id_ticket = $request->id_ticket;
    $fechaActual = Carbon::now('America/Bogota');
    $fechaActual->locale('es');
    $fechaColombiana = $fechaActual->format('d F Y');
    $califications = Calification::where("id_ticket", $id_ticket)->first();
    if ($califications) {
        $califications->calification = $estrellas;
        $califications->comment = $comment;
        $califications->date = $fechaColombiana;
        $califications->save();

    }else{
        $new_calification = new Calification();
        $new_calification->calification = $estrellas;
        $new_calification->comment = $comment;
        $new_calification->id_user = $user->id;
        $new_calification->id_ticket = $id_ticket;
        $new_calification->date = $fechaColombiana;
        $new_calification->save();
    }
    $ticket = Ticket::find($id_ticket);
    ReportController::create_report("Se ha agregado una calificacion de $estrellas estrellas para el ticket con ID $ticket->id", $user->id, 7);
    $user_sender = User::find($ticket->id_user_destination);
    Mail::to($user_sender->email)->send(new calification_ticket($user_sender, $ticket));
    return redirect()->back()->with('message', 'Calificación Agregada con exito!');
}
public function comment_create(Request $request){

    $new_comment = new Comment();

    $fechaActual = Carbon::now('America/Bogota');
    $fechaActual->locale('es');
    $fechaColombiana = $fechaActual->format('d F Y');
    $new_comment->comment = $request->comment;
    $new_comment->date = $fechaColombiana;
     $new_comment->id_user = Auth::user()->id;
     $new_comment->id_ticket = $request->id_ticket;
     $new_comment->id_state = 1;


     $ticket = Ticket::find($request->id_ticket);
     $validate_sender = DB::selectOne("SELECT * FROM tickets t WHERE id=$request->id_ticket");
     if ($validate_sender->id_user_sender ==  Auth::user()->id) {
        $user = User::find($validate_sender->id_user_destination);
     }else{
        $user = User::find($validate_sender->id_user_sender);
     }
     ReportController::create_report("Se ha agregado un comentario para el ticket con ID $ticket->id", $user->id, 7);
     Mail::to($user->email)->send(new comment_ticket($user, $ticket));
     $new_comment->save();
     return redirect()->route('dashboard.tickets.ticket_detail', $request->id_ticket)->with("message","Comentario agregado con exito!");

}
public function comment_delete(Request $request){
    $user = Auth::user();
    $comment = Comment::find($request->id_comment);
    ReportController::create_report("Se ha eliminado el comentario con ID $comment->id para el ticket con ID $comment->id_ticket", $user->id, 7);
    $comment->delete();
    return redirect()->route('dashboard.tickets.ticket_detail', $request->id_ticket)->with("message","Comentario eliminado con exito!");
}
public function edit_ticket($id){
    $user = Auth::user();
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
        $users = DB::select("SELECT*FROM users WHERE id_area = 2 AND id_state =1");
        $ticket = DB::selectOne("SELECT t.id, t.name, t.description, t.date_start, t.date_finally, p.priority, s.id AS id_state, s.state, us.name AS name_sender,  ud.name AS name_destination, ud.id AS id_user_destination , us.id AS id_user_sender
        FROM tickets t
        INNER JOIN priorities p ON t.id_priority = p.id
        INNER JOIN users us ON t.id_user_sender =us.id
        INNER JOIN users ud ON t.id_user_destination = ud.id
        INNER JOIN states s ON t.id_state = s.id WHERE t.id = $id");
        return view("dashboard.tickets.edit_ticket", compact("users","ticket","validate_user_sistemas"));

}

public function notificate_finish_ticket_mail(Request $request){

    $ticket = DB::selectOne("SELECT t.id, t.name, t.description, t.date_start, t.date_finally, p.priority, s.id AS id_state, s.state, us.name AS name_sender,  ud.name AS name_destination, ud.id AS id_user_destination , us.id AS id_user_sender
        FROM tickets t
        INNER JOIN priorities p ON t.id_priority = p.id
        INNER JOIN users us ON t.id_user_sender =us.id
        INNER JOIN users ud ON t.id_user_destination = ud.id
        INNER JOIN states s ON t.id_state = s.id WHERE t.id = $request->id_ticket");
         $user_sender = User::find($ticket->id_user_sender);
         $user_destination = User::find($ticket->id_user_destination);
        Mail::to($user_sender->email)->send(new notificate_finish_ticket($user_sender, $user_destination ,$ticket));
        return redirect()->route("dashboard.tickets.ticket_detail", $ticket->id)->with('message','Usuario notificado!');

}

public function finish_ticket_mail(Request $request){
    $ticket = Ticket::find($request->id_ticket);
    if($ticket->id_state = 5){
        $ticket->id_state =7;
        $ticket->save();
    $user_sender = User::find($ticket->id_user_sender);
    $user_destination = User::find($ticket->id_user_destination);
    $infoticket = DB::selectOne("SELECT t.id, s.state FROM tickets t INNER JOIN states s ON t.id_state = s.id WHERE t.id = $ticket->id");
    ReportController::create_report("El usuario $user_sender->email finalizo la ejecución del ticket con id $ticket->id", $user_sender->id, 7);
    Mail::to($user_destination->email)->send(new modificate_ticket($user_destination,$user_destination, $infoticket));
    return view('dashboard.accept_emails.view_finish_ticket_mail', compact('user_destination','ticket'));
    }else{
        return redirect()->route("dashboard.tickets.ticket_detail", $ticket->id)->with('message_error','La acción no esta disponible verifica que el usuario este ejecutando el ticket');
    }

}
public function save_changes_ticket(Request $request){
    $user = Auth::user();
    $ticket = Ticket::find($request->id_ticket);
    $ticket->name = $request->name;
    $ticket->description = $request->description;
    if ($request->id_user_destination) {
        $ticket->id_user_destination = $request->id_user_destination;
    }
    if ($request->hasFile('file')) {
        $file = $request->file('file');
        $fechaHoraActual = now()->format('Y-m-d_H-i-s');
        $name_file = $fechaHoraActual . '.' . $file->getClientOriginalExtension();
        $rutaImagen = public_path('storage/files/' . $name_file);
        $file->move(public_path('storage/files'), $name_file);
        $ticket->file = $name_file;
    }
    ReportController::create_report("Se ha editado el ticket con ID $ticket->id", $user->id, 7);
    $user_destination = DB::selectOne("SELECT * FROM users WHERE id=$ticket->id_user_destination");
    Mail::to($user_destination->email)->send(new edit_ticket($user_destination, $ticket));
    $ticket->save();
    return redirect()->route('dashboard.tickets.ticket_detail', $request->id_ticket)->with("message","Ticket editado con exito!");
}

public function search_users(Request $request){
    $user = Auth::user();
    $validation_jefe = DB::selectOne("SELECT * FROM users u
    INNER JOIN charges c ON u.id_chargy = c.id
    WHERE c.chargy = 'JEFE DE AREA' AND u.id = $user->id");
    $users = ProfileController::users($user,$request->search);
    return view('dashboard.users.users', compact('users', 'validation_jefe'));
}
public function show_profile(){
    $user = Auth::user();
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
    $themes_users = Theme_user::all();
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
    return view("dashboard.users.edit_profile", compact("themes_users","validate_user_sistemas","user", "validation_jefe", "companies", "areas", "charges", "shops"));
}
public function show_directories(){

    $user = Auth::user();
    $directories = DB::select("SELECT d.code, d.id, d.name, d.directory, d.date_create, d.date_update, u.id AS id_user , u.name AS name_user, s.state, s.id AS id_state
    FROM directories d
    INNER JOIN users u ON d.id_user = u.id
    INNER JOIN areas a ON u.id_area = a.id
    INNER JOIN states s ON d.id_state = s.id
    WHERE a.id = $user->id_area AND d.id_state = 1 ORDER BY d.id DESC");

return view("dashboard.directories.directories",compact('user', 'directories'));


}

public function show_directories_search(Request $request){
    $user = Auth::user();
    $search = $request->search;
    $directories = DB::select("SELECT d.code, d.id, d.name, d.directory, d.date_create, d.date_update, u.id AS id_user , u.name AS name_user, s.state, s.id AS id_state
    FROM directories d
    INNER JOIN users u ON d.id_user = u.id
    INNER JOIN areas a ON u.id_area = a.id
    INNER JOIN states s ON d.id_state = s.id
    WHERE a.id = $user->id_area AND d.id_state = 1
    AND (d.id LIKE '%$search%' OR d.name LIKE '%$search%' OR d.date_create LIKE '%$search%' OR u.name LIKE '%$search%')
    ORDER BY d.id DESC");

return view("dashboard.directories.directories",compact('user', 'directories'));
}
public function create_repository(){
    return view("dashboard.directories.create");
}

public static function randNumer() {
    $d=rand(100000,999999);
    return $d;
}
public function save_directory(Request $request){
    $user = Auth::user();
    $directorie = new Directorie();

    $fechaActual = Carbon::now('America/Bogota');
$fechaColombiana = $fechaActual->format('d-m-Y H-i-s');
$code = ProfileController::randNumer();

    $ruta = public_path('storage/files/'.$fechaColombiana."/".$user->id);
    if (!File::exists($ruta)) {
        File::makeDirectory($ruta, 0777, true, true);

        $directorie->name = $request->name;
        $directorie->code = $code;
        $directorie->directory = $fechaColombiana."/".$user->id;
        $directorie->date_create =$fechaColombiana;
        $directorie->date_update =$fechaColombiana;
        $directorie->id_user =$user->id;
        $directorie->id_state =1;
        Mail::to($user->email)->send(new new_repository($user, $directorie));
        ReportController::create_report("Se ha creado un nuevo repositorio con llamado $request->name", $user->id, 12);
        $directorie->save();

        return redirect()->route('dashboard.directories')->with('message','Directorio creado correctamente');

}

}


public function view_directory(Request $request){

    $user = Auth::user();
    $id =  $request->id;
    $files = DB::select("SELECT f.id, f.file, f.name, f.date_create, f.date_update, f.id_directory, s.state, f.id_state, u.id AS id_user, u.name AS name_user, d.directory, d.id_user AS id_user_directory
    FROM files f
    INNER JOIN users u ON f.id_user = u.id
    INNER JOIN directories d ON f.id_directory = d.id
    INNER JOIN states s ON f.id_state = s.id WHERE d.id = $id AND f.id_state = 1 ORDER BY f.id DESC");
    return view('dashboard.directories.files.files', compact('files', 'user', 'id'));

}

public function view_directory_search(Request $request){
    $user = Auth::user();
    $id =  $request->id;
    $search =  $request->search;
    $files = DB::select("SELECT f.id, f.file, f.name, f.date_create, f.date_update, f.id_directory, s.state, f.id_state, u.id AS id_user, u.name AS name_user, d.directory, d.id_user AS id_user_directory
    FROM files f
    INNER JOIN users u ON f.id_user = u.id
    INNER JOIN directories d ON f.id_directory = d.id
    INNER JOIN states s ON f.id_state = s.id WHERE d.id = $id AND f.id_state = 1 AND (u.name LIKE '%$search%' OR d.name LIKE '%$search%' OR f.name LIKE '%$search%' OR f.id LIKE '%$search%') ORDER BY f.id DESC");
    return view('dashboard.directories.files.files', compact('files', 'user', 'id'));
}

public function create_file($id_directory){

    return view('dashboard.directories.files.create_file',compact('id_directory'));
}

public function save_file(Request $request){

    $user = Auth::user();
    $new_file = new ModelsFile();
    $id_directory = $request->id_directory;
    $fechaActual = Carbon::now('America/Bogota');
    $fechaColombiana = $fechaActual->format('d-m-Y H-i-s');
    $directory = DB::selectOne("SELECT * FROM directories WHERE id=$id_directory AND code=$request->code");
    if ($directory) {
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $fechaHoraActual = now()->format('Y-m-d_H-i-s');
            $name_file = $fechaHoraActual . '.' . $file->getClientOriginalExtension();
            $rutaImagen = public_path('storage/files/'.$directory->directory.'/'. $name_file);
            $file->move(public_path('storage/files/'.$directory->directory), $name_file);
            $new_file->name = $request->name;
            $new_file->file = $name_file;
            $new_file->id_directory = $id_directory;
            $new_file->id_state = 1;
            $new_file->id_user = $user->id;
            $new_file->date_create = $fechaColombiana;
            $new_file->date_update = $fechaColombiana;
            ReportController::create_report("Se ha creado un nuevo archivo con llamado $request->name en el directorio con ID $directory->id", $user->id, 14);
            $new_file->save();
            Mail::to($user->email)->send(new new_file($user, $directory, $new_file));
            return back()->with('message','Archivo creado con exito');
        }
    }else{
        return redirect()->route('dashboard.create_file', $id_directory)->with('message','Codigo de directorio incorrecto');
    }


}

public function view_file(Request $request){

    $id_directory = $request->id_directory;
    $id_file = $request->id_file;
    $directorie = Directorie::find($id_directory);
    $files_modified = DB::select("SELECT fm.id, fm.name, fm.file, fm.date_update, fm.id_file, u.id AS id_user, u.name AS name_user FROM files_modified fm
    INNER JOIN users u ON fm.id_user = u.id
    WHERE fm.id_file = $id_file ORDER BY fm.id DESC");
    $file = DB::selectOne("SELECT * FROM files WHERE id = $id_file");
    return  view('dashboard.directories.files.view_file',compact('directorie','files_modified','file'));
}

public function edit_file(Request $request){
$user = Auth::user();

$table_file = ModelsFile::find($request->id_file);
$id_directory = $request->id_directory;
$directory = Directorie::where('id', $id_directory)
->where('code', $request->code)
->first();

$file_modified = new Files_modified();
$fechaActual = Carbon::now('America/Bogota');
$fechaColombiana = $fechaActual->format('d-m-Y H-i-s');

if ($directory) {
    if ($request->hasFile('file')) {
        $file = $request->file('file');
        $fechaHoraActual = now()->format('Y-m-d_H-i-s');
        $name_file = $fechaHoraActual . '.' . $file->getClientOriginalExtension();
        $rutaImagen = public_path('storage/files/'.$directory->directory.'/'. $name_file);
        $file->move(public_path('storage/files/'.$directory->directory), $name_file);
        $file_modified->file = $table_file->file;
        $table_file->file = $name_file;
    }else{
        $file_modified->file = $table_file->file;
    }
    $file_modified->name = $table_file->name;
    $file_modified->date_update = $table_file->date_update;
    $file_modified->id_file = $table_file->id;
    $file_modified->id_user = $table_file->id_user;

    $table_file->name = $request->name;
    $table_file->date_update =$fechaColombiana;
    $table_file->id_user = $user->id;

    $directory->date_update =$fechaColombiana;


    $table_file->save();
    $file_modified->save();
    $directory->save();

    return back()->with('message','Cambios guardados con exito!');
}else{
    return back()->with('message_error','Codigo de directorio incorrecto');
}

}

public function delete_directory(Request $request){

    $id_directory = $request->id_directory;
    $directory = Directorie::find($id_directory);
    $directory->id_state = 2;
    $user = Auth::user();
    ReportController::create_report("Se ha eliminado un directorio llamado $directory->name con ID $id_directory", $user->id, 13);
    $directory->save();

    return back()->with('message','Directorio eliminado con exito');
}

public function delete_file(Request $request){

    $id_file = $request->id_file;
    $file = ModelsFile::find($id_file);
    $file->id_state = 2;
    $user = Auth::user();
    ReportController::create_report("Se ha eliminado un archivo llamado $file->name con ID $id_file", $user->id, 16);
    $file->save();
    return back()->with('message','Archivo eliminado con exito');
}

public function show_reports(Request $request){
$user = Auth::user();
$report_details = Report_detail::all();

if ($request->search != null && $request->filter != null) {
    $search = "WHERE (r.id LIKE '%$request->search%' OR r.description LIKE '%$request->search%' OR u.name LIKE '%$request->search%' OR r.date LIKE '%$request->search%') AND r.id_report_detail = $request->filter";
}else if ($request->search != null) {
    $search = "WHERE (r.id LIKE '%$request->search%' OR r.description LIKE '%$request->search%' OR u.name LIKE '%$request->search%' OR r.date LIKE '%$request->search%')";
} else if ($request->filter != null) {
    $search = "WHERE r.id_report_detail = $request->filter";
} else {
    $search = "";
}

$reports = DB::select("SELECT r.id, r.description, r.id_user, u.name AS name_user, r.date, rd.report, r.id_report_detail, u.id_area
FROM  reports r
INNER JOIN report_details rd ON r.id_report_detail = rd.id
INNER JOIN users u ON r.id_user = u.id $search ORDER BY r.id DESC");

return view('dashboard.reports.reports',compact('report_details', 'reports'));
}

public function show_permissions(Request $request){

    $user = Auth::user();
    if ($request->search != null) {
        $search = "WHERE (p.id LIKE '%$request->search%' OR p.date_application LIKE '%$request->search%'  OR p.observations LIKE '%$request->search%' OR u.name LIKE '%$request->search%' OR p.date_tomorrow LIKE '%$request->search%' OR s.state LIKE '%$request->search%')";
    } else {
        $search = " ";
    }
    $permissions = DB::select("SELECT p.id, p.date_application, r.reason, re.replenish_time, u.name, a.area, u.id_area, p.id_user_collaborator, p.id_state, s.state FROM permissions p
    INNER JOIN users u ON p.id_user_collaborator = u.id
    INNER JOIN states s ON p.id_state = s.id
    INNER JOIN reasons r ON p.id_reason = r.id
    INNER JOIN replenish_times re ON p.id_replenish_time = re.id
    INNER JOIN areas a ON u.id_area = a.id $search AND p.id_state <> 2 ORDER BY p.id DESC");
    $validation_jefe = DB::selectOne("SELECT * FROM users u
        INNER JOIN charges c ON u.id_chargy = c.id
         WHERE c.chargy = 'JEFE DE AREA' AND u.id = $user->id");
    return view('dashboard.permissions.permissions', compact('permissions', 'validation_jefe'));
}

public function create_permission(){

    $reasons = Reason::all();
    $replenish_times = Replenish_time::all();
    return view('dashboard.permissions.create', compact('reasons','replenish_times'));
}

public function save_permission(Request $request){
$user = Auth::user();
$jefe = DB::selectOne("SELECT * FROM users u
INNER JOIN charges c ON u.id_chargy = c.id
 WHERE c.chargy = 'JEFE DE AREA' AND u.id_area = $user->id_area");
$new_permission = new Permission();
$new_permission->date_application = $request->date_application;
if($request->date_tomorrow !== 0 && $request->date_tomorrow != '' && $request->date_tomorrow != null){
    $new_permission->date_tomorrow  = $request->date_tomorrow;
}
$new_permission->id_user_collaborator = $user->id;
$new_permission->observations = $request->observations;
$new_permission->id_reason = $request->id_reason;
$new_permission->id_replenish_time = $request->id_replenish_time;
$new_permission->id_state = 3;
$new_permission->save();
if ($jefe){
    Mail::to($jefe->email)->send(new create_permission($jefe, $new_permission, $user));
}
ReportController::create_report("Ha generado un permiso por/para $new_permission->observations", $user->id, 9);
return redirect()->route('dashboard.permissions')->with('message','Permiso generado con exito!');
}
public function delete_permission(Request $request){

    $id_permission = $request->id_permission;
    $permission = Permission::find($id_permission);
    $permission->id_state = 2;
    $permission->save();
    return back()->with('message','Permiso eliminado con exito!');

}
public function view_permission($id){
    $user = Auth::user();
    $validation_jefe = DB::selectOne("SELECT * FROM users u
    INNER JOIN charges c ON u.id_chargy = c.id
    WHERE c.chargy = 'JEFE DE AREA' AND u.id = $user->id");
    $permission = DB::selectOne("SELECT p.id, uc.name AS name_user, uc.nit, p.date_application, r.reason, re.replenish_time, s.state, p.id_state, p.observations
    FROM permissions p
    INNER JOIN users uc ON p.id_user_collaborator = uc.id
    INNER JOIN reasons r ON p.id_reason = r.id
    INNER JOIN replenish_times re ON p.id_replenish_time = re.id
    INNER JOIN states s ON p.id_state = s.id
    WHERE p.id = $id");
    $dates_permission = Permission::find($id);
    $user_boss = User::find($dates_permission->id_user_boss);
    $user_reception = User::find($dates_permission->id_user_reception);
    return view('dashboard.permissions.show_permission', compact('validation_jefe','permission', 'dates_permission','user_boss','user_reception'));
}

public function permission_approve(Request $request){
    $user = Auth::user();
    $id_permission =  $request->id_permission;
    $permission = Permission::find($id_permission);
    $permission->id_state = 10;
    $permission->id_user_boss = $user->id;
    $permission->save();
    $user_colaborator = User::find($permission->id_user_collaborator);
    ReportController::create_report("El jefe $user->name ha aprovado el permiso del colaborador $user_colaborator->name ", $user->id, 9);
    Mail::to($user_colaborator->email)->send(new action_permission($user_colaborator, " que el jefe de area $user->name ha aprovado su permiso con ID $id_permission"));
    return redirect()->route('dashboard.permissions.view_permission', $id_permission)->with('message','Permiso aprovado correctamente!');
}
public function permission_disapprove(Request $request){
    $user = Auth::user();
    $id_permission =  $request->id_permission;
    $permission = Permission::find($id_permission);
    $permission->id_state = 9;
    $permission->id_user_boss = $user->id;
    $permission->save();
    $user_colaborator = User::find($permission->id_user_collaborator);
    ReportController::create_report("El jefe $user->name ha desaprovado el permiso del colaborador $user_colaborator->name ", $user->id, 9);
    Mail::to($user_colaborator->email)->send(new action_permission($user_colaborator, " que el jefe de area $user->name ha desaprobado su permiso con ID $id_permission"));
    return redirect()->route('dashboard.permissions.view_permission', $id_permission)->with('message','Permiso rechazado correctamente!');
}
public function permission_user_exit(Request $request){
    $user = Auth::user();
    $id_permission =  $request->id_permission;
    $permission = Permission::find($id_permission);
    $permission->id_user_reception = $user->id;
    $permission->time_exit = $request->time_exit;
    $permission->save();
    $user_colaborator = User::find($permission->id_user_collaborator);
    $user_boss = User::find($permission->id_user_boss);
    ReportController::create_report("El recepcionista $user->name ha dado salida al colaborador $user_colaborator->name ", $user->id, 9);
    Mail::to($user_boss->email)->send(new action_permission($user_boss, " que el colaborador  $user_colaborator->name ha salido de las instalaciones con permiso de ID $id_permission"));
    return redirect()->route('dashboard.permissions.view_permission', $id_permission)->with('message','Hora de salida registrada correctamente!');
}
public function permission_user_return(Request $request){
    $user = Auth::user();
    $id_permission =  $request->id_permission;
    $permission = Permission::find($id_permission);
    $permission->id_user_reception = $user->id;
    $permission->time_return = $request->time_return;
    $permission->save();
    $user_colaborator = User::find($permission->id_user_collaborator);
    $user_boss = User::find($permission->id_user_boss);
    ReportController::create_report("El recepcionista $user->name ha dado entrada al colaborador $user_colaborator->name ", $user->id, 9);
    Mail::to($user_boss->email)->send(new action_permission($user_boss, " que el colaborador  $user_colaborator->name  ha regresado a las instalaciones con permiso de ID $id_permission"));
    return redirect()->route('dashboard.permissions.view_permission', $id_permission)->with('message','Hora de entrada registrada correctamente!');
}

public function show_certificates(Request $request){
$user = Auth::user();

if($request->search){
    $search = "AND (p.proceeding LIKE '%$request->search%' OR c.date LIKE '%$request->search%' OR ud.name LIKE '%$request->search%' OR ur.name LIKE '%$request->search%' OR s.state LIKE '%$request->search%')";
}else{
$search = "";
}
$certificates = DB::select("SELECT c.id, p.proceeding, c.date, ud.name AS name_delivery, ud.id AS id_user_delivery, ur.name AS name_receives, ur.id AS id_user_receives, s.state, c.id_state
FROM certificates c
INNER JOIN proceedings p ON c.id_proceeding = p.id
INNER JOIN users ud ON c.id_user_delivery = ud.id
INNER JOIN users ur ON c.id_user_receives = ur.id
INNER JOIN states s ON c.id_state = s.id
WHERE c.id_state <> 2 $search ORDER BY c.id DESC");

return view('dashboard.certificates.certificates', compact('user','certificates'));
}


public function create_certificate(){
    $my_user = Auth::user();
    $user = DB::selectOne("SELECT u.id,  a.area, u.name FROM users u
    INNER JOIN areas a ON u.id_area = a.id
    WHERE u.id = $my_user->id");
    $areas = Area::all();
    $proceedings = Proceeding::all();
    $origins_certificates = Origin_Certificate::all();
    $states_certificates = State_Certificate::all();
    $types_components = Type_Component::all();
    return view('dashboard.certificates.create', compact('user', 'areas', 'proceedings','origins_certificates','states_certificates','types_components'));
}

public function get_users_areas($id){

    $users = DB::select("SELECT * FROM users WHERE id_area = $id AND id_state <> 2");
    return response()->json(['users' => $users], 200);
}

public function save_certificate(Request $request){
    $user = Auth::user();
    $user_receive = User::find($request->id_user_receives);
    $new_certificate = new Certificate();
    $new_certificate->id_proceeding = $request->id_proceeding;
    $new_certificate->date = $request->date;
    $new_certificate->address = $request->address;
    $new_certificate->id_user_delivery = $user->id;
    $new_certificate->id_user_receives = $request->id_user_receives;
    $new_certificate->general_remarks = $request->general_remarks	;
    $new_certificate->id_state = 3;
    $new_certificate->save();
    $certificate = DB::selectOne("SELECT * FROM certificates WHERE date = '$request->date' AND id_user_delivery = $user->id AND address = '$request->address'");
    $user_receive = User::find($request->id_user_receives);
    ReportController::create_report("El usuario $user->name ha creado un acta para $user_receive->name para la siguiente dirección $request->address", $user->id, 17);
    Mail::to($user_receive->email)->send(new create_certificate($user_receive, $user,$certificate));
    return response()->json(['id_certificate'=> $certificate->id],200);
}

public function save_rows_certificate(Request $request){
$user = Auth::user();


$new_rows_certificate = new Row_Certificate();
$new_rows_certificate->id_product = $request->id_product;
$new_rows_certificate->id_certificate = $request->id_certificate;
$new_rows_certificate->save();

$certificate = Certificate::find($request->id_certificate);
$new_report_product = new Report_product();
$new_report_product->id_product = $request->id_product;
$new_report_product->id_certificate = $request->id_certificate;
$new_report_product->report = "El producto se encuentra pendiente asignado al acta  con ID $request->id_certificate  para la direcciòn $certificate->address";
$new_report_product->save();
return response()->json(['message'=> true],200);
}

public function delete_certificate(Request $request){
    $user = Auth::user();
    $id_certificate = $request->id_certificate;
    $certificate = Certificate::find($id_certificate);
    $rows_certificates = Row_Certificate::all()->where('id_certificate','=',$id_certificate);

    foreach ($rows_certificates as $r) {
        $new_report_product = new Report_product();
        $new_report_product->id_product = $r->id_product;
        $new_report_product->id_certificate = $id_certificate;
        $new_report_product->report = "El producto ya NO se encuentra asignado al acta  con ID $id_certificate";
        $new_report_product->save();
    }


    $certificate->id_state = 2;
    $certificate->save();
    $user_receive = User::find($certificate->id_user_receives);
    ReportController::create_report("El usuario $user->name ha eliminado el acta con ID $id_certificate para $user_receive->name para la siguiente dirección $request->address", $user->id, 17);
    Mail::to($user_receive->email)->send(new notification_certificate($user_receive, "que el usuario $user->name ha eliminado el certificado con ID $certificate->id y fecha $certificate->date"));
    return redirect()->route('dashboard.certificates')->with('message','Certificado eliminado con exito!');

}

public function view_certificate($id){

    $certificate = DB::selectOne("SELECT c.general_remarks, c.id, p.proceeding, c.date, c.address, s.state, c.id_state, ur.id AS id_user_receives, ud.id AS id_user_delivery, ur.name AS name_receives, ar.area AS area_receives, ud.name AS name_delivery, ad.area AS area_delivery
    FROM certificates c
    INNER JOIN proceedings p ON c.id_proceeding = p.id
    INNER JOIN states s ON c.id_state = s.id
    INNER JOIN users ur ON c.id_user_receives = ur.id
    INNER JOIN areas ar ON ur.id_area = ar.id
    INNER JOIN users ud ON c.id_user_delivery = ud.id
    INNER JOIN areas ad ON ur.id_area = ad.id
    WHERE c.id = $id");

    $user_reception = DB::selectOne("SELECT u.name, u.id FROM users u
    INNER JOIN certificates c ON u.id = c.id_user_reception WHERE c.id = $id");
    $certificate_full = Certificate::find($id);
 $rows_certificate = DB::select("SELECT r.id, p.id AS id_product, p.name, p.brand, p.serie, o.origin_certificate, s.state_certificate, t.type_component, p.accessories
 FROM rows_certificates r
 INNER JOIN products p ON r.id_product = p.id
 INNER JOIN origins_certificates o ON p.id_origin_certificate = o.id
 INNER JOIN states_certificates s ON p.id_state_certificate = s.id
 INNER JOIN type_components t ON p.id_type_component = t.id WHERE r.id_certificate = $id");
 return view('dashboard.certificates.view_certificate',compact('certificate','user_reception','certificate_full','rows_certificate'));
}

public function state_certificate(Request $request){
$user = Auth::user();
    $id_certificate = $request->id_certificate;
    $date = $request->date;
    $certificate = Certificate::find($id_certificate);
    $user_receive = User::find($certificate->id_user_receives);
    $user_delivery = User::find($certificate->id_user_delivery);
    if ($request->hasFile('file')) {
        $file = $request->file('file');
        $fechaHoraActual = now()->format('Y-m-d_H-i-s');
        $name_file = $fechaHoraActual . '.' . $file->getClientOriginalExtension();
        $rutaImagen = public_path('storage/files/' . $name_file);
        $file->move(public_path('storage/files'), $name_file);
        // $new_ticket->file = $name_file;
    }

    if ($certificate->id_state == 3) {
        $certificate->id_state = 11;
        $certificate->image_exit = $name_file;
        $certificate->date_exit = $date;
        $certificate->id_user_reception = $user->id;
        ReportController::create_report("El usuario $user->name ha Despachado los componentes asignados al acta con ID $id_certificate para $user_receive->name para la siguiente dirección $certificate->address", $user->id, 17);
        Mail::to($user_receive->email)->send(new accept_certificate($user_receive, "que el acta con ID $certificate->id y fecha $certificate->date salio de las instalaciones para la direccion expecificada: $certificate->address", $certificate));
    }else{
        $certificate->id_state = 12;
        $certificate->image_delivery = $name_file;
        $certificate->date_delivery = $date;
        ReportController::create_report("El usuario $user_delivery->name ha recibido los componentes asignados al acta con ID $id_certificate para la siguiente dirección $certificate->address", $user->id, 17);
        Mail::to($user_delivery->email)->send(new notification_certificate($user_delivery, "que el acta con ID $certificate->id y fecha $certificate->date ha llegado al punto y ha sido recibido con exito!"));
    }


    $certificate->save();

    $rows_certificates = Row_Certificate::all()->where('id_certificate','=',$id_certificate);
    $state_certificate = DB::selectOne("SELECT s.state FROM certificates c INNER JOIN states s ON c.id_state = s.id WHERE c.id=$id_certificate")->state;

    foreach ($rows_certificates as $r) {
        $new_report_product = new Report_product();
        $new_report_product->id_product = $r->id_product;
        $new_report_product->id_certificate = $id_certificate;
        $new_report_product->report = "El producto asociado al acta con ID $certificate->id y fecha $certificate->address esta en estado $state_certificate";
        $new_report_product->save();
    }

    return redirect()->route('dashboard.certificates.view_certificate',$id_certificate)->with('message', 'Accion realizada con exito');
}


public function show_inventories(Request $request){
$search = $request->search;
    if($request->search !== null && $request->filter !== null){
        $sql = "INNER JOIN origins_certificates o ON p.id_origin_certificate = o.id
        INNER JOIN states_certificates s ON p.id_state_certificate = s.id
        INNER JOIN type_components t ON p.id_type_component = t.id
        INNER JOIN rows_certificates rs ON p.id = rs.id_product
        INNER JOIN certificates c ON rs.id_certificate = c.id
        WHERE (p.id LIKE '%$request->search%' OR p.name LIKE '%$request->search%' OR p.serie LIKE '%$request->search%' OR p.brand LIKE '%$request->search%' OR p.accessories LIKE '%$request->search%' OR o.origin_certificate LIKE '%$request->search%' OR s.state_certificate LIKE '%$request->search%' OR t.type_component LIKE '%$request->search%')
        AND c.id_state = $request->filter AND p.id_state = 1";
    }else if($request->search !== null){
        $sql = "INNER JOIN origins_certificates o ON p.id_origin_certificate = o.id
        INNER JOIN states_certificates s ON p.id_state_certificate = s.id
        INNER JOIN type_components t ON p.id_type_component = t.id
        WHERE (p.id LIKE '%$request->search%' OR p.name LIKE '%$request->search%' OR p.serie LIKE '%$request->search%' OR p.brand LIKE '%$request->search%' OR p.accessories LIKE '%$request->search%' OR o.origin_certificate LIKE '%$request->search%' OR s.state_certificate LIKE '%$request->search%' OR t.type_component LIKE '%$request->search%')
        AND p.id_state = 1";
    }else if($request->filter !== null){
        $sql = "INNER JOIN rows_certificates rs ON p.id = rs.id_product
        INNER JOIN certificates c ON rs.id_certificate = c.id
        INNER JOIN type_components t ON p.id_type_component = t.id
        WHERE c.id_state = $request->filter AND p.id_state = 1";
    }else{
        $sql = "WHERE p.id_state = 1";
    }
    $products = DB::select("SELECT p.id, p.name, p.serie FROM products p $sql ORDER BY p.id DESC");
    $images_products = Image_product::all()->where('id_state','=',1);
    $user = Auth::user();
    $filters = DB::select("SELECT * FROM states WHERE id = 3 OR id=11");
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
    if($validate_user_sistemas){
    return view('dashboard.inventories.inventories', compact('products', 'images_products','filters','search'));
    }else{
        return redirect()->route('dashboard')->with('message_error','No tienes acceso a ese apartado');
    }
}

public function create_product(){

    $areas = Area::all();
    $origins_certificates = Origin_Certificate::all();
    $states_certificates = State_Certificate::all();
    $types_components = Type_Component::all();
    return view('dashboard.inventories.create', compact('areas','origins_certificates','states_certificates','types_components'));
}

public function save_product(Request $request){


    $product = new Product();
    $validation = DB::selectOne("SELECT * FROM products WHERE id_state = 1 AND serie  LIKE '%$request->serie%'");
    $user = Auth::user();
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
    if($validate_user_sistemas){
    if($validation){
        return redirect()->back()->with('message_error','Ya existe un producto con esa serial');
    }else{
        $product->name = $request->name;
        $product->brand = $request->brand;
        $product->serie = $request->serie;
        $product->accessories = $request->accessories;
        $product->id_type_component = $request->id_type_component;
        $product->id_state_certificate = $request->id_state_certificate;
        $product->id_origin_certificate = $request->id_origin_certificate;
        $product->id_state = 1;
        $product->save();
        $id_product = DB::selectOne("SELECT * FROM products WHERE serie = '$request->serie' AND id_state = 1")->id;
        ReportController::create_report("El usuario $user->name ha creado un producto con la siguiente serial $request->serie", $user->id, 18);
            $jefe_sistemas = DB::selectOne("SELECT * FROM users u
            INNER JOIN charges c ON u.id_chargy = c.id
            WHERE c.chargy = 'JEFE DE AREA' AND u.id_area = 2 AND u.id_state = 1");
            Mail::to($jefe_sistemas->email)->send(new create_product($jefe_sistemas, $product));

    }
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $fechaHoraActual = now()->format('Y-m-d_H-i-s');
            $name_file = $fechaHoraActual . '.' . $file->getClientOriginalExtension();
            $rutaImagen = public_path('storage/files/' . $name_file);
            $file->move(public_path('storage/files'), $name_file);
            $image_product = new Image_product();
            $image_product->image = $name_file;
            $image_product->id_product = $id_product;
            $image_product->id_state = 1;
            $image_product->save();
            return redirect()->route('dashboard.inventories')->with('message','Producto guardado con exito');
        }else{
            return redirect()->route('dashboard.inventories')->with('message','Producto guardado sin imagen!');
        }

}else{
    return redirect()->route('dashboard')->with('message_error','No tienes acceso a ese apartado');
}
}

public function get_dates_product($id){

    $product = DB::selectOne("SELECT p.id, p.name, p.brand, p.serie, o.origin_certificate, s.state_certificate, t.type_component, p.accessories
 FROM products p
 INNER JOIN origins_certificates o ON p.id_origin_certificate = o.id
 INNER JOIN states_certificates s ON p.id_state_certificate = s.id
 INNER JOIN type_components t ON p.id_type_component = t.id WHERE p.id = $id AND p.id_state = 1");

$validation_product = DB::select("SELECT * FROM products p
 INNER JOIN rows_certificates rs ON p.id = rs.id_product
INNER JOIN certificates c ON rs.id_certificate = c.id
INNER JOIN type_components t ON p.id_type_component = t.id
WHERE p.id = $id AND p.id_state = 1 AND (c.id_state = 3 || c.id_state = 11 )");
 if($product && !$validation_product){
    return response()->json(['product' => $product], 200);
 }else{
    return response()->json(['product' => false], 200);
 }
}


public function delete_product(Request $request){

    $user = Auth::user();
    $product = Product::find($request->id_product);
    $product->id_state =2;
    $product->save();
    ReportController::create_report("El usuario $user->name ha eliminado el producto con la siguiente serial $product->serie", $user->id, 18);
    return redirect()->back()->with('message','Producto eliminado con exito');
}

public function view_product($id){

    $user = Auth::user();

    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
        $origins_certificates = Origin_Certificate::all();
        $states_certificates = State_Certificate::all();
        $types_components = Type_Component::all();
        $product = Product::find($id);
        $images_product = DB::select("SELECT * FROM images_products WHERE id_product = $id AND id_state = 1");
        $reports_product = Report_Product::orderBy('id', 'desc')->where('id_product','=',$id)->get();
        return view('dashboard.inventories.view_products',compact('reports_product','validate_user_sistemas','images_product','origins_certificates','states_certificates','types_components','product'));
}


public function images_product($id){

    $user = Auth::user();
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
    if($validate_user_sistemas){
    $images_product = DB::select("SELECT * FROM images_products WHERE id_product = $id AND id_state = 1");
    $product = Product::find($id);
    return view('dashboard.inventories.images_product',compact('images_product','product'));
}
    else{
        return redirect()->route('dashboard')->with('message_error','No tienes acceso a ese apartado');
    }
}

public function save_image_product(Request $request){

    $user = Auth::user();
    $id_product = $request->id_product;
    if ($request->hasFile('file')) {
        $file = $request->file('file');
        $fechaHoraActual = now()->format('Y-m-d_H-i-s');
        $name_file = $fechaHoraActual . '.' . $file->getClientOriginalExtension();
        $rutaImagen = public_path('storage/files/' . $name_file);
        $file->move(public_path('storage/files'), $name_file);
        $image_product = new Image_product();
        $image_product->image = $name_file;
        $image_product->id_product = $id_product;
        $image_product->id_state = 1;
        $image_product->save();
        return redirect()->route('dashboard.inventories.view_product.images_product', $id_product)->with('message','Imagen guardada con exito');
    }else{
        return redirect()->route('dashboard.inventories.view_product.images_product', $id_product)->with('message_error','Imagen no insertada');
    }
}

public function delete_image_product(Request $request){
    $user = Auth::user();
    $id_product = $request->id_product;
    $id_image_product = $request->id_image_product;
    $image_product = Image_product::find($id_image_product);
        $image_product->id_state = 2;
        $image_product->save();
        return redirect()->route('dashboard.inventories.view_product.images_product', $id_product)->with('message','Imagen eliminada con exito');
}

public function save_changes_view_product(Request $request){

    $user = Auth::user();
    $id_product = $request->id_product;
    $product = Product::find($id_product);
    $validation_serie = DB::select("SELECT * FROM products WHERE serie LIKE '%$request->serie%'");
    $product->name = $request->name;
    $product->brand = $request->brand;
    $product->accessories = $request->accessories;
    $product->id_type_component = $request->id_type_component;
    $product->id_state_certificate = $request->id_state_certificate;
    $product->id_origin_certificate = $request->id_origin_certificate;
    $message = "";
    if ($request->hasFile('file')) {
        $file = $request->file('file');
        $fechaHoraActual = now()->format('Y-m-d_H-i-s');
        $name_file = $fechaHoraActual . '.' . $file->getClientOriginalExtension();
        $rutaImagen = public_path('storage/files/' . $name_file);
        $file->move(public_path('storage/files'), $name_file);
        $image_product = Image_product::where('id_product','=',"$id_product")->where('id_state','=','1')->first();
        $image_product->image = $name_file;
        $image_product->save();
        $message = "CON IMAGEN PRINCIPAL NUEVA";
    }
    if  (!$validation_serie){
        $product->serie = $request->serie;
        $message = "CON SERIAL NUEVA";
    }else if($validation_serie){
        $message = "SIN CAMBIO DE SERIAL (Puede ser por existencia en otro producto o porque ya lo tiene este mismo producto)";
    }
    ReportController::create_report("El usuario $user->name ha cambiado los datos del producto con la siguiente serial $product->serie con ID $product->id", $user->id, 18);
    $product->save();
    return redirect()->route('dashboard.inventories.view_product', $id_product)->with('message',"datos ingresados correctamente $message");
}

public function get_serie(){

    $finish = false;
    while(!$finish){
    $alfanumerico = str::random(4);
    $serie = "REF".$alfanumerico;
    $validation = Product::where('serie','=',"$serie")->where('id_state', 1)->first();
    if(!$validation){
        $finish = true;
        return response()->json(['serie' => $serie], 200);
    }
    }
}
}
