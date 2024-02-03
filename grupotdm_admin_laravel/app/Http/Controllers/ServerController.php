<?php

namespace App\Http\Controllers;

use App\Models\Server;
use Illuminate\Http\Request;

class ServerController extends Controller
{
    //funcion que muestra el apartado de servidores
    public function show_servers(Request $request){
        //retornamos la vista con los servidores a mostrar
        $servers =  Server::all()->where('id_state','=','1');
        return view('dashboard.servers.show', compact('servers'));

    }

    //funcion que retorna la vista para crear un nuevo servidor
    public function create_server(){
        return view('dashboard.servers.create');
    }

    public function save_server(Request $request){

        $server = Server::where('ip','=',"$request->ip")->first();
        if($server){
            return view('dashboard.servers.create')->with('message');
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
        return redirect()->route('dashboard.serves')->with('message','Servidor creado con exito!');
        }
    }
}
