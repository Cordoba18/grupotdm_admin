<?php

namespace App\Http\Controllers;
//importaciones
use App\Models\Report;
use App\Models\Report_detail;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

//Declaracion de clase
class ReportController extends Controller
{

    //Verificamos autenticacion del usuario
    public function __construct()
    {
        $this->middleware('auth');
    }

    //Funcion que me permite generar un reporte
    public static function create_report($description, $id_user, $id_report_detail){
        date_default_timezone_set('America/Bogota');
        $fechaActual = Carbon::now();
        $fechaFormateada = $fechaActual->format('d/m/Y H:i:s');
        $report = new Report();
        $report->description = $description;
        $report->id_user = $id_user;
        $report->id_report_detail = $id_report_detail;
        $report->date = $fechaFormateada;
        $report->save();
        return true;
    }

//Funcion que me permite ver los reportes
public function show_reports(Request $request){
    $user = Auth::user();
    $report_details = Report_detail::all();
    //Validamos si existe una busqueda o un filtro
    if ($request->search != null && $request->filter != null) {
        $search = "WHERE (r.id LIKE '%$request->search%' OR r.description LIKE '%$request->search%' OR u.name LIKE '%$request->search%' OR r.date LIKE '%$request->search%') AND r.id_report_detail = $request->filter";
    }else if ($request->search != null) {
        $search = "WHERE (r.id LIKE '%$request->search%' OR r.description LIKE '%$request->search%' OR u.name LIKE '%$request->search%' OR r.date LIKE '%$request->search%')";
    } else if ($request->filter != null) {
        $search = "WHERE r.id_report_detail = $request->filter";
    } else {
        $search = "";
    }

    $reports = DB::select("SELECT r.id, r.description, r.id_user, u.name AS name_user, r.date, rd.report, r.id_report_detail, u.id_area
    FROM  reports r
    INNER JOIN report_details rd ON r.id_report_detail = rd.id
    INNER JOIN users u ON r.id_user = u.id $search ORDER BY r.id DESC");

    return view('dashboard.reports.reports',compact('report_details', 'reports'));
    }
}
