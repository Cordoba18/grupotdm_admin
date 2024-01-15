<?php

namespace App\Http\Controllers;

use App\Mail\notification_certificate;
use App\Models\Certificate;
use App\Models\Report_product;
use App\Models\Row_Certificate;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class Mails_Controller extends Controller
{
   public function accept_certificate(Request $request){
    $id_certificate = $request->id_certificate;
    $id_user_receives = $request->id_user_receives;
    $certificate = Certificate::find($id_certificate);
    $user_receive = User::find($certificate->id_user_receives);
    $user_delivery = User::find($certificate->id_user_delivery);
    $date = $fechaHoraColombiana = Carbon::now('America/Bogota')->format('d/m/Y H:i:s');
    if(!$certificate->date_delivery){
    if ($id_user_receives == $certificate->id_user_receives) {
        $certificate->id_state = 12;
        $certificate->image_delivery = "success.png";
        $certificate->date_delivery = $date;
        $certificate->save();
        $rows_certificates = Row_Certificate::all()->where('id_certificate','=',$id_certificate);
        $state_certificate = DB::selectOne("SELECT s.state FROM certificates c INNER JOIN states s ON c.id_state = s.id WHERE c.id=$id_certificate")->state;
        foreach ($rows_certificates as $r) {
            $new_report_product = new Report_product();
            $new_report_product->id_product = $r->id_product;
            $new_report_product->id_certificate = $id_certificate;
            $new_report_product->report = "El producto asociado al acta con ID $certificate->id y fecha $certificate->address esta en estado $state_certificate";
            $new_report_product->save();
        }
        ReportController::create_report("El usuario $user_delivery->name ha recibido los componentes asignados al acta con ID $id_certificate para la siguiente dirección $certificate->address", $user_delivery->id, 17);
        Mail::to($user_delivery->email)->send(new notification_certificate($user_delivery, "que el acta con ID $certificate->id y fecha $certificate->date ha llegado al punto y ha sido recibido con exito!"));
    return view('dashboard.accept_emails.view_return_certificate', compact('user_delivery', 'certificate'));
        }
    }else{
        return view('dashboard.accept_emails.view_return_certificate', compact('user_delivery', 'certificate'));
    }
   }
}