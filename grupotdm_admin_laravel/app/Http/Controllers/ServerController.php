<?php

namespace App\Http\Controllers;

use App\Exports\ServerExport;
use App\Models\Area;
use App\Models\Ip_linux_direction;
use App\Models\Server;
use App\Models\Server_sql_license;
use App\Models\Sql_license;
use App\Models\User;
use App\Models\Vpn;
use App\Models\Vpn_server;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;

class ServerController extends Controller
{

      //Verificamos autenticacion del usuario
      public function __construct()
      {
          $this->middleware('auth');

      }

      public static function validate_user(){


        $id_area = Auth::user()->id_area;

        if ($id_area != 2) {
        //  return redirect()->route('dashboard')->with('message_error','No tienes permiso de ingresar al apartado de "Servidores"');
        }
      }

    //funcion que muestra el apartado de servidores
    public function show_servers(Request $request){
        ServerController::validate_user();
        //retornamos la vista con los servidores a mostrar
        $search = $request->search;
        $filter= $request->filter;

        if ($request->search && $request->filter) {
            $servers = DB::select("SELECT * FROM servers
            WHERE (name LIKE '%$request->search%' OR
             OS LIKE '%$request->search%' OR
             service LIKE '%$request->search%' OR
             observations LIKE '%$request->search%' OR
             RAM LIKE '%$request->search%' OR
             vcpu LIKE '%$request->search%' OR
             totaldd LIKE '%$request->search%' OR
             ip LIKE '%$request->search%' OR
             SPLA_RDP_TS LIKE '%$request->search%' OR
             SPLA_EXCEL LIKE '%$request->search%') AND id_state = $request->filter");
        }else if($request->search){
            $servers = DB::select("SELECT * FROM servers
            WHERE name LIKE '%$request->search%' OR
             OS LIKE '%$request->search%' OR
             service LIKE '%$request->search%' OR
             observations LIKE '%$request->search%' OR
             RAM LIKE '%$request->search%' OR
             vcpu LIKE '%$request->search%' OR
             totaldd LIKE '%$request->search%' OR
             ip LIKE '%$request->search%' OR
             SPLA_RDP_TS LIKE '%$request->search%' OR
             SPLA_EXCEL LIKE '%$request->search%'");
        }else if($request->filter){
            $servers = DB::select("SELECT * FROM servers
            WHERE id_state = $request->filter");
        }else{
            $servers =  Server::all();
        }
        $filters = DB::select("SELECT * FROM states WHERE id = 1 OR id=2");

        return view('dashboard.servers.show', compact('servers','search','filters','filter'));

    }

    //funcion que retorna la vista para crear un nuevo servidor
    public function create_server(){
        ServerController::validate_user();
        return view('dashboard.servers.create');
    }
    //funcion que permite guardar un servidor
    public function save_server(Request $request){
        ServerController::validate_user();
        //consultamos un servidor con la misma ip consultada por el usuario
        $server = Server::where('ip','=',"$request->ip")->first();
               //si existe no lo creamos y retornamos un mensaje
        if($server){

            return view('dashboard.servers.create')->with('message_error', 'Servidor con ip existente!');
        }
        else{
        $server = new Server();

        $server->name = $request->name;
        $server->OS = $request->OS;
        $server->service = $request->service;
        $server->observations = $request->observations;
        $server->RAM = $request->RAM;
        $server->vcpu = $request->vcpu;
        $server->totaldd = $request->totaldd;
        $server->ip = $request->ip;
        $server->SPLA_RDP_TS = $request->SPLA_RDP_TS;
        $server->SPLA_EXCEL = $request->SPLA_EXCEL;
        $server->id_state = 1;
        $server->save();
        return redirect()->route('dashboard.servers')->with('message','Servidor creado con exito!');
        }
    }


    //funcion que me permite retornar la vista para ver el detalle de un servidor
    public function view_server($id){
        ServerController::validate_user();
        $server = DB::selectOne("SELECT s.id_state, s.name, s.id,st.state, s.OS, s.service, s.RAM, s.vcpu, s.totaldd, s.ip, s.SPLA_RDP_TS, s.SPLA_EXCEL, s.observations
        FROM servers s
        INNER JOIN states st ON s.id_state = st.id WHERE s.id = $id");
        $sql_licenses = Sql_license::all()->where('id_state','=','1');
        $server_sql_licenses = DB::select("SELECT sq.name, seq.id FROM server_sql_licenses seq
        INNER JOIN sql_licenses sq ON seq.id_sql_licenses = sq.id WHERE seq.id_server = $id AND seq.id_state = 1");
        return view('dashboard.servers.view_server', compact('server','sql_licenses','server_sql_licenses'));
    }

    //funcion que me permite guardar cambios de un servidor
    public function save_changes_server(Request $request){
        ServerController::validate_user();
        $server = Server::find($request->id_server);
        $server->name = $request->name;
        $server->OS = $request->OS;
        $server->service = $request->service;
        $server->observations = $request->observations;
        $server->RAM = $request->RAM;
        $server->vcpu = $request->vcpu;
        $server->totaldd = $request->totaldd;
        $server->SPLA_RDP_TS = $request->SPLA_RDP_TS;
        $server->SPLA_EXCEL = $request->SPLA_EXCEL;
        $server->save();
        return redirect()->route('dashboard.servers.view', $request->id_server)->with('message','Servidor editado con exito!');

    }

    //funcion que me permite cambiar el estado de un servidor
    public function change_state_server(Request $request){
        ServerController::validate_user();
        $server = Server::find($request->id_server);

        if ($server->id_state == 1) {

            $server->id_state = 2;
        }else{
            $server->id_state = 1;
        }

        $server->save();

        return redirect()->route('dashboard.servers.view', $request->id_server)->with("message","Accion realizada con exito!");

    }

    //funcion que me permite retornar la vista para ver las licencias sql
    public function show_sql_licenses(Request $request){
        ServerController::validate_user();
        $search = $request->search;

        if ($request->search ) {
            $sql = "(name LIKE '%$request->search%') AND";
        }else{
            $sql ="";
        }
        $sql_licenses =DB::select("SELECT * FROM sql_licenses WHERE $sql id_state = 1");
        return view('dashboard.servers.sql_licenses.show',compact('sql_licenses', 'search'));

    }

    //funcion que me permite retornar la vista para crear una nueva licencia sql
    public function create_sql_licenses(Request $request){

        ServerController::validate_user();

        return view('dashboard.servers.sql_licenses.create');
    }

    //funcion que me permite guardar la nueva licensia sql
    public function save_sql_licenses(Request $request){

        if (DB::select("SELECT * FROM sql_licenses WHERE name LIKE '%$request->name%' AND id_state = 1")) {
            return redirect()->route('dashboard.servers.sql_licenses.create')->with('message_error', 'Ya existe una licencia con el mimso nombre!');
        }else{
            $sql_license = new Sql_license();

            $sql_license->name = $request->name;
            $sql_license->id_state = 1;
            $sql_license->save();
            return redirect()->route('dashboard.servers.sql_licenses')->with('message','Licencia generada correctamente!');
        }

    }

    //funcion que me permite eliminar una licensia sql
    public function delete_sql_licenses(Request $request){

        $sql_license = Sql_license::find($request->id_sql_license);
        $sql_license->id_state = 2;
        $sql_license->save();

        $Server_sql_licenses = Server_sql_license::all()->where("id_sql_licenses","=","$request->id_sql_license")->where("id_state","=","1");

        foreach ($Server_sql_licenses as $s) {

            $Server_sql_license = Server_sql_license::find($s->id);
            $Server_sql_license->id_state = 2;
            $Server_sql_license->save();

        }

        return redirect()->route('dashboard.servers.sql_licenses')->with('message','Licencia eliminada con exito!');

    }
    //funcion que sirve para agregar una licencia a un servidor
    public function add_sql_licenses_server(Request $request){

        $server_sql_licenses = Server_sql_license::where('id_server','=',"$request->id_server")
        ->where("id_sql_licenses","=","$request->id_sql_licenses")
        ->where("id_state","=","1")->first();
        if ($server_sql_licenses) {
            return redirect()->route('dashboard.servers.view', $request->id_server)->with('message_error','La licencia ya ha sido asignada');
        }else{

            $new_server_sql_license = new Server_sql_license();
            $new_server_sql_license->id_server = $request->id_server;
            $new_server_sql_license->id_sql_licenses = $request->id_sql_licenses;
            $new_server_sql_license->id_state = 1;
            $new_server_sql_license->save();
            return redirect()->route('dashboard.servers.view', $request->id_server)->with('message','Licencia agregada con exito');
        }
    }

    //funcion que me permite eliminar una licencia de un servidor
    public function delete_sql_licenses_server(Request $request){

        $Server_sql_license = Server_sql_license::find($request->id_server_sql_licenses);
        $Server_sql_license->id_state = 2;
        $Server_sql_license->save();
        return redirect()->route('dashboard.servers.view', $request->id_server)->with('message','Licencia eliminada con exito!');

    }

    //funcion que me permite retornar la vista de la direcciones
    public function show_ip_linux_directions(Request $request){

        $search = $request->search;

        if ($request->search ) {
            $sql = "(i.ip LIKE '%$request->search%' OR s.name LIKE '%$request->search%' OR s.ip LIKE '%$request->search%') AND";
        }else{
            $sql ="";
        }

        $ip_linux_directions = DB::select("SELECT s.name, i.ip, i.id FROM ip_linux_directions i
        INNER JOIN servers s ON i.id_server = s.id
        WHERE $sql i.id_state = 1");
        $filters = DB::select("SELECT * FROM states WHERE id = 1 OR id=2");


        return view('dashboard.servers.ip_linux_directions.show', compact('ip_linux_directions','filters','search'));

    }


    //Funcion que me permite retornar la vista para crear una direccion ip linux

    public function create_ip_linux_directions(){

        $servers = Server::all()->where('id_state','=','1');
        return view('dashboard.servers.ip_linux_directions.create', compact('servers'));
    }

    //funcion que me permite guardar una direccion ip linux

    public function save_ip_linux_directions(Request $request){

        $validation = Ip_linux_direction::where('id_server','=',"$request->id_server")
        ->where("ip","=","$request->ip")
        ->where("id_state","=","1")->first();

        if ($validation) {
            return redirect()->route('dashboard.servers.ip_linux_directions.create_ip_linux_directions')->with('message_error','El servidor ya tiene una asignación a esa DIRECCIÓN IP LINUX!');
        }else{
            $new_ip_linux_direction = new Ip_linux_direction();
            $new_ip_linux_direction->ip = $request->ip;
            $new_ip_linux_direction->id_server = $request->id_server;
            $new_ip_linux_direction->id_state = 1;
            $new_ip_linux_direction->save();
            return redirect()->route('dashboard.servers.ip_linux_directions')->with('message','DIRECCIÓN IP LINUX creada con exito !');
        }



    }

    //funcion que permite eliminar o desactivar una direccion ip linux
    public function delete_ip_linux_directions(Request $request){

        $ip_linux_direction = Ip_linux_direction::find($request->id_ip_linux_direction);

        $ip_linux_direction->id_state = 2;
        $ip_linux_direction->save();

        $vpn_servers = Vpn_server::all()->where("id_ip_linux_direction","=","$request->id_ip_linux_direction");
        foreach ($vpn_servers as $v) {
            $vpn_server = Vpn_server::find($v->id);
            $vpn_server->id_state = 2;
            $vpn_server->save();

        }



        return redirect()->route('dashboard.servers.ip_linux_directions')->with('message','DIRECCIÓN IP LINUX eliminado con exito!');
    }

    //funcion que me permite exportar los servidores en un excel
    public function export(){
        return Excel::download(new ServerExport, "Servidores_GRUPO_TDM.xlsx");
    }
}
