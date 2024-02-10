<?php

namespace App\Http\Controllers;

use App\Models\Companie;
use App\Models\Payment_method;
use App\Models\Spreadsheet;
use App\Models\Spreadsheet_rows_tpv;
use App\Models\Spreadsheet_tpv;
use App\Models\Tpv;
use Carbon\Carbon;
use Illuminate\Http\Request;

class SpreadsheetsController extends Controller
{


    //validacion de autenticacion de usuario
    public function __construct()
    {
        $this->middleware('auth');
    }

    //funcion que me permite mostrar y generar una nueva plantilla
    public function show_spreadsheets(Request $request){
        Carbon::setLocale('es');

        $search = $request->search;
        $fechaActual = Carbon::now();
        $fechaAnterior = $fechaActual->subDay()->toDateString();
        $fechaActual2 = Carbon::now()->toDateString();

        $spreadsheet = Spreadsheet::where("created_at","LIKE","%$fechaActual2%")->first();

       if (!$spreadsheet) {

        $spreadsheet = new Spreadsheet();
        $spreadsheet->date = $fechaAnterior;
        $spreadsheet->id_state = 1;
        $spreadsheet->save();

        $tpvs = Tpv::all()->where("id_state","=","1");

        foreach ($tpvs as $t) {
            $spreadsheet_tpv = new Spreadsheet_tpv();
            $spreadsheet_tpv->id_tpv = $t->id;
            $spreadsheet_tpv->total = 0;
            $spreadsheet_tpv->sub_total = 0;
            $spreadsheet_tpv->difference = 0;
            $spreadsheet_tpv->id_spreadsheet = $spreadsheet->id;
            $spreadsheet_tpv->id_state = 3;
            $spreadsheet_tpv->save();
            $total = 0;

            $payment_methods = Payment_method::all();
            foreach ($payment_methods as $p) {
                $spreadsheet_rows_tpvs = new Spreadsheet_rows_tpv();
                $spreadsheet_rows_tpvs->id_payment_method = $p->id;
                $spreadsheet_rows_tpvs->id_spreadsheet_tpv = $t->id;
                $numero = rand(1,9).'0000';
                $spreadsheet_rows_tpvs->value_pos = $numero;
                $spreadsheet_rows_tpvs->save();
                $total = $total + $numero;
            }


            $spreadsheet_tpv = Spreadsheet_tpv::find($spreadsheet_tpv->id);
            $spreadsheet_tpv->total = $total;
            $spreadsheet_tpv->save();
        }

       }
       $spreadsheets  = Spreadsheet::join("states","spreadsheets.id_state","states.id")
       ->select("spreadsheets.date", "spreadsheets.id", "states.state","spreadsheets.id_state")->get();

       return view('dashboard.spreadsheets.show', compact('search','spreadsheets'));

    }


    public function show_tpvs($id){

        $spreadsheet_tpvs = Spreadsheet_tpv::join("tpvs","spreadsheet_tpvs.id_tpv","tpvs.id")
        ->join("states","spreadsheet_tpvs.id_state","states.id")
        ->select("states.state","tpvs.tpv","spreadsheet_tpvs.total","spreadsheet_tpvs.sub_total","spreadsheet_tpvs.difference","spreadsheet_tpvs.id_state")->get();
        return view('dashboard.spreadsheets.show_tpvs', compact("id","spreadsheet_tpvs"));
    }
}
