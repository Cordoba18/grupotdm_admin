<?php

namespace App\Http\Controllers;

use App\Events\Notification_Users;
use App\Models\Notification;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NotificationController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }


    public static function create_notification($detail_notification, $id_user, $route){
        $user = Auth::user();
        date_default_timezone_set('America/Bogota');
        $fechaActual = Carbon::now();
        $fechaFormateada = $fechaActual->format('d/m/Y H:i:s');
        $notification = new Notification();
        $notification->notification = $detail_notification;
        $notification->id_user = $id_user;
        $notification->id_state = 3;
        $notification->date = $fechaFormateada;
        $notification->route = $route;
        $notification->save();
        broadcast(new Notification_Users($notification, $user))->toOthers();
        return true;
    }


    public function get_notifications(Request $request){

        $notifications = Notification::where('id_user', $request->id_user)
        ->orderBy('id', 'desc')
        ->take(40)
        ->get();

        return $notifications;
    }

    public function view_notification(Request $request){

        $notification = Notification::find($request->id_notification);
        $notification->id_state = 4;
        $notification->save();
        return true;
    }

}
