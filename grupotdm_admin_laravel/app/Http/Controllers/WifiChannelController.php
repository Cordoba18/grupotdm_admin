<?php

namespace App\Http\Controllers;

use App\Models\Wifi_channel;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

class WifiChannelController extends Controller
{
    //funcion que me permite mostrar los canales de internet
    public function show_wifi_channels(Request $request){

        $search = $request->search;
        $wifi_channels =  Wifi_channel::all()->where('id_state','=','1');
        return view("dashboard.wifi_channels.show", compact('wifi_channels','search'));
    }

    //funcion que me permite retornar la vista de un canal de internet
    public function create_wifi_channels(){

        return view("dashboard.wifi_channels.create");
    }

    //funcion que me permite exportar los canales de internet
    public function export(){
        // return Excel::download(new VpnExport, "Vpns_GRUPO_TDM.xlsx");
    }

    //funcion que me permite guardar una red wifi
    public function save_wifi_channels(Request $request){


        $new_wifi_channel =  new Wifi_channel();
        $new_wifi_channel->code = $request->code;
        $new_wifi_channel->detail = $request->detail;
        $new_wifi_channel->amount = $request->amount;
        $new_wifi_channel->unit_value = $request->unit_value;
        $new_wifi_channel->date_start = $request->date_start;
        $new_wifi_channel->id_state = 1;
        $new_wifi_channel->date_finish = $request->date_finish;
        $new_wifi_channel->save();
        return redirect()->route('dashboard.wifi_channels')->with("message","Canal de internet guardado con exito!");

    }

       //funcion que me permite editar una red wifi
    public function edit_wifi_channels($id){

        $wifi_channel = Wifi_channel::find($id);

        return view("dashboard.wifi_channels.edit", compact("wifi_channel"));
    }

       //funcion que me permite guardar los cambios de una red wifi
    public function save_changes_wifi_channels(Request $request){

        $wifi_channel = Wifi_channel::find($request->id);
        $wifi_channel->code = $request->code;
        $wifi_channel->detail = $request->detail;
        $wifi_channel->amount = $request->amount;
        $wifi_channel->unit_value = $request->unit_value;
        $wifi_channel->date_start = $request->date_start;
        $wifi_channel->date_finish = $request->date_finish;
        $wifi_channel->save();
        return redirect()->route("dashboard.wifi_channels.edit",$request->id )->with("message","Cambios guardados correctamente!");
    }
       //funcion que me permite eliminar una red wifi
    public function delete_wifi_channels(Request $request){
        $wifi_channel = Wifi_channel::find($request->id);
        $wifi_channel->id_state = 2;
        $wifi_channel->save();
        return redirect()->route("dashboard.wifi_channels")->with("message","Eliminado correctamente!");
    }
}
