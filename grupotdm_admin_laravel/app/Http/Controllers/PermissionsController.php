<?php
//importaciones
namespace App\Http\Controllers;

use App\Mail\action_permission;
use App\Mail\create_permission;
use App\Models\Permission;
use App\Models\Reason;
use App\Models\Replenish_time;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

//Declaracion de clase
class PermissionsController extends Controller
{
    //validacion de autenticacion del usuario
    public function __construct()
    {
        $this->middleware('auth');
    }

    //funcion que permite mostrar los permisos
    public function show_permissions(Request $request){


        $user = Auth::user();

        //validamos si existe una busqueda de permiso o no para buscar los permisos
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

    //funcion que me permite ver los detalles de un permiso recibiendo su ID
    public function view_permission($id){
        $user = Auth::user();
        $validation_jefe = DB::selectOne("SELECT * FROM users u
        INNER JOIN charges c ON u.id_chargy = c.id
        WHERE c.chargy = 'JEFE DE AREA' AND u.id = $user->id");
        $validation_coordinador = DB::selectOne("SELECT * FROM users u
        INNER JOIN charges c ON u.id_chargy = c.id
        WHERE c.chargy LIKE '%coordinador%' AND u.id = $user->id");

        $permission = DB::selectOne("SELECT p.id, uc.name AS name_user, uc.nit, p.date_application, r.reason, re.replenish_time, s.state, p.id_state, p.observations, p.id_user_collaborator
        FROM permissions p
        INNER JOIN users uc ON p.id_user_collaborator = uc.id
        INNER JOIN reasons r ON p.id_reason = r.id
        INNER JOIN replenish_times re ON p.id_replenish_time = re.id
        INNER JOIN states s ON p.id_state = s.id
        WHERE p.id = $id");
        $dates_permission = Permission::find($id);
        $user_boss = User::find($dates_permission->id_user_boss);
        $user_reception = User::find($dates_permission->id_user_reception);
        return view('dashboard.permissions.show_permission', compact('validation_jefe','validation_coordinador','permission', 'dates_permission','user_boss','user_reception'));
    }

//funcion que me permite retornar la vista para crear el producto
public function create_permission(){

    $reasons = Reason::all();
    $replenish_times = Replenish_time::all();
    return view('dashboard.permissions.create', compact('reasons','replenish_times'));
}

//funcion que me permite guardar un nuevo permiso
public function save_permission(Request $request){
    $user = Auth::user();
    $jefes = DB::select("SELECT * FROM users u
    INNER JOIN charges c ON u.id_chargy = c.id
     WHERE (c.chargy = 'JEFE DE AREA' OR c.chargy LIKE '%coordinador%')  AND u.id_area = $user->id_area");


    $new_permission = new Permission();
    $new_permission->date_application = $request->date_application;
    //validamos si existe una fecha para el dia de mañana para guardar
    if($request->date_tomorrow !== 0 && $request->date_tomorrow != '' && $request->date_tomorrow != null){
        $new_permission->date_tomorrow  = $request->date_tomorrow;
    }
    //guardamos el permiso
    $new_permission->id_user_collaborator = $user->id;
    $new_permission->observations = $request->observations;
    $new_permission->id_reason = $request->id_reason;
    $new_permission->id_replenish_time = $request->id_replenish_time;
    $new_permission->id_state = 3;
    $new_permission->save();
    //enviamos la info al jefe del area
    foreach ($jefes as $jefe) {
        if ($jefe->id != $user->id){
             //notificamos al jefe
             NotificationController::create_notification("El usuario $user->name ha solicitado un permiso", $jefe->id, route('dashboard.permissions.view_permission',$new_permission->id));
            //enviamos un correo
            Mail::to($jefe->email)->send(new create_permission($jefe, $new_permission, $user));

        }
    }

    //generamos un reporte
    ReportController::create_report("Ha generado un permiso por/para $new_permission->observations", $user->id, 9);
    return redirect()->route('dashboard.permissions')->with('message','Permiso generado con exito!');
    }


    //funcion que permite eliminar un permiso
public function delete_permission(Request $request){

    $id_permission = $request->id_permission;
    $permission = Permission::find($id_permission);
    $permission->id_state = 2;
    $permission->save();
    return back()->with('message','Permiso eliminado con exito!');

}

//funcion que permite aprobar un permiso
public function permission_approve(Request $request){
    $user = Auth::user();
    $id_permission =  $request->id_permission;
    $permission = Permission::find($id_permission);
    $permission->id_state = 10;
    //guardamos el usuario jefe a dar aprobacion
    $permission->id_user_boss = $user->id;
    $permission->save();
    $user_colaborator = User::find($permission->id_user_collaborator);
    //Generamos el reporte
    ReportController::create_report("El jefe $user->name ha aprobado el permiso del colaborador $user_colaborator->name ", $user->id, 9);
    //Notificamos al usuario
    NotificationController::create_notification("El jefe de area $user->name ha aprobado su permiso :) ", $permission->id_user_collaborator , route('dashboard.permissions.view_permission', $permission->id));
    //Enviamos el corrreo
    Mail::to($user_colaborator->email)->send(new action_permission($user_colaborator, " que el jefe de area $user->name ha aprobado su permiso con ID $id_permission"));
    return redirect()->route('dashboard.permissions.view_permission', $id_permission)->with('message','Permiso aprobado correctamente!');
}

//funcion que permite desaprobar un permiso
public function permission_disapprove(Request $request){
    $user = Auth::user();
    $id_permission =  $request->id_permission;
    $permission = Permission::find($id_permission);
    $permission->id_state = 9;
     //guardamos el usuario jefe a dar desaprobacion
    $permission->id_user_boss = $user->id;
    $permission->save();
    $user_colaborator = User::find($permission->id_user_collaborator);
    //Notificar al usuario
    NotificationController::create_notification("El jefe de area $user->name ha desaprovado su permiso :(", $permission->id_user_collaborator , route('dashboard.permissions.view_permission', $permission->id));
    //Generar el reporte
    ReportController::create_report("El jefe $user->name ha rechazado el permiso del colaborador $user_colaborator->name ", $user->id, 9);
    //Enviamos el correo
    Mail::to($user_colaborator->email)->send(new action_permission($user_colaborator, " que el jefe de area $user->name ha rechazado su permiso con ID $id_permission"));
    return redirect()->route('dashboard.permissions.view_permission', $id_permission)->with('message','Permiso rechazado correctamente!');
}


//Funcion que me permite dar salida a un permiso
public function permission_user_exit(Request $request){
    $user = Auth::user();
    $id_permission =  $request->id_permission;
    $permission = Permission::find($id_permission);
    //guardamos el usuario de recepcion a dar salida y la fecha
    $permission->id_user_reception = $user->id;
    $permission->time_exit = $request->time_exit;
    $permission->save();
    $user_colaborator = User::find($permission->id_user_collaborator);
    $user_boss = User::find($permission->id_user_boss);
    //notificamos al jefe de area
    NotificationController::create_notification("El usuario $user_colaborator->name ha salido de la instalaciones con permiso", $permission->id_user_boss , route('dashboard.permissions.view_permission', $permission->id));
    //generamos reporte
    ReportController::create_report("El recepcionista $user->name ha dado salida al colaborador $user_colaborator->name ", $user->id, 9);
   //enviamos correo al jefe de area
    Mail::to($user_boss->email)->send(new action_permission($user_boss, " que el colaborador  $user_colaborator->name ha salido de las instalaciones con permiso de ID $id_permission"));
    return redirect()->route('dashboard.permissions.view_permission', $id_permission)->with('message','Hora de salida registrada correctamente!');
}

//funcion que me permite dar entrada en un permiso
public function permission_user_return(Request $request){
    $user = Auth::user();
    $id_permission =  $request->id_permission;
    $permission = Permission::find($id_permission);
    //guardamos usuario de recepcion y fecha
    $permission->id_user_reception = $user->id;
    $permission->time_return = $request->time_return;
    $permission->save();
    $user_colaborator = User::find($permission->id_user_collaborator);
    $user_boss = User::find($permission->id_user_boss);
    //notificamos al jefe de area
    NotificationController::create_notification("El usuario $user_colaborator->name ha regresado a las instalaciones con permiso", $permission->id_user_boss , route('dashboard.permissions.view_permission', $permission->id));
    //generamos el reporte
    ReportController::create_report("El recepcionista $user->name ha dado entrada al colaborador $user_colaborator->name ", $user->id, 9);
    //generamos el correo
    Mail::to($user_boss->email)->send(new action_permission($user_boss, " que el colaborador  $user_colaborator->name  ha regresado a las instalaciones con permiso de ID $id_permission"));
    return redirect()->route('dashboard.permissions.view_permission', $id_permission)->with('message','Hora de entrada registrada correctamente!');
}
}
