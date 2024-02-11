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

    public static function validate_spreadsheet(){
        Carbon::setLocale('es');
        $fechaActual = Carbon::now();
        $fechaAnterior = $fechaActual->subDay()->toDateString();
        $fechaActual2 = Carbon::now()->toDateString();

        $spreadsheet = Spreadsheet::where("created_at","LIKE","%$fechaActual2%")->first();

       if (!$spreadsheet) {

        $spreadsheet = new Spreadsheet();
        $spreadsheet->date = $fechaAnterior;
        $spreadsheet->id_state = 1;
        $spreadsheet->save();
       }

        $tpvs = Tpv::all()->where("id_state","=","1");

        foreach ($tpvs as $t) {
            $spreadsheet_tpv = Spreadsheet_tpv::where("id_spreadsheet","=","$spreadsheet->id")
            ->where("id_tpv","=","$t->id")->first();
            if(!$spreadsheet_tpv){
                $spreadsheet_tpv = new Spreadsheet_tpv();
                $spreadsheet_tpv->id_tpv = $t->id;
                $spreadsheet_tpv->total = 0;
                $spreadsheet_tpv->sub_total = 0;
                $spreadsheet_tpv->difference = 0;
                $spreadsheet_tpv->id_spreadsheet = $spreadsheet->id;
                $spreadsheet_tpv->id_state = 3;
                $spreadsheet_tpv->save();

            }

            $total = 0;


            $payment_methods = Payment_method::all();
            foreach ($payment_methods as $p) {
                $spreadsheet_rows_tpvs = Spreadsheet_rows_tpv::where("id_payment_method","="," $p->id")
                ->where("id_spreadsheet_tpv","=","$spreadsheet_tpv->id")->first();

                if (!$spreadsheet_rows_tpvs) {
                    $spreadsheet_rows_tpvs = new Spreadsheet_rows_tpv();
                    $spreadsheet_rows_tpvs->id_payment_method = $p->id;
                    $spreadsheet_rows_tpvs->id_spreadsheet_tpv = $spreadsheet_tpv->id;
                //valor del pos
                    $numero = rand(1,9).'0000';
                    $spreadsheet_rows_tpvs->value_pos = $numero;
                    $spreadsheet_rows_tpvs->save();

                }
                $total = $total + intval($spreadsheet_rows_tpvs->value_pos);
            }


            $spreadsheet_tpv = Spreadsheet_tpv::find($spreadsheet_tpv->id);
            $spreadsheet_tpv->total = $total;
            $spreadsheet_tpv->save();
        }
return true;

    }

    //funcion que me permite mostrar y generar una nueva plantilla
    public function show_spreadsheets(Request $request){


        $search = $request->search;
       $spreadsheets  = Spreadsheet::join("states","spreadsheets.id_state","states.id")
       ->select("spreadsheets.date", "spreadsheets.id", "states.state","spreadsheets.id_state")->get();
       SpreadsheetsController::validate_spreadsheet();
       return view('dashboard.spreadsheets.show', compact('search','spreadsheets'));

    }


    public function show_tpvs($id){

        $spreadsheet_tpvs = Spreadsheet_tpv::join("tpvs","spreadsheet_tpvs.id_tpv","tpvs.id")
        ->join("states","spreadsheet_tpvs.id_state","states.id")
        ->select("states.state","tpvs.tpv","spreadsheet_tpvs.total","spreadsheet_tpvs.sub_total","spreadsheet_tpvs.difference","spreadsheet_tpvs.id_state","spreadsheet_tpvs.id")
        ->where("spreadsheet_tpvs.id_spreadsheet","=","$id")
        ->get();
        return view('dashboard.spreadsheets.show_tpvs', compact("id","spreadsheet_tpvs"));
    }


    public function show_rows_tpvs($id){
        $spreadsheet_tpv = Spreadsheet_tpv::join("tpvs","spreadsheet_tpvs.id_tpv","tpvs.id")
        ->join("states","spreadsheet_tpvs.id_state","states.id")
        ->join("companies","tpvs.id_company","companies.id")
        ->select("states.state","companies.company","tpvs.tpv","spreadsheet_tpvs.total","spreadsheet_tpvs.id_spreadsheet","spreadsheet_tpvs.id","spreadsheet_tpvs.sub_total","spreadsheet_tpvs.difference","spreadsheet_tpvs.id_state")
        ->where("spreadsheet_tpvs.id","=","$id")
        ->first();
        $spreadsheet_rows_tpvs = Spreadsheet_rows_tpv::join("payment_methods","spreadsheet_rows_tpvs.id_payment_method","payment_methods.id")
        ->select("payment_methods.name", "spreadsheet_rows_tpvs.id", "spreadsheet_rows_tpvs.value_pos", "spreadsheet_rows_tpvs.value_treasurer")
        ->where("spreadsheet_rows_tpvs.id_spreadsheet_tpv","=","$id")
        ->get();
        return view("dashboard.spreadsheets.view_rows_tpvs", compact('spreadsheet_tpv','spreadsheet_rows_tpvs'));

    }

    public function save_rows(Request $request){

        $spreadsheet_rows_tpv = Spreadsheet_rows_tpv::find($request->id_spreadsheet_rows_tpv);
        $spreadsheet_rows_tpv->value_treasurer = $request->value_treasurer;
        $spreadsheet_rows_tpv->save();
        return true;

    }

    public function save_spreadsheet_tpv(Request $request){

        $spreadsheet_tpv = Spreadsheet_tpv::find($request->id_spreadsheet_tpv);
        $spreadsheet_tpv->sub_total = $request->sub_total;
        $spreadsheet_tpv->difference = $request->difference;
        $spreadsheet_tpv->id_state = 7;
        $spreadsheet_tpv->save();
        return true;

    }

}
