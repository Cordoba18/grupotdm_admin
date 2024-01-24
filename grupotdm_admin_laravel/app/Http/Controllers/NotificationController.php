<?php
//importaciones
namespace App\Http\Controllers;

use App\Events\Notification_Users;
use App\Models\Notification;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

//declaramos la clase
class NotificationController extends Controller
{
    //validamos la sesion del usuario
    public function __construct()
    {
        $this->middleware('auth');
    }

    //funcion que recibe el detalle de la notificacion, el id del usuario y la ruta de referencia a la notificacion
    public static function create_notification($detail_notification, $id_user, $route){
        $user = Auth::user();
        date_default_timezone_set('America/Bogota');
        $fechaActual = Carbon::now();
        $fechaFormateada = $fechaActual->format('d/m/Y H:i:s');
        //generamos la notificacion
        $notification = new Notification();
        $notification->notification = $detail_notification;
        $notification->id_user = $id_user;
        $notification->id_state = 3;
        $notification->date = $fechaFormateada;
        $notification->route = $route;
        $notification->save();
        //emitimos el evento
        broadcast(new Notification_Users($notification, $user))->toOthers();
        return true;
    }


    //funcion que me permite obtener todas las notificaciones y retornarlas a un archivo JS
    public function get_notifications(Request $request){

        $notifications = Notification::where('id_user', $request->id_user)
        ->orderBy('id', 'desc')
        ->take(40)
        ->get();

        return $notifications;
    }

    //funcion que me permite cambiar el estado de la notificación en caso de ser vista por el usuario
    public function view_notification(Request $request){

        $notification = Notification::find($request->id_notification);
        $notification->id_state = 4;
        $notification->save();
        return true;
    }

}
