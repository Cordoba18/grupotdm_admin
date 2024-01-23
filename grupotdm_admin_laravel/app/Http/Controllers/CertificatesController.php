<?php
//importaciones
namespace App\Http\Controllers;

use App\Mail\accept_certificate;
use App\Mail\create_certificate;
use App\Mail\Notificate_Finish_Certificate;
use App\Mail\notification_certificate;
use App\Models\Area;
use App\Models\Certificate;
use App\Models\Origin_Certificate;
use App\Models\Proceeding;
use App\Models\Product;
use App\Models\Report_Certificate;
use App\Models\Report_product;
use App\Models\Row_Certificate;
use App\Models\State_Certificate;
use App\Models\Type_Component;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
//declaracion de clase
class CertificatesController extends Controller
{

    //validacion de sesion del usuario
    public function __construct()
    {
        $this->middleware('auth');
    }

    //mostrar certificados
    public function show_certificates(Request $request){
        $user = Auth::user();
        $filters = DB::select("SELECT * FROM states WHERE id= 2  OR id = 3 OR id=11 OR id=12");
        $search = $request->search;
        $filter = $request->filter;
        //validar filtro y buscador para la busqueda de certificados
        if($request->search !== null && $request->filter !== null){
            $sql = " WHERE (p.proceeding LIKE '%$request->search%' OR c.date LIKE '%$request->search%' OR ud.name LIKE '%$request->search%' OR ur.name LIKE '%$request->search%' OR s.state LIKE '%$request->search%')
            AND c.id_state = $request->filter";
        }else if($request->search !== null){
            $sql = " WHERE (p.proceeding LIKE '%$request->search%' OR c.date LIKE '%$request->search%' OR ud.name LIKE '%$request->search%' OR ur.name LIKE '%$request->search%' OR s.state LIKE '%$request->search%')";
        }else if($request->filter !== null){
            $sql = " WHERE c.id_state = $request->filter";
        } else{
        $sql = "WHERE c.id_state <> 12 AND c.id_state <> 2";
        }
        $certificates = DB::select("SELECT c.name_user_receives, c.id, p.proceeding, c.date, ud.name AS name_delivery, ud.id AS id_user_delivery, ur.name AS name_receives, ur.id AS id_user_receives, s.state, c.id_state
        FROM certificates c
        INNER JOIN proceedings p ON c.id_proceeding = p.id
        INNER JOIN users ud ON c.id_user_delivery = ud.id
        LEFT JOIN users ur ON c.id_user_receives = ur.id
        INNER JOIN states s ON c.id_state = s.id
        $sql ORDER BY c.id DESC");

        return view('dashboard.certificates.certificates', compact('user','search','filter','filters','certificates'));
        }


        //funcion que muestra la vista para crear un certificado
        public function create_certificate(){
            $my_user = Auth::user();
            $user = DB::selectOne("SELECT u.id,  a.area, u.name FROM users u
            INNER JOIN areas a ON u.id_area = a.id
            WHERE u.id = $my_user->id");
            $areas = Area::all();
            $proceedings = Proceeding::all();
            $origins_certificates = Origin_Certificate::all();
            $states_certificates = State_Certificate::all();
            $types_components = Type_Component::all();
            return view('dashboard.certificates.create', compact('user', 'areas', 'proceedings','origins_certificates','states_certificates','types_components'));
        }

        //funcion que guarda el certificado SIN LAS COLUMNAS devolviendo una respuesta con id del certificado al documento js
        public function save_certificate(Request $request){
            $user = Auth::user();
            $user_receive = User::find($request->id_user_receives);
            $new_certificate = new Certificate();
            $new_certificate->id_proceeding = $request->id_proceeding;
            $new_certificate->date = $request->date;
            $new_certificate->address = $request->address;
            $new_certificate->id_user_delivery = $user->id;
            //verificacion de usuario escrito o usuario que hace parte del mismo sistema
            if($request->name_user_receives == ""){
                $new_certificate->id_user_receives = $request->id_user_receives;

            }else{
                $new_certificate->name_user_receives = $request->name_user_receives;
            }


            $new_certificate->general_remarks = $request->general_remarks	;
            $new_certificate->id_state = 3;
            $new_certificate->save();
            $certificate = DB::selectOne("SELECT * FROM certificates WHERE date = '$request->date' AND id_user_delivery = $user->id AND address = '$request->address'");

            if($request->name_user_receives == ""){
                $user_receive = User::find($request->id_user_receives);
                //hacer reporte en base de datos
            ReportController::create_report("El usuario $user->name ha creado un acta para $user_receive->name para la siguiente dirección $request->address", $user->id, 17);
            //enviar correo
            Mail::to($user_receive->email)->send(new create_certificate($user_receive, $user,$certificate));
            //notificar al evento del usuario y guardar en base de datos la notificacion
            NotificationController::create_notification("Se ha creado una nueva acta para ti", $request->id_user_receives , route('dashboard.certificates.view_certificate',$certificate->id));
        }
            return response()->json(['id_certificate'=> $certificate->id],200);
        }

        //Funcion que elimina el certificado
        public function delete_certificate(Request $request){
            $user = Auth::user();
            $id_certificate = $request->id_certificate;
            $certificate = Certificate::find($id_certificate);
            $rows_certificates = Row_Certificate::all()->where('id_certificate','=',$id_certificate);

            //Crear reporte y devolver todos los productos de las filas a estado ACTIVO
            foreach ($rows_certificates as $r) {
                $new_report_product = new Report_product();
                $new_report_product->id_product = $r->id_product;
                $product = Product::find($r->id_product);
                $product->id_state = 1;
                $product->save();
                $new_report_product->id_certificate = $id_certificate;
                $new_report_product->report = "El producto ya NO se encuentra asignado al acta  con ID $id_certificate";
                $new_report_product->save();
            }


            $certificate->id_state = 2;
            $certificate->save();
            //Validar si es un usuario preescrito o del sistema
            if($certificate->name_user_receives){
                //crear reporte
                ReportController::create_report("El usuario $user->name ha eliminado el acta con ID $id_certificate para $certificate->name_user_receives para la siguiente dirección $request->address", $user->id, 17);
            }else{
                //Notificar
                NotificationController::create_notification("Se ha eliminado el acta el cual ibas a recibir", $certificate->id_user_receives , route('dashboard.certificates.view_certificate',$certificate->id));
                $user_receive = User::find($certificate->id_user_receives);
                //Crear reporte
                ReportController::create_report("El usuario $user->name ha eliminado el acta con ID $id_certificate para $user_receive->name para la siguiente dirección $request->address", $user->id, 17);
                //Enviar correo
                Mail::to($user_receive->email)->send(new notification_certificate($user_receive, "que el usuario $user->name ha eliminado el certificado con ID $certificate->id y fecha $certificate->date"));
            }

            return redirect()->route('dashboard.certificates')->with('message','Certificado eliminado con exito!');

        }

        //Funcion que guarda las filas del certificado previo de ser creado
        public function save_rows_certificate(Request $request){
            $user = Auth::user();

//Guardar fila
            $new_rows_certificate = new Row_Certificate();
            $new_rows_certificate->id_product = $request->id_product;
            $new_rows_certificate->id_certificate = $request->id_certificate;
            $new_rows_certificate->save();

            //El producto pasa ha tener el estado del certificado
            $certificate = Certificate::find($request->id_certificate);
            $product = Product::find($request->id_product);
            $product->id_state = $certificate->id_state;
            $product->save();
            //Crear reporte del producto para saber su ubicación
            $new_report_product = new Report_product();
            $new_report_product->id_product = $request->id_product;
            $new_report_product->id_certificate = $request->id_certificate;
            $new_report_product->report = "El producto se encuentra pendiente asignado al acta  con ID $request->id_certificate  para la direcciòn $certificate->address";
            $new_report_product->save();
            //Responder al archivo JS
            return response()->json(['message'=> true],200);
            }

            //Funcion que busca los usuario del area que no esten inactivos y retorna al archivo JS los usuarios
            public function get_users_areas($id){

                $users = DB::select("SELECT * FROM users WHERE id_area = $id AND id_state <> 2");
                return response()->json(['users' => $users], 200);
            }



            //funcion que recibe el id del certificado para busquedas y muestra la vista del certificado
public function view_certificate($id){

    $certificate = DB::selectOne("SELECT c.name_user_receives, c.general_remarks, c.id_proceeding, c.id, p.proceeding, c.date, c.address, s.state, c.id_state, ur.id
    AS id_user_receives, ud.id
    AS id_user_delivery, ur.name
    AS name_receives, ur.id_area
    AS id_area_user_receives ,ar.area
    AS area_receives, ud.name
    AS name_delivery, ad.area
    AS area_delivery
    FROM certificates c
    INNER JOIN proceedings p ON c.id_proceeding = p.id
    INNER JOIN states s ON c.id_state = s.id
    LEFT JOIN users ur ON c.id_user_receives = ur.id
    LEFT JOIN areas ar ON ur.id_area = ar.id
    INNER JOIN users ud ON c.id_user_delivery = ud.id
    INNER JOIN areas ad ON ud.id_area = ad.id
    WHERE c.id = $id");

    $user_reception = DB::selectOne("SELECT u.name, u.id FROM users u
    INNER JOIN certificates c ON u.id = c.id_user_reception WHERE c.id = $id");
    $certificate_full = Certificate::find($id);
 $rows_certificate = DB::select("SELECT r.id, p.id AS id_product, p.name, p.brand, p.serie, o.origin_certificate, s.state_certificate, t.type_component, p.accessories
 FROM rows_certificates r
 INNER JOIN products p ON r.id_product = p.id
 INNER JOIN origins_certificates o ON p.id_origin_certificate = o.id
 INNER JOIN states_certificates s ON p.id_state_certificate = s.id
 INNER JOIN type_components t ON p.id_type_component = t.id WHERE r.id_certificate = $id");
 return view('dashboard.certificates.view_certificate',compact('certificate','user_reception','certificate_full','rows_certificate'));
}

//Funcion que permite cambiar el estado del certificado guardando foto y imagen
public function state_certificate(Request $request){
    $user = Auth::user();
        $id_certificate = $request->id_certificate;
        $date = $request->date;
        $certificate = Certificate::find($id_certificate);
        $user_receive = User::find($certificate->id_user_receives);
        $user_delivery = User::find($certificate->id_user_delivery);
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $fechaHoraActual = now()->format('Y-m-d_H-i-s');
            $name_file = $fechaHoraActual . '.' . $file->getClientOriginalExtension();
            $rutaImagen = public_path('storage/files/' . $name_file);
            $file->move(public_path('storage/files'), $name_file);
        }

        //validar si el certificado esta pendiente y cambiar estado
        if ($certificate->id_state == 3) {
            $certificate->id_state = 11;
            $certificate->image_exit = $name_file;
            $certificate->date_exit = $date;
            //validar si el usuario esta preescrito o es el distema
            if($certificate->name_user_receives){
                //hacer reporte
                ReportController::create_report("El usuario $user->name ha Despachado los componentes asignados al acta con ID $id_certificate para $certificate->name_user_receives para la siguiente dirección $certificate->address", $user->id, 17);
                //guardar usuario de recepcion en cada de que sea un acta de salida
                if ($certificate->id_proceeding == 1){
                    $certificate->id_user_reception = $user->id;
                }
            }else{
                //notificar al usuario
                NotificationController::create_notification("El acta el cual recibiras se encuentra despachada", $certificate->id_user_receives , route('dashboard.certificates.view_certificate',$certificate->id));
                $user_receive = User::find($certificate->id_user_receives);
                $certificate->id_user_reception = $user->id;
                //hacer reporte
                ReportController::create_report("El usuario $user->name ha Despachado los componentes asignados al acta con ID $id_certificate para $user_receive->name para la siguiente dirección $certificate->address", $user->id, 17);
                //enviar correo
                Mail::to($user_receive->email)->send(new accept_certificate($user_receive, "que el acta con ID $certificate->id y fecha $certificate->date salio de las instalaciones para la direccion expecificada: $certificate->address", $certificate));

            }

        }else{
            //cambiar estado
            $certificate->id_state = 12;
            $certificate->image_delivery = $name_file;
            $certificate->date_delivery = $date;
            //validar si el usuario esta preescrito o es el distema
            if($certificate->name_user_receives){
                //guardar reporte
                ReportController::create_report("El usuario $user_delivery->name ha recibido los componentes asignados al acta con ID $id_certificate para la siguiente dirección $certificate->address", $user->id, 17);
                //enviar correo
                Mail::to($user_delivery->email)->send(new notification_certificate($user_delivery, "que el acta con ID $certificate->id y fecha $certificate->date ha sido devuelto por el usuario con nombre $certificate->name_user_receives"));
            }else{
                //notificar
                NotificationController::create_notification("Su acta ha sido ENTREGADA con exito!", $certificate->id_user_delivery , route('dashboard.certificates.view_certificate',$certificate->id));
                //crear reporte
                ReportController::create_report("El usuario $user_delivery->name ha recibido los componentes asignados al acta con ID $id_certificate para la siguiente dirección $certificate->address", $user->id, 17);
                //enviar correo
                Mail::to($user_delivery->email)->send(new notification_certificate($user_delivery, "que el acta con ID $certificate->id y fecha $certificate->date ha llegado al punto y ha sido recibido con exito!"));
            }

        }


        $certificate->save();

        $rows_certificates = Row_Certificate::all()->where('id_certificate','=',$id_certificate);
        $state_certificate = DB::selectOne("SELECT s.state FROM certificates c INNER JOIN states s ON c.id_state = s.id WHERE c.id=$id_certificate")->state;
        $rows_certificates = Row_Certificate::all()->where('id_certificate','=',$id_certificate);



//cambiar estado de productos
        foreach ($rows_certificates as $r) {
            $new_report_product = new Report_product();
            $new_report_product->id_product = $r->id_product;
            $product = Product::find($r->id_product);
            if  ($certificate->id_state == 12){
                $product->id_state = 1;
            }else{
                $product->id_state = $certificate->id_state;
            }

            $product->save();
            $new_report_product->id_certificate = $id_certificate;
            $new_report_product->report = "El producto asociado al acta con ID $certificate->id y fecha $certificate->address esta en estado $state_certificate";
            $new_report_product->save();
        }

        return redirect()->route('dashboard.certificates.view_certificate',$id_certificate)->with('message', 'Accion realizada con exito');
    }

    //funcion que permite validar el producto por medio del ID para un archivo JS
    public function get_dates_product($id){

        $product = DB::selectOne("SELECT p.id, p.name, p.brand, p.serie, o.origin_certificate, s.state_certificate, t.type_component, p.accessories
     FROM products p
     INNER JOIN origins_certificates o ON p.id_origin_certificate = o.id
     INNER JOIN states_certificates s ON p.id_state_certificate = s.id
     INNER JOIN type_components t ON p.id_type_component = t.id WHERE p.id = $id AND p.id_state = 1");

    $validation_product = DB::select("SELECT * FROM products p
     INNER JOIN rows_certificates rs ON p.id = rs.id_product
    INNER JOIN certificates c ON rs.id_certificate = c.id
    INNER JOIN type_components t ON p.id_type_component = t.id
    WHERE p.id = $id AND p.id_state = 1 AND (c.id_state = 3 || c.id_state = 11 )");
     if($product && !$validation_product){
        return response()->json(['product' => $product], 200);
     }else{
        return response()->json(['product' => false], 200);
     }
    }

    //funcion que sirve para dar entrada de activos
    public function accept_certificate(Request $request){
        $id_certificate = $request->id_certificate;
        $id_user_receives = $request->id_user_receives;
        $certificate = Certificate::find($id_certificate);
        $user_receive = User::find($certificate->id_user_receives);
        $user_delivery = User::find($certificate->id_user_delivery);
        $date = Carbon::now('America/Bogota')->format('d/m/Y H:i:s');
//vertificar si el certificado
        if(!$certificate->date_delivery){
        if ($id_user_receives == $certificate->id_user_receives) {
            $certificate->id_state = 12;
            $certificate->image_delivery = "success.png";
            $certificate->date_delivery = $date;
            $certificate->save();
            $rows_certificates = Row_Certificate::all()->where('id_certificate','=',$id_certificate);
            $state_certificate = DB::selectOne("SELECT s.state FROM certificates c INNER JOIN states s ON c.id_state = s.id WHERE c.id=$id_certificate")->state;
           //cambiar estado de productos entregados a activos de nuevo
            foreach ($rows_certificates as $r) {
                $new_report_product = new Report_product();
                $product = Product::find($r->id_product);
                $product->id_state = 1;
                $product->save();
                $new_report_product->id_product = $r->id_product;
                $new_report_product->id_certificate = $id_certificate;
                $new_report_product->report = "El producto asociado al acta con ID $certificate->id y fecha $certificate->address esta en estado $state_certificate";
                $new_report_product->save();
            }
            //notificar
            NotificationController::create_notification("Su acta ha sido ENTREGADA con exito!", $certificate->id_user_delivery , route('dashboard.certificates.view_certificate',$certificate->id));
            //crear reporte
            ReportController::create_report("El usuario $user_delivery->name ha recibido los componentes asignados al acta con ID $id_certificate para la siguiente dirección $certificate->address", $user_delivery->id, 17);
            //enviar correo
            Mail::to($user_delivery->email)->send(new notification_certificate($user_delivery, "que el acta con ID $certificate->id y fecha $certificate->date ha llegado al punto y ha sido recibido con exito!"));
        return view('dashboard.accept_emails.view_return_certificate', compact('user_delivery', 'certificate'));
            }
        }else{
            return view('dashboard.accept_emails.view_return_certificate', compact('user_delivery', 'certificate'));
        }
       }

       //Funcion que permite mostrar los reportes de un certificado el cual recibe su ID
       public function reports_certificate($id){

        $id_certificate = $id;
        $reports_certificates = DB::select("SELECT r.id, r.description, r.image, r.date, u.name, u.id AS id_user FROM reports_certificate r
        INNER JOIN users u ON r.id_user = u.id
        WHERE r.id_state = 1 AND r.id_certificate = $id_certificate ORDER BY r.id DESC");
        return view("dashboard.certificates.view_reports_certificate", compact('reports_certificates', 'id_certificate'));

    }
//funcion que permite crear el reporte para un certificado
    public function reports_certificate_create(Request $request)
{

    $id_certificate = $request->id_certificate;
    $certificate = Certificate::find($id_certificate);
    $new_report_certificate = new Report_Certificate();
    $user = Auth::user();
//validar si existe el archivo enviado por el formulario
if ($request->hasFile('file')) {
    $file = $request->file('file');
    $fechaHoraActual = now()->format('Y-m-d_H-i-s');
    $name_file = $fechaHoraActual . '.' . $file->getClientOriginalExtension();
    $rutaImagen = public_path('storage/files/' . $name_file);
    $file->move(public_path('storage/files'), $name_file);
    $new_report_certificate->image = $name_file;
    $new_report_certificate->description = $request->description;
    $fechaActual = Carbon::now('America/Bogota');
    //capturar fecha y hora actual
    $fechaColombiana = $fechaActual->format('d-m-Y H:i:s');
    //insertar reporte
    $new_report_certificate->id_certificate = $id_certificate;
    $new_report_certificate->date = $fechaColombiana;
    $new_report_certificate->id_user = $user->id;
    $new_report_certificate->id_state = 1;
    $new_report_certificate->save();

    //validar el usuario al cual va a ser enviada la notificacion del reporte
    if($certificate->id_user_receives){
        if($certificate->id_user_receives == $user->id){
            $user = User::find($certificate->id_user_delivery);
        }else{
            $user = User::find($certificate->id_user_receives);
        }

        //notificar
        NotificationController::create_notification("Tienes un nuevo reporte en acta!", $user->id , route('dashboard.certificates.view_certificate.reports_certificate',$certificate->id));
       //enviar correo
        Mail::to($user->email)->send(new notification_certificate($user, "que el acta con ID $certificate->id y fecha $certificate->date tiene un reporte"));
    }


    return redirect()->route('dashboard.certificates.view_certificate.reports_certificate', $id_certificate)->with('message','El reporte ha sido generado con exito');
}else{
    return redirect()->route('dashboard.certificates.view_certificate.reports_certificate', $id_certificate)->with('message_error','Hubo un error en el reporte');
}

}

//Funcion que inactiva el reporte de un certificado y retorna a la vista de reporte
public function reports_certificate_delete(Request $request){

    $id_report_certificate = $request->id_report_certificate;
    $id_certificate = $request->id_certificate;
    $report_certificate = Report_certificate::find($id_report_certificate);
    $report_certificate->id_state = 2;
    $report_certificate->save();
    return redirect()->route('dashboard.certificates.view_certificate.reports_certificate', $id_certificate)->with('message','El reporte ha sido eliminado con exito');
}

//funcion que notifica al usuario para confirmar entrega dependiendo de si el usuario es del sistema o no
public function notificate_user_finish_certificate(Request $request){


    $user = Auth::user();

    $certificate = Certificate::find($request->id_certificate);

    if($certificate->id_user_receives){
        $user_delivery = User::find($certificate->id_user_delivery);
        $user_receives = User::find($certificate->id_user_receives);
        //notificar
        NotificationController::create_notification("El usuario $user_delivery->name esta esperando confirmación de llegada de activos", $user_receives->id , route('dashboard.certificates.view_certificate',$certificate->id));
        //enviar correo
        Mail::to($user_receives->email)->send(new Notificate_Finish_Certificate($user_receives,$user_delivery, $certificate));
        return redirect()->route('dashboard.certificates.view_certificate', $certificate->id)->with('message','Usuario informado');
    }else{
        return redirect()->route('dashboard.certificates.view_certificate', $certificate->id)->with('message','El usuario no hace parte de la organización');
    }




}


}
