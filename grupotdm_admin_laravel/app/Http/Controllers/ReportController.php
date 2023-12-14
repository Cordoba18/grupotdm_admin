<?php

namespace App\Http\Controllers;

use App\Models\Report;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ReportController extends Controller
{
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
}
