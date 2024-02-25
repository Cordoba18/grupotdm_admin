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


    public static function get_consultas($url, $xml_data)
    {

        $client = new \GuzzleHttp\Client();
        $data = $client->request('POST', $url, [
            'headers' => [
                'Content-Type' => 'text/xml'
            ],
            'body' => $xml_data
        ]);

        $xml = simplexml_load_string($data->getBody());
        $ns = $xml->getNamespaces(true);
        $soap = $xml->children($ns['soap']);
        $result = $soap->children()->EjecutarConsultaXMLResponse->EjecutarConsultaXMLResult;
        $diff = $result->children($ns['diffgr'])->diffgram->children();

        return $diff->NewDataSet->Resultado;
    }

    //Consulta que inserta los metodos de pago de siesa ha mi tabla
    public static function add_payment_methods(){

        $nombreConexion = 'Real-Prueba';
        $idCia = 1;
        $idProveedor = 'OK';
        $idConsulta = 'CLS_MED_PAG_X_CIAS';
        $usuario = 'unoee';
        $clave = '805027653';
        $parametros = [
            'COMP' => 2,
        ];

        $soapUrl = "http://201.234.74.111:9086/WSUNOEE.asmx?op=EjecutarConsultaXML";

        try {


            $xml_post_string = "<soap:Envelope xmlns:soap='http://www.w3.org/2003/05/soap-envelope' xmlns:tem='http://tempuri.org/'>
        <soap:Header/>
        <soap:Body>
            <tem:EjecutarConsultaXML>
                <!--Optional:-->
                <tem:pvstrxmlParametros><![CDATA[<?xml version='1.0' encoding='utf-8'?>
                <Consulta>
                <NombreConexion>{$nombreConexion}</NombreConexion>
                <IdCia>{$idCia}</IdCia>
                <IdProveedor>{$idProveedor}</IdProveedor>
                <IdConsulta>{$idConsulta}</IdConsulta>
                <Usuario>{$usuario}</Usuario>
                <Clave>{$clave}</Clave>
                <Parametros>";
            foreach ($parametros as $key => $value) {
                $xml_post_string .= "<{$key}>{$value}</{$key}>";
            }
            $xml_post_string .= "</Parametros>
            </Consulta>
                ]]></tem:pvstrxmlParametros>
            </tem:EjecutarConsultaXML>
        </soap:Body>
        </soap:Envelope>";


            $data = self::get_consultas($soapUrl, $xml_post_string);
            if ($data) {
                foreach ($data as $resultado) {

                    $validation_payment_method = Payment_method::where("name","=",$resultado->f025_descripcion)->where("id_company","=","$resultado->f025_id_cia")->first();
                    if (!$validation_payment_method) {
                        $new_payment_method = new Payment_method();
                        $new_payment_method->description = $resultado->f025_id;
                        $new_payment_method->name = $resultado->f025_descripcion;
                        $new_payment_method->id_state = $resultado->id_state;
                        $new_payment_method->id_company = $resultado->f025_id_cia;
                        $new_payment_method->save();
                    }
                }
            }
        } catch (\Throwable $th) {
            throw $th;
        }

    }
    //Funcion que me permite guardar las tpvs de la base de datos a mi tabla
    public static function add_tpvs(){

        $nombreConexion = 'Real-Prueba';
        $idCia = 1;
        $idProveedor = 'OK';
        $idConsulta = 'CLS_TPVS_X_CIAS';
        $usuario = 'unoee';
        $clave = '805027653';
        $parametros = [
            'COMP' => 2,
        ];

        $soapUrl = "http://201.234.74.111:9086/WSUNOEE.asmx?op=EjecutarConsultaXML";

        try {


            $xml_post_string = "<soap:Envelope xmlns:soap='http://www.w3.org/2003/05/soap-envelope' xmlns:tem='http://tempuri.org/'>
        <soap:Header/>
        <soap:Body>
            <tem:EjecutarConsultaXML>
                <!--Optional:-->
                <tem:pvstrxmlParametros><![CDATA[<?xml version='1.0' encoding='utf-8'?>
                <Consulta>
                <NombreConexion>{$nombreConexion}</NombreConexion>
                <IdCia>{$idCia}</IdCia>
                <IdProveedor>{$idProveedor}</IdProveedor>
                <IdConsulta>{$idConsulta}</IdConsulta>
                <Usuario>{$usuario}</Usuario>
                <Clave>{$clave}</Clave>
                <Parametros>";
            foreach ($parametros as $key => $value) {
                $xml_post_string .= "<{$key}>{$value}</{$key}>";
            }
            $xml_post_string .= "</Parametros>
            </Consulta>
                ]]></tem:pvstrxmlParametros>
            </tem:EjecutarConsultaXML>
        </soap:Body>
        </soap:Envelope>";


            $data = self::get_consultas($soapUrl, $xml_post_string);
            if ($data) {
                foreach ($data as $resultado) {

                    $valitation_tpv = Tpv::join("shops","tpvs.id_shop","shops.id")
                    ->where("tpvs.tpv","=",$resultado->tpv)->where("shops.operation_center","=","$resultado->operation_center")
                    ->where("shops.id_company","=","$resultado->id_company")->first();

                    if (!$valitation_tpv) {
                        dd("REVISA TU INFORMACION");
                        $shop = Shop::where("id_company","=","$resultado->id_company")->where("operation_center","=","$resultado->operation_center")->first();
                        if($shop){
                        $new_tpv = new Tpv();
                        $new_tpv->tpv = $resultado->tpv;
                        $new_tpv->description = $resultado->description;
                        $new_tpv->id_shop = $shop->id;
                        $new_tpv->id_state = 1;
                        $new_tpv->save();
                    }
                    }
                }
            }
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public static function add_buys($id_company,$date, $operation_center){

        $nombreConexion = 'Real-Prueba';
        $idCia = 1;
        $idProveedor = 'OK';
        $idConsulta = 'CLS_TESORERIA_V2_DOCS_ENC';
        $usuario = 'unoee';
        $clave = '805027653';
        $parametros = [
            'COMP' => $id_company,
            'CO' => $operation_center,
            'FECHA_INI' => $date,
            'FECHA_FIN' => $date,
        ];

        $soapUrl = "http://201.234.74.111:9086/WSUNOEE.asmx?op=EjecutarConsultaXML";

        try {


            $xml_post_string = "<soap:Envelope xmlns:soap='http://www.w3.org/2003/05/soap-envelope' xmlns:tem='http://tempuri.org/'>
        <soap:Header/>
        <soap:Body>
            <tem:EjecutarConsultaXML>
                <!--Optional:-->
                <tem:pvstrxmlParametros><![CDATA[<?xml version='1.0' encoding='utf-8'?>
                <Consulta>
                <NombreConexion>{$nombreConexion}</NombreConexion>
                <IdCia>{$idCia}</IdCia>
                <IdProveedor>{$idProveedor}</IdProveedor>
                <IdConsulta>{$idConsulta}</IdConsulta>
                <Usuario>{$usuario}</Usuario>
                <Clave>{$clave}</Clave>
                <Parametros>";
            foreach ($parametros as $key => $value) {
                $xml_post_string .= "<{$key}>{$value}</{$key}>";
            }
            $xml_post_string .= "</Parametros>
            </Consulta>
                ]]></tem:pvstrxmlParametros>
            </tem:EjecutarConsultaXML>
        </soap:Body>
        </soap:Envelope>";
            $data = self::get_consultas($soapUrl, $xml_post_string);

            if ($data) {
                    return $data;
            }
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public static function validate_spreadsheet(){


        Carbon::setLocale('es');
        $zonaHorariaColombia = new DateTimeZone('America/Bogota');
        $fechaActual = new DateTime('now', $zonaHorariaColombia);
        // Imprimir la hora actual en Colombia
        $fechaAnterior = Carbon::yesterday($zonaHorariaColombia)->format('Y-m-d');
        $fechaAnterior_pos = Carbon::yesterday($zonaHorariaColombia)->format('Ymd');
        $fechaActual2 = $fechaActual->format('Y-m-d');
$spreadsheet = Spreadsheet::where("date_now","LIKE","%$fechaActual2%")->first();

       if (!$spreadsheet) {

        $spreadsheet = new Spreadsheet();
        $spreadsheet->date_now = $fechaActual2;
        $spreadsheet->date_previous	 = $fechaAnterior;
        $spreadsheet->id_state = 1;
        $spreadsheet->save();
       }
       $shops = Shop::whereIn('id_company', [1, 2])->get();
       foreach ($shops as $s) {
        # code...
        $validation = false;
        $tpvs = Tpv::all()->where("id_state","=","1")->where("id_shop","=","$s->id");
        foreach ($tpvs as $t) {
            $spreadsheet_tpv = Spreadsheet_tpv::where("id_spreadsheet","=","$spreadsheet->id")
            ->where("id_tpv","=","$t->id")->first();
            if (!$spreadsheet_tpv) {
                $validation = true;
            }
        }


        if ($validation) {
            # code...

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


        }
    }
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
        $spreadsheet_shops = Shop::where("id_company", 1)
        ->orWhere("id_company", 2)
        ->get();
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

       $spreadsheets  = Spreadsheet::join("spreadsheet_tpvs","spreadsheets.id","spreadsheet_tpvs.id_spreadsheet")
       ->select("spreadsheets.date_previous")
       ->where("spreadsheet_tpvs.id","=",$id)
       ->first();

       $fechaAnterior_pos = Carbon::createFromFormat('Y-m-d', $spreadsheets->date_previous)->format('Ymd');
       $total = 0;
       $spreadsheet_tpv = Spreadsheet_tpv::find($id);
       $t = Tpv::join("shops","tpvs.id_shop","shops.id")
       ->where("tpvs.id","=","$spreadsheet_tpv->id_tpv")
       ->first();
       $spreadsheet_rows_tpvs = Spreadsheet_rows_tpv::all()->where("id_spreadsheet_tpv","=","$spreadsheet_tpv->id");
       $payment_methods = Payment_method::all()->where("id_company","=","$t->id_company");
       $total_rows = 0;
       $total_payment_methods = 0;

       foreach ($spreadsheet_rows_tpvs as $key) {
        $total_rows = $total_rows + 1;
       }
       foreach ($payment_methods as $key => $value) {
        $total_payment_methods = $total_payment_methods + 1;
       }


if ($total_payment_methods !== $total_rows) {

       $data = SpreadsheetsController::add_buys($t->id_company, $fechaAnterior_pos, $t->operation_center);
        foreach ($payment_methods as $p) {
            $spreadsheet_rows_tpvs = Spreadsheet_rows_tpv::where("id_payment_method","="," $p->id")
            ->where("id_spreadsheet_tpv","=","$spreadsheet_tpv->id")->first();
            if (!$spreadsheet_rows_tpvs) {
                $spreadsheet_rows_tpvs = new Spreadsheet_rows_tpv();
                $spreadsheet_rows_tpvs->id_payment_method = $p->id;
                $spreadsheet_rows_tpvs->id_spreadsheet_tpv = $spreadsheet_tpv->id;
            //valor del pos
            $numero = 0;
            foreach ($data as $d) {

                $cosa = $d->tpv;
                if ($p->description == $d->id_medio_pago && $t->tpv == $d->tpv) {

                    $numero = intval($d->VALOR_NET);

                }
            }
            try {
                $spreadsheet_rows_tpvs->value_pos = $numero;
            } catch (\Throwable $th) {
                //throw $th;
            }

                $spreadsheet_rows_tpvs->save();

            }
            $total = $total + intval($spreadsheet_rows_tpvs->value_pos);
        }

        $spreadsheet_tpv->total = $total;

        if($total == 0){
            $spreadsheet_tpv->id_state = 2;
            $spreadsheet_tpv->save();
            return redirect()->route('dashboard.spreadsheets.tpvs', $spreadsheet_tpv->id_spreadsheet)->with("message_error", "La $t->tpv no tuvo ventas");
        }

        $spreadsheet_tpv->save();
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
        ->where("spreadsheet_tpvs.id_state","<>","2")
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
    ->where("spreadsheet_tpvs.id_state","<>","2")
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
