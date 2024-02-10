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
}
