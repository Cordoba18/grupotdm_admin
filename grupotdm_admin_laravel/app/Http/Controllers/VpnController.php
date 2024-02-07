<?php

namespace App\Http\Controllers;

use App\Exports\VpnExport;
use App\Mail\Create_vpn;
use App\Models\Area;
use App\Models\Ip_linux_direction;
use App\Models\User;
use App\Models\Vpn;
use App\Models\Vpn_server;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Maatwebsite\Excel\Facades\Excel;

class VpnController extends Controller
{

      //Verificamos autenticacion del usuario
      public function __construct()
      {
          $this->middleware('auth');

      }
        //Funcion que me permite retornar la vista del apartado de las vpns

        public function show_vpns(Request $request){
            $search = $request->search;

            if ($request->search ) {
                $sql = " WHERE (u.name LIKE '%$request->search%' OR u.email LIKE '%$request->search%' OR v.name LIKE '%$request->search%' OR v.id LIKE '%$request->search%')";
            }else{
                $sql ="";
            }


            $vpns = DB::select("SELECT u.name as name_user, u.id as id_user, v.id, v.name as name_vpn, v.id_state
            FROM vpns v
            INNER JOIN users u ON v.id_user = u.id
            $sql");
            return view('dashboard.vpns.show',compact('vpns','search'));
        }

            //funcion que me permite retornar la vista para crear una nueva llave vpn

    public function create_vpn(){

        $areas = Area::all();
        return view('dashboard.vpns.create', compact('areas'));
    }

    //funcion que me permite crear una nueva llave VPN
    public function save_vpn(Request $request){
        $validation = Vpn::where("id_user","=","$request->id_user")->orWhere("name","=","$request->name")->first();
        //validamos si existe una vpn con ese usuario o si existe una vpn con ese mismo nombre
        if ($validation) {
            return redirect()->route('dashboard.vpns.create')->with('message_error', "Ya existe una VPN con ese nombre o usuario contiene el ID #$validation->id");
        }else{

            if ($request->hasFile('file')) {
                $file = $request->file('file');
                $fechaHoraActual = now()->format('Y-m-d_H-i-s');
                $name_file = $fechaHoraActual . '.' . $file->getClientOriginalExtension();
                $rutaImagen = public_path('storage/vpns/' . $name_file);
                $file->move(public_path('storage/vpns'), $name_file);
                $new_vpn = new Vpn();
                $new_vpn->name = $request->name;
                $new_vpn->id_user = $request->id_user;
                $new_vpn->file = $name_file;
                $new_vpn->id_state = 1;
                $new_vpn->save();
                $user = User::find($request->id_user);
                //Enviamos el correo de notificacion
                Mail::to($user->email)->send(new Create_vpn($user, $new_vpn));
                return redirect()->route('dashboard.vpns')->with('message', "Llave VPN creada correctamente!");
            }else{
                return redirect()->route('dashboard.vpns.create')->with('message_error', "No se selecciono un archivo valido!");
            }


        }
    }

        //funcion que me permite retornar una vista para ver el detalle de una llave vpn
        public function view_vpn($id){

            $areas = Area::all();
            $vpn = Vpn::join('users', 'vpns.id_user','users.id')
            ->leftJoin('shops', 'users.id_shop','shops.id')
            ->select('users.name as name_user', 'users.id as id_user','vpns.id', 'vpns.name', 'vpns.file', 'shops.shop','vpns.id_state')
            ->where('vpns.id','=',"$id")
            ->first();

            $ip_linux_directions = Ip_linux_direction::join('servers','ip_linux_directions.id_server','servers.id')
            ->select('servers.name','ip_linux_directions.ip','servers.ip as ip_server','ip_linux_directions.id')
            ->where('ip_linux_directions.id_state' ,'=','1')->get();

            $vpn_servers = Vpn_server::join('ip_linux_directions','vpn_servers.id_ip_linux_direction','ip_linux_directions.id')
            ->join('servers','ip_linux_directions.id_server','servers.id')
            ->select('ip_linux_directions.ip', 'servers.name', 'vpn_servers.id', 'servers.ip as ip_server')
            ->where('vpn_servers.id_state','=','1')
            ->where('vpn_servers.id_vpn',"=","$id")->get();
            return view('dashboard.vpns.view_vpn',compact('vpn','areas','ip_linux_directions','vpn_servers'));

        }




    //Funcion que me permite guardar los cambios de una vpn
    public function save_changes_vpn(Request $request){
        $vpn = Vpn::find($request->id_vpn);
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $fechaHoraActual = now()->format('Y-m-d_H-i-s');
            $name_file = $fechaHoraActual . '.' . $file->getClientOriginalExtension();
            $rutaImagen = public_path('storage/vpns/' . $name_file);
            $file->move(public_path('storage/vpns'), $name_file);

            if ($vpn->file) {
                $rutaArchivoAnterior = public_path('storage/vpns/'.$vpn->file);
                if (file_exists($rutaArchivoAnterior)) {
                    unlink($rutaArchivoAnterior);
                }
            }

            $vpn->file = $name_file;

        }

        if($request->id_user){
            if ($vpn->id_user != $request->id_user) {
                $validation = Vpn::where("id_user","=","$request->id_user")->first();
                if ($validation) {
                    return redirect()->route('dashboard.vpns.view', $request->id_vpn)->with("message_error","El usuario al que intentas agregar ya tiene un llave VPN asignada!");
                }else{
                $vpn->id_user = $request->id_user;
                $user = User::find($request->id_user);
                //Enviamos el correo de notificacion
                Mail::to($user->email)->send(new Create_vpn($user, $vpn));
                }
            }
        }

        $vpn->save();
        return redirect()->route('dashboard.vpns.view', $request->id_vpn)->with("message","Cambios Guardados con exito!");

    }

    //funcion que me permite agregar una direccion ip linux a una vpn

    public function add_ip_linux_direction(Request $request){

        //validamos si ya hay una direccion ip linux para la llave vpn
        $validation = Vpn_server::where('id_ip_linux_direction', '=',"$request->id_ip_linux_direction")
        ->where("id_vpn","=","$request->id_vpn")
        ->where("id_state","=","1")->first();
        if ($validation) {
            return redirect()->route('dashboard.vpns.view', $request->id_vpn)->with("message_error","La ip linux que intentas asignar ya esta asignada a la LLAVE VPN!");
        }else{
            $new_vpn_server = new Vpn_server();
            $new_vpn_server->id_ip_linux_direction = $request->id_ip_linux_direction;
            $new_vpn_server->id_vpn = $request->id_vpn;
            $new_vpn_server->id_state = 1;
            $new_vpn_server->save();
            return redirect()->route('dashboard.vpns.view', $request->id_vpn)->with("message","La ip linux ha sido asignado correctamente a la llave VPN");
        }
    }

    //Funcion que me permite eliminar una direccion ip linux de una vpn
    public function delete_ip_linux_direction(Request $request){
      $new_vpn_server = Vpn_server::find($request->id);
      $new_vpn_server->id_state = 2;
      $new_vpn_server->save();
      return redirect()->route('dashboard.vpns.view', $request->id_vpn)->with("message","La ip linux ha sido eliminada con exito!");
    }

    //Funcion que me permite cambiar el estado de una vpn
    public function change_state_vpn(Request $request){

        $vpn = Vpn::find($request->id_vpn);
        if ($vpn->id_state == 1) {
            $vpn->id_state = 2;
        } else {
            $vpn->id_state = 1;
        }
        $vpn->save();
        return redirect()->route('dashboard.vpns.view', $request->id_vpn)->with("message","Accion realizada con exito!");
    }

    //funcion que me permite exportar las vpns en un excel
    public function export(){
        return Excel::download(new VpnExport, "Vpns_GRUPO_TDM.xlsx");
    }
}
