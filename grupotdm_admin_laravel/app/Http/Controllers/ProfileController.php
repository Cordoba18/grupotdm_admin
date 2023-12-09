<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use App\Mail\ActionUser;
use App\Mail\comment_ticket;
use App\Mail\create_ticket;
use App\Mail\create_user;
use App\Mail\edit_ticket;
use App\Mail\modificate_ticket;
use App\Mail\new_file;
use App\Mail\new_repository;
use App\Models\Area;
use App\Models\Charge;
use App\Models\Comment;
use App\Models\Companie;
use App\Models\Directorie;
use App\Models\File as ModelsFile;
use App\Models\Files_modified;
use App\Models\Prioritie;
use App\Models\Shop;
use App\Models\Ticket;
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
    $user = Auth::user();
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
if ($validate_user_sistemas) {
    $tickets = DB::select("SELECT t.id, t.name, t.description, t.date_start, t.date_finally, p.priority, s.id AS id_state, s.state, us.name AS name_sender,  ud.name AS name_destination, ud.id AS id_user_destination , us.id AS id_user_sender
    FROM tickets t
    INNER JOIN priorities p ON t.id_priority = p.id
    INNER JOIN users us ON t.id_user_sender =us.id
    INNER JOIN users ud ON t.id_user_destination = ud.id
    INNER JOIN states s ON t.id_state = s.id  WHERE t.id_state <> 2 ORDER BY t.id DESC");



} else {
    $tickets = DB::select("SELECT t.id, t.name, t.description, t.date_start, t.date_finally, p.priority, s.id AS id_state, s.state, us.name AS name_sender,  ud.name AS name_destination, ud.id AS id_user_destination , us.id AS id_user_sender
    FROM tickets t
    INNER JOIN priorities p ON t.id_priority = p.id
    INNER JOIN users us ON t.id_user_sender =us.id
    INNER JOIN users ud ON t.id_user_destination = ud.id
    INNER JOIN states s ON t.id_state = s.id WHERE (us.id = $user->id OR ud.id = $user->id) AND t.id_state <> 2 ORDER BY t.id DESC");

}

foreach ($tickets as $t) {
    $ticket = Ticket::find($t->id);
    $action = false;
    if ($t->id_user_destination == $user->id && $t->id_state == 3) {
        $ticket->id_state = 4;
        $action = true;
    }

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
Mail::to($user_sender->email)->send(new modificate_ticket($user_sender,$user_destination, $infoticket));
}
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
    $infoticket = DB::selectOne("SELECT t.id, s.state FROM tickets t INNER JOIN states s ON t.id_state = s.id WHERE t.id = $Ticket->id");
    $user_sender = User::find($Ticket->id_user_sender);
    $user_destination = User::find($Ticket->id_user_destination);
    Mail::to($user_sender->email)->send(new modificate_ticket($user_sender,$user_destination, $infoticket));

    return redirect()->route('dashboard.tickets')->with('message', 'Peticion realizada');
}

public function create_ticket(){
    $user = Auth::user();
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
    $priorities = Prioritie::all();
    $users = DB::select("SELECT * FROM users WHERE id_area = 2 AND id_state = 1 AND id <> $user->id");

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
    if ($request->hasFile('file')) {
        $file = $request->file('file');
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

public function view_user($id){

    $user = DB::selectOne("SELECT u.id, u.name, u.nit, u.email,c.company, s.state, a.area, ch.chargy
    FROM users u
    INNER JOIN companies c ON u.id_company = c.id
    INNER JOIN states s ON u.id_state = s.id
    INNER JOIN areas a ON u.id_area = a.id
    INNER JOIN charges ch ON u.id_chargy = ch.id
    WHERE u.id = $id");
    $shop = DB::selectOne("SELECT s.shop FROM users u INNER JOIN shops s ON u.id_shop = s.id");
    if ($shop) {
        $shop = $shop->shop;
    }else{
        $shop = null;
    }
    return view('dashboard.users.view_user', compact('user', 'shop'));
}

public function ticket_detail($id){

    $ticket = DB::selectOne("SELECT t.id, t.name, t.description, t.date_start, t.date_finally, p.priority, s.id AS id_state, s.state, us.name AS name_sender,  ud.name AS name_destination, ud.id AS id_user_destination , us.id AS id_user_sender
    FROM tickets t
    INNER JOIN priorities p ON t.id_priority = p.id
    INNER JOIN users us ON t.id_user_sender =us.id
    INNER JOIN users ud ON t.id_user_destination = ud.id
    INNER JOIN states s ON t.id_state = s.id WHERE t.id = $id");
    $file = DB::selectOne("SELECT t.file FROM tickets t WHERE t.id = $id")->file;
    $comments = DB::select("SELECT c.id, c.comment, c.date, u.name, u.id AS id_user, c.id_ticket FROM comments c INNER JOIN users u ON c.id_user = u.id WHERE c.id_ticket = $id ORDER BY c.id DESC");
    return view("dashboard.tickets.view_ticket", compact("ticket","file","comments"));

}
public function comment_create(Request $request){

    $new_comment = new Comment();

    $fechaActual = Carbon::now();
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

     Mail::to($user->email)->send(new comment_ticket($user, $ticket));
     $new_comment->save();
     return redirect()->route('dashboard.tickets.ticket_detail', $request->id_ticket)->with("message","Comentario agregado con exito!");

}
public function comment_delete(Request $request){

    $comment = Comment::find($request->id_comment);
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

public function save_changes_ticket(Request $request){

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
    return view("dashboard.users.edit_profile", compact("user", "validation_jefe", "companies", "areas", "charges", "shops"));
}
public function show_directories(){

    $user = Auth::user();
    $directories = DB::select("SELECT d.id, d.name, d.directory, d.date_create, d.date_update, u.id AS id_user , u.name AS name_user, s.state, s.id AS id_state
    FROM directories d
    INNER JOIN users u ON d.id_user = u.id
    INNER JOIN areas a ON u.id_area = a.id
    INNER JOIN states s ON d.id_state = s.id
    WHERE a.id = $user->id_area AND d.id_state = 1 ORDER BY d.id DESC");

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
        $directorie->save();
        return redirect()->route('dashboard.directories')->with('message','Directorio creado correctamente');

}

}


public function view_directory($id){

    $user = Auth::user();
    $files = DB::select("SELECT f.id, f.file, f.name, f.date_create, f.date_update, f.id_directory, s.state, f.id_state, u.id AS id_user, u.name AS name_user, d.directory, d.id_user AS id_user_directory
    FROM files f
    INNER JOIN users u ON f.id_user = u.id
    INNER JOIN directories d ON f.id_directory = d.id
    INNER JOIN states s ON f.id_state = s.id WHERE d.id = $id AND f.id_state = 1 ORDER BY f.id DESC");
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
            Mail::to($user->email)->send(new new_file($user, $directory, $new_file));
            $new_file->save();
            return redirect()->route('dashboard.view_directory', $id_directory)->with('message','Archivo creado con exito');
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
    $directory->save();
    return back()->with('message','Directorio eliminado con exito');
}

public function delete_file(Request $request){

    $id_file = $request->id_file;
    $file = ModelsFile::find($id_file);
    $file->id_state = 2;
    $file->save();
    return back()->with('message','Archivo eliminado con exito');
}
}
