<?php
//Importaciones
namespace App\Http\Controllers;
use App\Events\CreateTicket;
use App\Events\Delete_Comment;
use App\Events\StateTicket;
use App\Events\Writting_Comment;
use App\Events\Comment_Ticket AS EventsComment_Ticket;
use App\Mail\calification_ticket;
use App\Mail\comment_ticket;
use App\Mail\create_ticket;
use App\Mail\edit_ticket;
use App\Mail\modificate_ticket;
use App\Mail\notificate_finish_ticket;
use App\Models\Calification;
use App\Models\Comment;
use App\Models\Prioritie;
use App\Models\Theme_user;
use App\Models\Ticket;
use App\Models\User;
use Carbon\Carbon;
use DateTime;
use DateTimeZone;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

//Declaracion de clase
class TicketsController extends Controller
{

    //Validamos la autenticacion del usuario
    public function __construct()
    {
        $this->middleware('auth');
    }


    //funcion que me retornar la vista para ver los tickets
    public function show_tickets(){

        $tickets_all = Ticket::all();
        $user = Auth::user();
        $search =null;
        $filter =null;
        $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
        //accedemos a una funcion que retorna los tickets
        $tickets = TicketsController::get_tickets($validate_user_sistemas, $user ,null, null);
    $filters = DB::select("SELECT * FROM states WHERE id = 3 OR id=4 OR id=5 OR id=6 OR id=7");
        return view('dashboard.tickets.show',compact('tickets' , 'validate_user_sistemas', 'filters','search','filter','tickets_all'));
    }

    //Funcion que me permite buscar tickets y mostrarlos
    public function show_tickets_filter_search(Request $request){

        $tickets_all = Ticket::all();
        $user = Auth::user();
        $search = $request->search;
        $filter = $request->filter;
        $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
        //Obtenemos los tickets por medio de la funcion
        $tickets = TicketsController::get_tickets($validate_user_sistemas, $user ,$request->search,$request->filter);
    $filters = DB::select("SELECT * FROM states WHERE id = 3 OR id=4 OR id=5 OR id=6 OR id=7");
        return view('dashboard.tickets.show',compact('tickets' , 'validate_user_sistemas', 'filters', 'search', 'filter','tickets_all'));
    }


    //funcion que me permite retornar la vista para crear el ticket
public function create_ticket(){
    $user = Auth::user();
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
    $priorities = Prioritie::all();
    $users = DB::select("SELECT * FROM users WHERE id_area = 2 AND id_state = 1 AND id <> $user->id");
    $themes_users = Theme_user::all();
        return view('dashboard.tickets.create', compact('user', 'themes_users','validate_user_sistemas', 'priorities','users'));
}


//funcion que me permite obtener la hora de la prioridad para un ticket
public function get_id($id){
    $hora = Prioritie::find($id)->hour;
    //retorna al archivo JS
    return response()->json(['hour' => $hora], 200);
}


//funcion que me permite cambiar tickets de estados
public function state(Request $request){
    $user = Auth::user();
    $Ticket = Ticket::find($request->id_ticket);
    $user_sender = User::find($Ticket->id_user_sender);
    $user_destination = User::find($Ticket->id_user_destination);
    //verificamos si el ticket esta visto por el usuario
    if ($Ticket->id_state == 4) {
        //Cambiamos el ticket a estado de EN EJECUCION
        $Ticket->id_state =5;
        $Ticket->save();
        $infoticket = DB::selectOne("SELECT t.id, s.state FROM tickets t INNER JOIN states s ON t.id_state = s.id WHERE t.id = $Ticket->id");
        //Generamos reporte para el usuario
        ReportController::create_report("El usuario $user->email inicio la ejecución del ticket con id $Ticket->id", $user->id, 7);
        //Generamos correo
        Mail::to($user_sender->email)->send(new modificate_ticket($user_sender,$user_destination, $infoticket));
        //Generamos la notificación
        NotificationController::create_notification("Su ticket ha sido ejecutado", $Ticket->id_user_sender , route('dashboard.tickets.ticket_detail', $Ticket->id));
    }else if ($Ticket->id_state == 5 || $Ticket->id_state == 6) {
        //Cambiamos el ticket a estado de FINALIZADO
        $Ticket->id_state =7;
        $Ticket->save();
        $infoticket = DB::selectOne("SELECT t.id, s.state FROM tickets t INNER JOIN states s ON t.id_state = s.id WHERE t.id = $Ticket->id");
        //Generamos el reporte
        ReportController::create_report("El usuario $user->email finalizo la ejecución del ticket con id $Ticket->id", $user->id, 7);
        //Generamos un correo
        Mail::to($user_destination->email)->send(new modificate_ticket($user_destination,$user_destination, $infoticket));
        //Generamos una notificación
        NotificationController::create_notification("Su ticket ha sido cerrado con exito!", $Ticket->id_user_destination , route('dashboard.tickets.ticket_detail', $Ticket->id));
    }


    $ticket = DB::selectOne("SELECT  t.id, t.name, t.description, t.date_start, t.date_finally, p.priority, ud.id_area AS id_area_user_destination, s.id AS id_state, s.state, us.name AS name_sender,  ud.name AS name_destination, ud.id AS id_user_destination, us.id AS id_user_sender
    FROM tickets t
    INNER JOIN priorities p ON t.id_priority = p.id
    INNER JOIN users us ON t.id_user_sender =us.id
    INNER JOIN users ud ON t.id_user_destination = ud.id
    INNER JOIN states s ON t.id_state = s.id  WHERE t.id = $Ticket->id");
    //Emitimos evento para el cambio de estado de ticket
    broadcast(new StateTicket($ticket))->toOthers();
    return redirect()->route('dashboard.tickets.ticket_detail', $ticket->id)->with('message', 'Peticion realizada');
}


//Funcion que me permite eliminar o re abrir un ticket
public function delete_ticket(Request $request){

    $user = Auth::user();
    $Ticket = Ticket::find($request->id_ticket);
    //Validamos si el ticket esta en estado FINALIZADO
    if($Ticket->id_state == 7){
        //Ponemos ticket en estado pendiente
        $Ticket->id_state = 3;
        //Generamos el reporte
        ReportController::create_report("El usuario $user->email Re abrio el ticket con id $Ticket->id", $user->id, 11);
        //Notificamos al usuario de destino
        NotificationController::create_notification("El ticket impuesto para ti ha sido re abierto!", $Ticket->id_user_destination , route('dashboard.tickets.ticket_detail', $Ticket->id));
    }else{
        $Ticket->id_state =2;
        //Generamos el reporte
        ReportController::create_report("El usuario $user->email ha eliminado el ticket con id $Ticket->id", $user->id, 6);
        //Notificamos al usuario de destino
        NotificationController::create_notification("El ticket impuesto para ti ha sido eliminado!", $Ticket->id_user_destination , route('dashboard.tickets.ticket_detail', $Ticket->id));
    }

    $Ticket->save();
    $infoticket = DB::selectOne("SELECT t.id, s.state FROM tickets t INNER JOIN states s ON t.id_state = s.id WHERE t.id = $Ticket->id");
    $user_sender = User::find($Ticket->id_user_sender);
    $user_destination = User::find($Ticket->id_user_destination);
    //Generamos correo parar el usuario de destino
    Mail::to($user_destination->email)->send(new modificate_ticket($user_destination,$user_destination, $infoticket));
    $ticket = DB::selectOne("SELECT  t.id, t.name, t.description, t.date_start, t.date_finally, p.priority, ud.id_area AS id_area_user_destination, s.id AS id_state, s.state, us.name AS name_sender,  ud.name AS name_destination, ud.id AS id_user_destination, us.id AS id_user_sender
    FROM tickets t
    INNER JOIN priorities p ON t.id_priority = p.id
    INNER JOIN users us ON t.id_user_sender =us.id
    INNER JOIN users ud ON t.id_user_destination = ud.id
    INNER JOIN states s ON t.id_state = s.id  WHERE t.id = $Ticket->id");
    //Noficamos el cambio de estado de ticket
    broadcast(new StateTicket($ticket))->toOthers();
    return redirect()->route('dashboard.tickets')->with('message', 'Ticket eliminado con exito');
}

//Funcion que me permite ver el detalle de un ticket
public function ticket_detail($id){
    $user = Auth::user();
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
    $ticket = DB::selectOne("SELECT t.id, t.name, t.description, t.date_start, t.date_finally, p.priority, ud.id_area AS id_area_user_destination, s.id AS id_state, s.state, us.name AS name_sender,  ud.name AS name_destination, ud.id AS id_user_destination, us.id AS id_user_sender
    FROM tickets t
    INNER JOIN priorities p ON t.id_priority = p.id
    INNER JOIN users us ON t.id_user_sender =us.id
    INNER JOIN users ud ON t.id_user_destination = ud.id
    INNER JOIN states s ON t.id_state = s.id  WHERE t.id = $id");
    $file = DB::selectOne("SELECT t.file FROM tickets t WHERE t.id = $id")->file;
    $comments = DB::select("SELECT c.id, c.comment, c.date, u.name, u.id AS id_user, c.id_ticket FROM comments c INNER JOIN users u ON c.id_user = u.id WHERE c.id_ticket = $id");
    $calification = Calification::where("id_ticket", $id)->first();
    $user_sender = User::find($ticket->id_user_sender);
    $user_destination = User::find($ticket->id_user_destination);
//Validamos si el ticket no esta visto y el usuario de destino es el que esta entrando en el
    if ($ticket->id_user_destination == $user->id  && $ticket->id_state == 3) {
        $save_ticket = Ticket::find($id);
        $save_ticket->id_state = 4;
        $save_ticket->save();
        $ticket = DB::selectOne("SELECT t.id, t.name, t.description, t.date_start, t.date_finally, p.priority, ud.id_area AS id_area_user_destination, s.id AS id_state, s.state, us.name AS name_sender,  ud.name AS name_destination, ud.id AS id_user_destination, us.id AS id_user_sender
        FROM tickets t
        INNER JOIN priorities p ON t.id_priority = p.id
        INNER JOIN users us ON t.id_user_sender =us.id
        INNER JOIN users ud ON t.id_user_destination = ud.id
        INNER JOIN states s ON t.id_state = s.id  WHERE t.id = $id");
        //Generamos el reporte
        ReportController::create_report("El usuario $user->email ha visto el ticket con id $ticket->id", $user->id, 7);
        //Generamos el correo
        Mail::to($user_sender->email)->send(new modificate_ticket($user_sender,$user_destination, $ticket));
        //Notificamos
        NotificationController::create_notification("Su ticket ha sido VISTO y esta previo a ejecución", $ticket->id_user_sender , route('dashboard.tickets.ticket_detail', $ticket->id));
       //Emitimos el evento
        broadcast(new StateTicket($ticket))->toOthers();
    }

    return view("dashboard.tickets.view_ticket", compact("calification","validate_user_sistemas","ticket","file","comments"));

}

//Funcion que me permite realizar un emicion para mostrar el usuario escribiendo en chat de ticket
public function writting_ticket(Request $request){
    $ticket = Ticket::find($request->id_ticket);
    $user = Auth::user();
    //emitir evento
    broadcast(new Writting_Comment($ticket, $user))->toOthers();
    return true;
}

//funcion que me permite retornar la vista para editar el ticket

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

//Funcion que me permite guardar los cambios del ticket
public function save_changes_ticket(Request $request){
    $user = Auth::user();
    $ticket = Ticket::find($request->id_ticket);
    $ticket->name = $request->name;
    $ticket->description = $request->description;
    //verificamos si el usuario de destino ha cambiado para guardarlo
    if ($request->id_user_destination) {
        $ticket->id_user_destination = $request->id_user_destination;
    }
    //verificamos si se desea cambiar el archivo para cambiarlo y guardarlo
    if ($request->hasFile('file')) {
        $file = $request->file('file');
        $fechaHoraActual = now()->format('Y-m-d_H-i-s');
        $name_file = $fechaHoraActual . '.' . $file->getClientOriginalExtension();
        $rutaImagen = public_path('storage/files/' . $name_file);
        $file->move(public_path('storage/files'), $name_file);
        $ticket->file = $name_file;
    }
    //notificamos
    NotificationController::create_notification("El ticket ha sido modificado", $ticket->id_user_destination , route('dashboard.tickets.ticket_detail', $ticket->id));
    //Generamos el reporte
    ReportController::create_report("Se ha editado el ticket con ID $ticket->id", $user->id, 7);
    $user_destination = DB::selectOne("SELECT * FROM users WHERE id=$ticket->id_user_destination");
    //Enviamos el correo
    Mail::to($user_destination->email)->send(new edit_ticket($user_destination, $ticket));
    $ticket->save();
    //buscamos la informacion del ticket para pintarla
    $ticket = DB::selectOne("SELECT  t.id, t.name,t.file, t.description, t.date_start, t.date_finally, p.priority, ud.id_area AS id_area_user_destination, s.id AS id_state, s.state, us.name AS name_sender,  ud.name AS name_destination, ud.id AS id_user_destination, us.id AS id_user_sender
    FROM tickets t
    INNER JOIN priorities p ON t.id_priority = p.id
    INNER JOIN users us ON t.id_user_sender =us.id
    INNER JOIN users ud ON t.id_user_destination = ud.id
    INNER JOIN states s ON t.id_state = s.id  WHERE t.id = $ticket->id");
    //emitimos el evento
    broadcast(new StateTicket($ticket))->toOthers();
    return redirect()->route('dashboard.tickets.ticket_detail', $request->id_ticket)->with("message","Ticket editado con exito!");
}


//Funcion que me permite notificar al ticket sobre finalizacion
public function notificate_finish_ticket_mail(Request $request){

    $ticket = DB::selectOne("SELECT t.id, t.name, t.description, t.date_start, t.date_finally, p.priority, s.id AS id_state, s.state, us.name AS name_sender,  ud.name AS name_destination, ud.id AS id_user_destination , us.id AS id_user_sender
        FROM tickets t
        INNER JOIN priorities p ON t.id_priority = p.id
        INNER JOIN users us ON t.id_user_sender =us.id
        INNER JOIN users ud ON t.id_user_destination = ud.id
        INNER JOIN states s ON t.id_state = s.id WHERE t.id = $request->id_ticket");
         $user_sender = User::find($ticket->id_user_sender);
         $user_destination = User::find($ticket->id_user_destination);
         //Notificamos
         NotificationController::create_notification("El usuario $user_destination->name esta esperando la finalizacion del ticket #$ticket->id", $user_sender->id , route('dashboard.tickets.ticket_detail', $ticket->id));
        //Enviamos correo
         Mail::to($user_sender->email)->send(new notificate_finish_ticket($user_sender, $user_destination ,$ticket));
        return redirect()->route("dashboard.tickets.ticket_detail", $ticket->id)->with('message','Usuario notificado!');

}

//funcion que me permite dar finalizacion de ticket desde el correo
public function finish_ticket_mail(Request $request){
    $ticket = Ticket::find($request->id_ticket);
    if($ticket->id_state = 5){
        //si esta en estado de ejecucion finalizar el ticket
        $ticket->id_state =7;
        $ticket->save();

    $user_sender = User::find($ticket->id_user_sender);
    $user_destination = User::find($ticket->id_user_destination);
    $infoticket = DB::selectOne("SELECT t.id, s.state FROM tickets t INNER JOIN states s ON t.id_state = s.id WHERE t.id = $ticket->id");
    //Generar reporte
    ReportController::create_report("El usuario $user_sender->email finalizo la ejecución del ticket con id $ticket->id", $user_sender->id, 7);
    //Generar correo
    Mail::to($user_destination->email)->send(new modificate_ticket($user_destination,$user_destination, $infoticket));
    //Generar notificacion
    NotificationController::create_notification("Su ticket ha sido cerrado con exito!", $ticket->id_user_destination , route('dashboard.tickets.ticket_detail', $ticket->id));
    return view('dashboard.accept_emails.view_finish_ticket_mail', compact('user_destination','ticket'));
    }else{
        return redirect()->route("dashboard.tickets.ticket_detail", $ticket->id)->with('message_error','La acción no esta disponible verifica que el usuario este ejecutando el ticket');
    }

}

//Funcion que me permite guardar un nuevo ticket
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
//si el usuario de destino existe en request lo guarda
    if ($request->id_user_destination) {
        $new_ticket->id_user_destination = $request->id_user_destination;
    }else{
        //capturamos el tema del ticket
         $id_theme_user =  $request->id_theme_user;
         //buscamos el usuario de sistemas a atender el ticket
         $user_sistemas = DB::selectOne("SELECT u.id FROM users u
         INNER JOIN charges c ON u.id_chargy = c.id
        WHERE c.id_area = 2 AND u.id_theme_user = $id_theme_user AND u.id_state = 1 ORDER BY RAND() LIMIT 1");
        //si no existe colocamos uno aletorio
        if (!$user_sistemas) {
            $user_sistemas = DB::selectOne("SELECT u.id FROM users u
            INNER JOIN charges c ON u.id_chargy = c.id
           WHERE c.id_area = 2 AND u.id_state = 1 ORDER BY RAND() LIMIT 1");
        }
        $new_ticket->id_user_destination = $user_sistemas->id;
        }
        //verificamos si existe un archivo para guardarlo
    if ($request->hasFile('file')) {
        $file = $request->file('file');
        $fechaHoraActual = now()->format('Y-m-d_H-i-s');
        $name_file = $fechaHoraActual . '.' . $file->getClientOriginalExtension();
        $rutaImagen = public_path('storage/files/' . $name_file);
        $file->move(public_path('storage/files'), $name_file);
        $new_ticket->file = $name_file;
    }
    //Generar reporte
    ReportController::create_report("El usuario $user->email creo un ticket llamado $new_ticket->name", $user->id, 4);
    $user_destination = DB::selectOne("SELECT * FROM users WHERE id=$new_ticket->id_user_destination");
    $new_ticket->save();
    //Generar notificaciones
    NotificationController::create_notification("Se ha creado un nuevo ticket para ti", $new_ticket->id_user_destination , route('dashboard.tickets.ticket_detail', $new_ticket->id));
    //Generar correo
    Mail::to($user_destination->email)->send(new create_ticket($user, $user_destination, $new_ticket));
    $ticket = DB::selectOne("SELECT  t.id, t.name, t.description, t.date_start, t.date_finally, p.priority, ud.id_area AS id_area_user_destination, s.id AS id_state, s.state, us.name AS name_sender,  ud.name AS name_destination, ud.id AS id_user_destination, us.id AS id_user_sender
    FROM tickets t
    INNER JOIN priorities p ON t.id_priority = p.id
    INNER JOIN users us ON t.id_user_sender =us.id
    INNER JOIN users ud ON t.id_user_destination = ud.id
    INNER JOIN states s ON t.id_state = s.id  WHERE t.id = $new_ticket->id");
    //Emitir el evento
    broadcast(new CreateTicket($ticket))->toOthers();
    return redirect()->route('dashboard.tickets')->with("message","Ticket generado con exito!");

}

//Funcion que me permite crear comentario para tickets
public function comment_create(Request $request){

    $new_comment = new Comment();
    $fechaColombiana = Carbon::now('America/Bogota')->format('d F Y H:i:s');
    $new_comment->comment = $request->comment;
    $new_comment->date = $fechaColombiana;
     $new_comment->id_user = Auth::user()->id;
     $new_comment->id_ticket = $request->id_ticket;
     $new_comment->id_state = 1;


     $ticket = Ticket::find($request->id_ticket);
     $validate_sender = DB::selectOne("SELECT * FROM tickets t WHERE id=$request->id_ticket");
     //Validar a que usuario notificar sobre comentario
     if ($validate_sender->id_user_sender ==  Auth::user()->id) {
        $user = User::find($validate_sender->id_user_destination);
     }else{
        $user = User::find($validate_sender->id_user_sender);
     }
     if (!$request->conection){
        //si la conexion de el usuario es FALSA envia las notificaciones
        //generamos el correo
        Mail::to($user->email)->send(new comment_ticket($user, $ticket));
        //notificamos
        NotificationController::create_notification("Tienes un nuevo comentario en ticket", $user->id , route('dashboard.tickets.ticket_detail', $ticket->id));
     }

     $new_comment->save();
    $comment = DB::selectOne("SELECT c.id, c.comment, c.date, u.name, u.id AS id_user, c.id_ticket FROM comments c INNER JOIN users u ON c.id_user = u.id WHERE c.id = $new_comment->id");
    $user = Auth::user();
    //emitimos el evento
    broadcast(new EventsComment_Ticket($comment, $user))->toOthers();
    return $comment;

}

//Funcion que me permite calificar un ticket
public function calification_ticket(Request $request){
    $user = Auth::user();
    $estrellas = $request->estrellas;
    $comment = $request->comment;
    $id_ticket = $request->id_ticket;
    $fechaActual = Carbon::now('America/Bogota');
    $fechaActual->locale('es');
    $fechaColombiana = $fechaActual->format('d F Y');
    $califications = Calification::where("id_ticket", $id_ticket)->first();
//si ya existe una calificacion la cambia los datos de la calificacion
    if ($califications) {
        $califications->calification = $estrellas;
        $califications->comment = $comment;
        $califications->date = $fechaColombiana;
        $califications->save();

    }else{
        //guardar una nueva calificacion
        $new_calification = new Calification();
        $new_calification->calification = $estrellas;
        $new_calification->comment = $comment;
        $new_calification->id_user = $user->id;
        $new_calification->id_ticket = $id_ticket;
        $new_calification->date = $fechaColombiana;
        $new_calification->save();
    }
    $ticket = Ticket::find($id_ticket);
    //Notificamos al usuario de destino
    NotificationController::create_notification("Tu ticket ha sido calificado !Hechale un vistaso!", $ticket->id_user_destination , route('dashboard.tickets.ticket_detail', $ticket->id));
   //Generamos reporte
    ReportController::create_report("Se ha agregado una calificacion de $estrellas estrellas para el ticket con ID $ticket->id", $user->id, 7);
    $user_sender = User::find($ticket->id_user_destination);
    //Generamos un correo
    Mail::to($user_sender->email)->send(new calification_ticket($user_sender, $ticket));
    return redirect()->back()->with('message', 'Calificación Agregada con exito!');
}


//Funcion que me permite eliminar un comentario
public function comment_delete(Request $request){
    $user = Auth::user();
    $comment = Comment::find($request->id_comment);
    //emitimos el evento
    broadcast(new Delete_Comment($comment, $user))->toOthers();
    ReportController::create_report("Se ha eliminado el comentario con ID $comment->id para el ticket con ID $comment->id_ticket", $user->id, 7);
    $comment->delete();
    return redirect()->route('dashboard.tickets.ticket_detail', $request->id_ticket)->with("message","Comentario eliminado con exito!");
}

//funcion que me permite retornar un json de tickets
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
        $zonaHorariaColombia = new DateTimeZone('America/Bogota');
        $fechaActual = new DateTime('now', $zonaHorariaColombia);
        // Imprimir la hora actual en Colombia
        $fechaActual->format('d/m/Y H:i:s');

    // Fecha que deseas validar
    $fechaStr = $t->date_finally;

    // Convertir la cadena de fecha a un objeto DateTime
    $fecha = DateTime::createFromFormat('d/m/Y H:i:s', $fechaStr);
    // Comparar las fechas (ignorando la parte de la hora para comparar solo la fecha)

    if ($fecha->format('d/m/Y H:i:s') < $fechaActual->format('d/m/Y H:i:s') && $t->id_state !== 7 && $t->id_state !== 6 ) {
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
           $ticket = DB::selectOne("SELECT  t.id, t.name, t.description, t.date_start, t.date_finally, p.priority, ud.id_area AS id_area_user_destination, s.id AS id_state, s.state, us.name AS name_sender,  ud.name AS name_destination, ud.id AS id_user_destination, us.id AS id_user_sender
    FROM tickets t
    INNER JOIN priorities p ON t.id_priority = p.id
    INNER JOIN users us ON t.id_user_sender =us.id
    INNER JOIN users ud ON t.id_user_destination = ud.id
    INNER JOIN states s ON t.id_state = s.id  WHERE t.id = $ticket->id");
    broadcast(new StateTicket($ticket))->toOthers();
    }else{
        $ticket = DB::selectOne("SELECT  t.id, t.name, t.description, t.date_start, t.date_finally, p.priority, ud.id_area AS id_area_user_destination, s.id AS id_state, s.state, us.name AS name_sender,  ud.name AS name_destination, ud.id AS id_user_destination, us.id AS id_user_sender
        FROM tickets t
        INNER JOIN priorities p ON t.id_priority = p.id
        INNER JOIN users us ON t.id_user_sender =us.id
        INNER JOIN users ud ON t.id_user_destination = ud.id
        INNER JOIN states s ON t.id_state = s.id  WHERE t.id = $ticket->id");
        broadcast(new StateTicket($ticket))->toOthers();
        Mail::to($user_destination->email)->send(new modificate_ticket($user_destination,$user_destination, $infoticket));
        Mail::to($user_sender->email)->send(new modificate_ticket($user_sender,$user_destination, $infoticket));
    }

    }
    }

    return $tickets;
}
}
