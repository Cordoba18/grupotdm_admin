<?php

namespace App\Http\Controllers;

use App\Exports\SpreadsheetsExport;
use App\Mail\spreadsheet_tpvs_finish_notificate;
use App\Models\Area;
use App\Models\Companie;
use App\Models\Payment_method;
use App\Models\Shop;
use App\Models\Spreadsheet;
use App\Models\Spreadsheet_rows_tpv;
use App\Models\Spreadsheet_shop;
use App\Models\Spreadsheet_tpv;
use App\Models\State;
use App\Models\Tpv;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;
use DateTime;
use DateTimeZone;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Maatwebsite\Excel\Facades\Excel;

class SpreadsheetsController extends Controller
{


    //validacion de autenticacion de usuario
    public function __construct()
    {
        $this->middleware('auth');
    }

    public static function validate_spreadsheet(){


        Carbon::setLocale('es');
        $zonaHorariaColombia = new DateTimeZone('America/Bogota');
        $fechaActual = new DateTime('now', $zonaHorariaColombia);
        // Imprimir la hora actual en Colombia
        $fechaAnterior = Carbon::yesterday($zonaHorariaColombia)->format('Y-m-d');
        $fechaActual2 = $fechaActual->format('Y-m-d');
$spreadsheet = Spreadsheet::where("date_now","LIKE","%$fechaActual2%")->first();

       if (!$spreadsheet) {

        $spreadsheet = new Spreadsheet();
        $spreadsheet->date_now = $fechaActual2;
        $spreadsheet->date_previous	 = $fechaAnterior;
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
        $user = Auth::user();
        if(SpreadsheetsController::validate_user()){
            return redirect()->route('dashboard')->with('message_error','No tienes permiso de ingresar al apartado de "Planillas"');
       }
       SpreadsheetsController::validate_spreadsheet();
       $spreadsheets  = Spreadsheet::join("states","spreadsheets.id_state","states.id")
       ->select("spreadsheets.date_previous", "spreadsheets.id", "states.state","spreadsheets.id_state")->get();
       return view('dashboard.spreadsheets.show', compact('spreadsheets',));

    }

//funcion que me permite ver las tpvs de una plantilla
    public function show_tpvs(Request $request,$id){
        if(SpreadsheetsController::validate_user()){
            return redirect()->route('dashboard')->with('message_error','No tienes permiso de ingresar al apartado de "Planillas"');
       }
       $user = Auth::user();
       $validation_jefe = DB::selectOne("SELECT * FROM users u
       INNER JOIN charges c ON u.id_chargy = c.id
        WHERE (c.chargy = 'JEFE DE AREA' OR c.chargy LIKE '%coordinador%') AND u.id_area = 7 AND u.id = $user->id");
        $user = Auth::user();
        $shop = $request->shop;
        $filter = $request->filter;
        $filters = DB::select("SELECT * FROM states WHERE id = 3 OR id=7");
        if($validation_jefe){
            if ($shop && $filter) {
                $spreadsheet_tpvs = Spreadsheet_tpv::join("tpvs","spreadsheet_tpvs.id_tpv","tpvs.id")
                ->join("states","spreadsheet_tpvs.id_state","states.id")
                ->join("shops","tpvs.id_shop","shops.id")
                ->join("companies","shops.id_company","companies.id")
                ->select("states.state","tpvs.tpv","shops.shop","spreadsheet_tpvs.total","spreadsheet_tpvs.sub_total","spreadsheet_tpvs.difference","spreadsheet_tpvs.id_state","spreadsheet_tpvs.id")
                ->where("spreadsheet_tpvs.id_spreadsheet","=","$id")
                ->where("shops.id","=","$shop")
                ->where("spreadsheet_tpvs.id_state","=","$filter")
                ->get();
            } else if($shop){
                $spreadsheet_tpvs = Spreadsheet_tpv::join("tpvs","spreadsheet_tpvs.id_tpv","tpvs.id")
                ->join("states","spreadsheet_tpvs.id_state","states.id")
                ->join("shops","tpvs.id_shop","shops.id")
                ->join("companies","shops.id_company","companies.id")
                ->select("states.state","tpvs.tpv","shops.shop","spreadsheet_tpvs.total","spreadsheet_tpvs.sub_total","spreadsheet_tpvs.difference","spreadsheet_tpvs.id_state","spreadsheet_tpvs.id")
                ->where("spreadsheet_tpvs.id_spreadsheet","=","$id")
                ->where("shops.id","=","$shop")
                ->where("spreadsheet_tpvs.id_state","=","3")
                ->get();
            }else if($filter){
                $spreadsheet_tpvs = Spreadsheet_tpv::join("tpvs","spreadsheet_tpvs.id_tpv","tpvs.id")
                ->join("states","spreadsheet_tpvs.id_state","states.id")
                ->join("shops","tpvs.id_shop","shops.id")
                ->join("companies","shops.id_company","companies.id")
                ->select("states.state","tpvs.tpv","shops.shop","spreadsheet_tpvs.total","spreadsheet_tpvs.sub_total","spreadsheet_tpvs.difference","spreadsheet_tpvs.id_state","spreadsheet_tpvs.id")
                ->where("spreadsheet_tpvs.id_spreadsheet","=","$id")
                ->where("spreadsheet_tpvs.id_state","=","$filter")
                ->get();
            }
            else {
                $spreadsheet_tpvs = Spreadsheet_tpv::join("tpvs","spreadsheet_tpvs.id_tpv","tpvs.id")
                ->join("states","spreadsheet_tpvs.id_state","states.id")
                ->join("shops","tpvs.id_shop","shops.id")
                ->join("companies","shops.id_company","companies.id")
                ->select("states.state","tpvs.tpv","shops.shop","spreadsheet_tpvs.total","spreadsheet_tpvs.sub_total","spreadsheet_tpvs.difference","spreadsheet_tpvs.id_state","spreadsheet_tpvs.id")
                ->where("spreadsheet_tpvs.id_spreadsheet","=","$id")
                ->where("spreadsheet_tpvs.id_state","=","3")
                ->get();
            }
        }else{
        if ($shop && $filter) {
            $spreadsheet_tpvs = Spreadsheet_tpv::join("tpvs","spreadsheet_tpvs.id_tpv","tpvs.id")
            ->join("states","spreadsheet_tpvs.id_state","states.id")
            ->join("shops","tpvs.id_shop","shops.id")
            ->join("spreadsheet_shops","shops.id","spreadsheet_shops.id_shop")
            ->join("companies","shops.id_company","companies.id")
            ->select("states.state","tpvs.tpv","shops.shop","spreadsheet_tpvs.total","spreadsheet_tpvs.sub_total","spreadsheet_tpvs.difference","spreadsheet_tpvs.id_state","spreadsheet_tpvs.id")
            ->where("spreadsheet_shops.id_state","=","1")
            ->where("spreadsheet_tpvs.id_spreadsheet","=","$id")
            ->where("shops.id","=","$shop")
            ->where('spreadsheet_shops.id_user', "=","$user->id")
            ->where("spreadsheet_tpvs.id_state","=","$filter")
            ->get();
        } else if($shop){
            $spreadsheet_tpvs = Spreadsheet_tpv::join("tpvs","spreadsheet_tpvs.id_tpv","tpvs.id")
            ->join("states","spreadsheet_tpvs.id_state","states.id")
            ->join("shops","tpvs.id_shop","shops.id")
            ->join("spreadsheet_shops","shops.id","spreadsheet_shops.id_shop")
            ->join("companies","shops.id_company","companies.id")
            ->select("states.state","tpvs.tpv","shops.shop","spreadsheet_tpvs.total","spreadsheet_tpvs.sub_total","spreadsheet_tpvs.difference","spreadsheet_tpvs.id_state","spreadsheet_tpvs.id")
            ->where("spreadsheet_shops.id_state","=","1")
            ->where("spreadsheet_tpvs.id_spreadsheet","=","$id")
            ->where("shops.id","=","$shop")
            ->where('spreadsheet_shops.id_user', "=","$user->id")
            ->where("spreadsheet_tpvs.id_state","=","3")
            ->get();
        }else if($filter){
            $spreadsheet_tpvs = Spreadsheet_tpv::join("tpvs","spreadsheet_tpvs.id_tpv","tpvs.id")
            ->join("states","spreadsheet_tpvs.id_state","states.id")
            ->join("shops","tpvs.id_shop","shops.id")
            ->join("spreadsheet_shops","shops.id","spreadsheet_shops.id_shop")
            ->join("companies","shops.id_company","companies.id")
            ->select("states.state","tpvs.tpv","shops.shop","spreadsheet_tpvs.total","spreadsheet_tpvs.sub_total","spreadsheet_tpvs.difference","spreadsheet_tpvs.id_state","spreadsheet_tpvs.id")
            ->where("spreadsheet_shops.id_state","=","1")
            ->where("spreadsheet_tpvs.id_spreadsheet","=","$id")
            ->where("spreadsheet_tpvs.id_state","=","$filter")
            ->where('spreadsheet_shops.id_user', "=","$user->id")
            ->get();
        }
        else {
            $spreadsheet_tpvs = Spreadsheet_tpv::join("tpvs","spreadsheet_tpvs.id_tpv","tpvs.id")
            ->join("states","spreadsheet_tpvs.id_state","states.id")
            ->join("shops","tpvs.id_shop","shops.id")
            ->join("spreadsheet_shops","shops.id","spreadsheet_shops.id_shop")
            ->join("companies","shops.id_company","companies.id")
            ->select("states.state","tpvs.tpv","shops.shop","spreadsheet_tpvs.total","spreadsheet_tpvs.sub_total","spreadsheet_tpvs.difference","spreadsheet_tpvs.id_state","spreadsheet_tpvs.id")
            ->where("spreadsheet_shops.id_state","=","1")
            ->where("spreadsheet_tpvs.id_spreadsheet","=","$id")
            ->where('spreadsheet_shops.id_user', "=","$user->id")
            ->where("spreadsheet_tpvs.id_state","=","3")
            ->get();
        }
    }
    if ($validation_jefe) {
       $spreadsheet_shops = Shop::all();
    } else {
        $spreadsheet_shops = Spreadsheet_shop::join("shops","spreadsheet_shops.id_shop","shops.id")
        ->select("shops.id","shops.shop")
        ->where("spreadsheet_shops.id_user","=","$user->id")
        ->where("spreadsheet_shops.id_state","=",1)->get();
    }



        return view('dashboard.spreadsheets.show_tpvs', compact("id","spreadsheet_tpvs","spreadsheet_shops","filters"));
    }

//funcion que me permite ver las filas de una tpv de una plantilla
    public function show_rows_tpvs($id){
        if(SpreadsheetsController::validate_user()){
            return redirect()->route('dashboard')->with('message_error','No tienes permiso de ingresar al apartado de "Planillas"');
       }
        $user = Auth::user();
        $validation_jefe = DB::selectOne("SELECT * FROM users u
        INNER JOIN charges c ON u.id_chargy = c.id
         WHERE (c.chargy = 'JEFE DE AREA' OR c.chargy LIKE '%coordinador%') AND u.id_area = 7 AND u.id = $user->id");
        $spreadsheet_tpv = Spreadsheet_tpv::join("tpvs","spreadsheet_tpvs.id_tpv","tpvs.id")
        ->join("states","spreadsheet_tpvs.id_state","states.id")
        ->join("shops","tpvs.id_shop","shops.id")
        ->join("companies","shops.id_company","companies.id")
        ->select("states.state","shops.shop","companies.company","tpvs.tpv","spreadsheet_tpvs.total","spreadsheet_tpvs.id_spreadsheet","spreadsheet_tpvs.id","spreadsheet_tpvs.sub_total","spreadsheet_tpvs.difference","spreadsheet_tpvs.id_state")
        ->where("spreadsheet_tpvs.id","=","$id")
        ->first();
        $spreadsheet_rows_tpvs = Spreadsheet_rows_tpv::join("payment_methods","spreadsheet_rows_tpvs.id_payment_method","payment_methods.id")
        ->select("payment_methods.name", "spreadsheet_rows_tpvs.difference", "spreadsheet_rows_tpvs.id", "spreadsheet_rows_tpvs.value_pos", "spreadsheet_rows_tpvs.value_treasurer")
        ->where("spreadsheet_rows_tpvs.id_spreadsheet_tpv","=","$id")
        ->get();
        return view("dashboard.spreadsheets.view_rows_tpvs", compact('spreadsheet_tpv','spreadsheet_rows_tpvs','validation_jefe'));

    }

    //funcion que me permite guardar filas
    public function save_rows(Request $request){
        if(SpreadsheetsController::validate_user()){
            return redirect()->route('dashboard')->with('message_error','No tienes permiso de ingresar al apartado de "Planillas"');
       }
        $spreadsheet_rows_tpv = Spreadsheet_rows_tpv::find($request->id_spreadsheet_rows_tpv);
        $spreadsheet_rows_tpv->value_treasurer = $request->value_treasurer;
        $spreadsheet_rows_tpv->difference =  $request->value_difference;
        $spreadsheet_rows_tpv->save();
        return true;

    }

    //funcion que mer permite guardar datos de la tpv
    public function save_spreadsheet_tpv(Request $request){
        if(SpreadsheetsController::validate_user()){
            return redirect()->route('dashboard')->with('message_error','No tienes permiso de ingresar al apartado de "Planillas"');
       }
        $spreadsheet_tpv = Spreadsheet_tpv::find($request->id_spreadsheet_tpv);
        $spreadsheet_tpv->sub_total = $request->sub_total;
        $spreadsheet_tpv->difference = $request->difference;
        // $spreadsheet_tpv->id_state = 7;
        $spreadsheet_tpv->save();
        return true;

    }

    public function pdf(Request $request){
        if(SpreadsheetsController::validate_user()){
            return redirect()->route('dashboard')->with('message_error','No tienes permiso de ingresar al apartado de "Planillas"');
       }
       $user = Auth::user();

       $validation_jefe = DB::selectOne("SELECT * FROM users u
       INNER JOIN charges c ON u.id_chargy = c.id
        WHERE (c.chargy = 'JEFE DE AREA' OR c.chargy LIKE '%coordinador%') AND u.id_area = 7 AND u.id = $user->id");
if ($validation_jefe) {
    $spreadsheets  = Spreadsheet::join("states","spreadsheets.id_state","states.id")
        ->select("spreadsheets.date_previous", "spreadsheets.id", "states.state","spreadsheets.id_state")
        ->where("spreadsheets.id","=","$request->id_spreadsheets")
        ->first();
        $id_company = $request->id_company;
        $spreadsheet_tpvs = Spreadsheet_tpv::join("tpvs","spreadsheet_tpvs.id_tpv","tpvs.id")
        ->join("states","spreadsheet_tpvs.id_state","states.id")
        ->join("shops","tpvs.id_shop","shops.id")
        ->join("companies","shops.id_company","companies.id")
        ->select("states.state","tpvs.tpv","shops.id_company","shops.shop","shops.id as id_shop","companies.company","spreadsheet_tpvs.total","spreadsheet_tpvs.sub_total","spreadsheet_tpvs.difference","spreadsheet_tpvs.id_state","spreadsheet_tpvs.id")
        ->where("spreadsheet_tpvs.id_spreadsheet","=","$request->id_spreadsheets")
        ->where("shops.id_company","=","$request->id_company")
        ->orderBy('shops.id', 'desc')
        ->get();

        $spreadsheet_rows_tpvs = Spreadsheet_rows_tpv::join("payment_methods","spreadsheet_rows_tpvs.id_payment_method","payment_methods.id")
        ->select("payment_methods.name","spreadsheet_rows_tpvs.difference", "spreadsheet_rows_tpvs.id","spreadsheet_rows_tpvs.id_spreadsheet_tpv", "spreadsheet_rows_tpvs.value_pos", "spreadsheet_rows_tpvs.value_treasurer")
        ->get();


}else{

    $spreadsheets  = Spreadsheet::join("states","spreadsheets.id_state","states.id")
    ->select("spreadsheets.date_previous", "spreadsheets.id", "states.state","spreadsheets.id_state")
    ->where("spreadsheets.id","=","$request->id_spreadsheets")
    ->first();
    $id_company = $request->id_company;
    $spreadsheet_tpvs = Spreadsheet_tpv::join("tpvs","spreadsheet_tpvs.id_tpv","tpvs.id")
    ->join("states","spreadsheet_tpvs.id_state","states.id")
    ->join("shops","tpvs.id_shop","shops.id")
    ->join("spreadsheet_shops","shops.id","spreadsheet_shops.id_shop")
    ->join("companies","shops.id_company","companies.id")
    ->select("states.state","tpvs.tpv","shops.id_company","shops.shop","shops.id as id_shop","companies.company","spreadsheet_tpvs.total","spreadsheet_tpvs.sub_total","spreadsheet_tpvs.difference","spreadsheet_tpvs.id_state","spreadsheet_tpvs.id")
    ->where("spreadsheet_shops.id_state","=","1")
    ->where("spreadsheet_tpvs.id_spreadsheet","=","$request->id_spreadsheets")
    ->where("shops.id_company","=","$request->id_company")
    ->where('spreadsheet_shops.id_user', "=","$user->id")
    ->orderBy('shops.id', 'desc')
    ->get();

    $spreadsheet_rows_tpvs = Spreadsheet_rows_tpv::join("payment_methods","spreadsheet_rows_tpvs.id_payment_method","payment_methods.id")
    ->select("payment_methods.name","spreadsheet_rows_tpvs.difference", "spreadsheet_rows_tpvs.id","spreadsheet_rows_tpvs.id_spreadsheet_tpv", "spreadsheet_rows_tpvs.value_pos", "spreadsheet_rows_tpvs.value_treasurer")
    ->get();



}

        $pdf = Pdf::loadView('dashboard.spreadsheets.pdf.pdf',compact('spreadsheets','spreadsheet_tpvs','spreadsheet_rows_tpvs','id_company'));
        return $pdf->stream();
    }

    public function show_spreadsheets_shops(Request $request){
        if(SpreadsheetsController::validate_user()){
            return redirect()->route('dashboard')->with('message_error','No tienes permiso de ingresar al apartado de "Planillas"');
       }
        $companies = Companie::whereIn('id', [1, 2])->get();
        $shops = Shop::all();
        $user = Auth::user();
        $validation_jefe = DB::selectOne("SELECT * FROM users u
        INNER JOIN charges c ON u.id_chargy = c.id
         WHERE (c.chargy = 'JEFE DE AREA' OR c.chargy LIKE '%coordinador%') AND u.id_area = 7 AND u.id = $user->id");
        $users = User::all()->where("id_area","=","7");
        $spreadsheet_shops =  Spreadsheet_shop::join("shops","spreadsheet_shops.id_shop","shops.id")
        ->join("companies","shops.id_company","companies.id")
        ->join("users","spreadsheet_shops.id_user","users.id")
        ->select("shops.shop", "companies.company", "spreadsheet_shops.id","users.name","users.id as id_user")
        ->where("spreadsheet_shops.id_state","=","1")
        ->get();
        return view("dashboard.spreadsheets.shops.show",compact("users","validation_jefe","spreadsheet_shops","companies","shops"));
    }

    public function create_spreadsheets_shops(Request $request){
        if(SpreadsheetsController::validate_user()){
            return redirect()->route('dashboard')->with('message_error','No tienes permiso de ingresar al apartado de "Planillas"');
       }
        $validation = Spreadsheet_shop::where("id_user","=","$request->id_user")
        ->where("id_shop","=","$request->id_shop")
        ->where("id_state","=",1)->first();
        if ($validation) {
           return redirect()->route('dashboard.spreadsheets.shops')->with("message_error","Ya existe esa asignación de tienda");

        }else{
            $new_spreadsheets_shops = new Spreadsheet_shop();
            $new_spreadsheets_shops->id_user = $request->id_user;
            $new_spreadsheets_shops->id_shop = $request->id_shop;
            $new_spreadsheets_shops->id_state = 1;
            $new_spreadsheets_shops->save();
            return redirect()->route('dashboard.spreadsheets.shops')->with("message","Usuario a signado correctamente!");
        }

    }

    public function delete_spreadsheets_shops(Request $request){
        if(SpreadsheetsController::validate_user()){
            return redirect()->route('dashboard')->with('message_error','No tienes permiso de ingresar al apartado de "Planillas"');
       }
        $spreadsheets_shops = Spreadsheet_shop::find($request->id_spreadsheet_shop);
        $spreadsheets_shops->id_state = 2;
        $spreadsheets_shops->save();
        return redirect()->route('dashboard.spreadsheets.shops')->with("message","Asignacion eliminada con exito");
    }


    public function state_tpvs(Request $request){
        if(SpreadsheetsController::validate_user()){
            return redirect()->route('dashboard')->with('message_error','No tienes permiso de ingresar al apartado de "Planillas"');
       }

       $jefes = DB::select("SELECT * FROM users u
       INNER JOIN charges c ON u.id_chargy = c.id
        WHERE (c.chargy = 'JEFE DE AREA' OR c.chargy LIKE '%coordinador%') AND u.id_area = 7");
        $spreadsheet_tpv = Spreadsheet_tpv::find($request->id_spreadsheet_tpv);
        if ($spreadsheet_tpv->id_state == 3) {
            $spreadsheet_tpv->id_state = 7;
            $data = Spreadsheet_rows_tpv::leftJoin("payment_methods","spreadsheet_rows_tpvs.id_payment_method","payment_methods.id")
            ->leftJoin("spreadsheet_tpvs","spreadsheet_rows_tpvs.id_spreadsheet_tpv","spreadsheet_tpvs.id")
            ->leftJoin("states","spreadsheet_tpvs.id_state","states.id")
            ->leftJoin("tpvs","spreadsheet_tpvs.id_tpv","tpvs.id")
            ->leftJoin("shops","tpvs.id_shop","shops.id")
            ->leftJoin("companies","shops.id_company","companies.id")
            ->leftJoin("spreadsheets","spreadsheet_tpvs.id_spreadsheet","spreadsheets.id")
            ->leftJoin("spreadsheet_shops","shops.id","spreadsheet_shops.id_shop")
            ->leftJoin("users","spreadsheet_shops.id_user","users.id")
            ->select("users.name",
                "spreadsheets.date_previous","spreadsheets.date_now",
                "tpvs.tpv","companies.company","shops.shop",
            "spreadsheet_tpvs.total as total_pos","spreadsheet_tpvs.sub_total as sub_total_pos","spreadsheet_tpvs.difference as difference_pos",
            "payment_methods.name as payment_method","spreadsheet_rows_tpvs.value_pos",
            "spreadsheet_rows_tpvs.value_treasurer","spreadsheet_rows_tpvs.difference","states.state")
            ->where("spreadsheet_shops.id_state","=","1")
            ->where("spreadsheet_tpvs.id","=","$request->id_spreadsheet_tpv")
            ->orderBy('shops.id', 'desc')
            ->get();

            foreach ($jefes as $jefe) {
                Mail::to($jefe->email)->send(new spreadsheet_tpvs_finish_notificate($jefe, $data));
            }


        }else{
            $spreadsheet_tpv->id_state = 3;
        }
        $spreadsheet_tpv->save();

        return redirect()->route('dashboard.spreadsheets.tpvs.rows_tpvs', $request->id_spreadsheet_tpv)->with("message","Estado de conteo cambiado!");


    }

    public static function validate_user(){


        $id_area = Auth::user()->id_area;

        if ($id_area != 7 && $id_area != 1) {
            return true;

        }else{
            return false;
        }
      }

      public function excel(Request $request){
        return Excel::download(new SpreadsheetsExport($request->id_spreadsheets,$request->id_company), "Informe_Tesoreria_Grupo_TDM.xlsx");
      }
}
