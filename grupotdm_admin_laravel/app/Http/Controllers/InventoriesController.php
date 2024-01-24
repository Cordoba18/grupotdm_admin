<?php
//importaciones
namespace App\Http\Controllers;

use App\Mail\create_product;
use App\Models\Area;
use App\Models\Image_product;
use App\Models\Origin_Certificate;
use App\Models\Product;
use App\Models\Report_product;
use App\Models\State_Certificate;
use App\Models\Type_Component;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

//declarar clases
class InventoriesController extends Controller
{

    //validamos autenticacion del usuario
    public function __construct()
    {
        $this->middleware('auth');
    }

    //funcion que muestra los productos del inventario
    public function show_inventories(Request $request){
        $search = $request->search;
        $filter = $request->filter;
        //verificamos existencias de busqueda o filtros
            if($request->search !== null && $request->filter !== null){
                    $sql = "INNER JOIN origins_certificates o ON p.id_origin_certificate = o.id
                    INNER JOIN states_certificates s ON p.id_state_certificate = s.id
                    INNER JOIN type_components t ON p.id_type_component = t.id
                    WHERE (p.id LIKE '%$request->search%' OR p.name LIKE '%$request->search%' OR p.serie LIKE '%$request->search%' OR p.brand LIKE '%$request->search%' OR p.accessories LIKE '%$request->search%' OR o.origin_certificate LIKE '%$request->search%' OR s.state_certificate LIKE '%$request->search%' OR t.type_component LIKE '%$request->search%')
                    AND  p.id_state = $request->filter";


            }else if($request->search !== null){
                $sql = "INNER JOIN origins_certificates o ON p.id_origin_certificate = o.id
                INNER JOIN states_certificates s ON p.id_state_certificate = s.id
                INNER JOIN type_components t ON p.id_type_component = t.id
                WHERE (p.id LIKE '%$request->search%' OR p.name LIKE '%$request->search%' OR p.serie LIKE '%$request->search%' OR p.brand LIKE '%$request->search%' OR p.accessories LIKE '%$request->search%' OR o.origin_certificate LIKE '%$request->search%' OR s.state_certificate LIKE '%$request->search%' OR t.type_component LIKE '%$request->search%')
                AND p.id_state = 1";
            }else if($request->filter !== null){

                    $sql = " WHERE p.id_state = $request->filter";


            }else{
                $sql = "";
            }


            $products = DB::select("SELECT p.id, p.name, p.serie, p.id_state FROM products p $sql ORDER BY p.id DESC");

            $reports = Report_product::orderBy('id', 'desc')->get();


            $images_products = Image_product::all()->where('id_state','=',1);
            $user = Auth::user();
            $filters = DB::select("SELECT * FROM states WHERE id=1 OR id= 2  OR id = 3 OR id=11");
            $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
            //verificamos si es un usuario de sistemas para mostrar el inventario o no
            if($validate_user_sistemas){
            return view('dashboard.inventories.inventories', compact('products', 'reports', 'images_products','filters','search' , 'filter'));
            }else{
                return redirect()->route('dashboard')->with('message_error','No tienes acceso a ese apartado');
            }
        }



        //funcion que muestra la vista para crear un producto
public function create_product(){
    $areas = Area::all();
    $origins_certificates = Origin_Certificate::all();
    $states_certificates = State_Certificate::all();
    $types_components = Type_Component::all();
    return view('dashboard.inventories.create', compact('areas','origins_certificates','states_certificates','types_components'));
}


//funcion para guardar un producto
public function save_product(Request $request){


    $product = new Product();
    $validation = DB::selectOne("SELECT * FROM products WHERE id_state = 1 AND serie  LIKE '%$request->serie%'");
    $user = Auth::user();
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
    //validamos si es un usuario de sistemas
    if($validate_user_sistemas){
        //validamos si hay un producto con la misma serial
    if($validation){
        return redirect()->back()->with('message_error','Ya existe un producto con esa serial');
    }else{

        //guardamos el producto
        $product->name = $request->name;
        $product->brand = $request->brand;
        $product->serie = $request->serie;
        $product->accessories = $request->accessories;
        $product->id_type_component = $request->id_type_component;
        $product->id_state_certificate = $request->id_state_certificate;
        $product->id_origin_certificate = $request->id_origin_certificate;
        $product->id_state = 1;
        $product->id_user = $user->id;
        $product->save();
        $id_product = DB::selectOne("SELECT * FROM products WHERE serie = '$request->serie' AND id_state = 1")->id;
        //creamos un reporte
        ReportController::create_report("El usuario $user->name ha creado un producto con la siguiente serial $request->serie", $user->id, 18);
            $jefe_sistemas = DB::selectOne("SELECT * FROM users u
            INNER JOIN charges c ON u.id_chargy = c.id
            WHERE c.chargy = 'JEFE DE AREA' AND u.id_area = 2 AND u.id_state = 1");
          //notificamos con un correo al jefe de sistemas sobre la creacion de un producto
          Mail::to($jefe_sistemas->email)->send(new create_product($jefe_sistemas, $product));

    }
    //Validamos si existe un archivo
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $fechaHoraActual = now()->format('Y-m-d_H-i-s');
            $name_file = $fechaHoraActual . '.' . $file->getClientOriginalExtension();
            $rutaImagen = public_path('storage/files/' . $name_file);
            $file->move(public_path('storage/files'), $name_file);
            //guardamos la nueva imagen del producto
            $image_product = new Image_product();
            $image_product->image = $name_file;
            $image_product->id_product = $id_product;
            $image_product->id_state = 1;
            $image_product->save();
            return redirect()->route('dashboard.inventories')->with('message','Producto guardado con exito');
        }else{
            return redirect()->route('dashboard.inventories')->with('message','Producto guardado sin imagen!');
        }

}else{
    return redirect()->route('dashboard')->with('message_error','No tienes acceso a ese apartado');
}
}

//funcion que me permite activar/eliminar un producto
public function delete_product(Request $request){

    $user = Auth::user();
    $product = Product::find($request->id_product);
    //validamos si el producto esta activo para desactivarlo
    if( $product->id_state == 1){
        $product->id_state =2;
        //generamos el reporte
        ReportController::create_report("El usuario $user->name ha eliminado el producto con la siguiente serial $product->serie", $user->id, 18);
       //configuramos el mensaje de respuesta al usuario
        $message = "Producto eliminado con exito!";
    }else{
        //si no esta activo se activa
        $product->id_state =1;
        //generamos el reporte
        ReportController::create_report("El usuario $user->name ha activado el producto con la siguiente serial $product->serie", $user->id, 18);
         //configuramos el mensaje de respuesta al usuario
        $message = "Producto activado con exito!";
    }
    $product->save();
    return redirect()->back()->with('message',$message);
}

//funcion que permite retornar la vista para ver un producto
public function view_product($id){

    $user = Auth::user();
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
        $origins_certificates = Origin_Certificate::all();
        $states_certificates = State_Certificate::all();
        $types_components = Type_Component::all();
        $product = Product::find($id);
        $state = DB::selectOne("SELECT s.state FROM products p INNER JOIN states s ON p.id_state = s.id WHERE p.id = $id")->state;
        $user_create_product = DB::selectOne("SELECT u.id, u.name FROM users u WHERE u.id = $product->id_user");
        $images_product = DB::select("SELECT * FROM images_products WHERE id_product = $id");
        $reports_product = Report_Product::orderBy('id', 'desc')->where('id_product','=',$id)->get();
        return view('dashboard.inventories.view_products',compact('state','user_create_product','reports_product','validate_user_sistemas','images_product','origins_certificates','states_certificates','types_components','product'));
}


//funcion que permite ver las imagenes secundarias de un producto
public function images_product($id){

    $user = Auth::user();
    $validate_user_sistemas = DB::selectOne("SELECT * FROM users WHERE id_area = 2 AND id=$user->id");
    //validamos si es un usuario de sistemas para mostrar la informacion
    if($validate_user_sistemas){
    $images_product = DB::select("SELECT * FROM images_products WHERE id_product = $id AND id_state = 1");
    $product = Product::find($id);
    return view('dashboard.inventories.images_product',compact('images_product','product'));
}
    else{
        return redirect()->route('dashboard')->with('message_error','No tienes acceso a ese apartado');
    }
}

//funcion que permite guardar una nueva imagen secundaria para un producto
public function save_image_product(Request $request){

    $user = Auth::user();
    $id_product = $request->id_product;
    if ($request->hasFile('file')) {
        $file = $request->file('file');
        $fechaHoraActual = now()->format('Y-m-d_H-i-s');
        $name_file = $fechaHoraActual . '.' . $file->getClientOriginalExtension();
        $rutaImagen = public_path('storage/files/' . $name_file);
        $file->move(public_path('storage/files'), $name_file);
        //Guardamos la imagen
        $image_product = new Image_product();
        $image_product->image = $name_file;
        $image_product->id_product = $id_product;
        $image_product->id_state = 1;
        $image_product->save();
        return redirect()->route('dashboard.inventories.view_product.images_product', $id_product)->with('message','Imagen guardada con exito');
    }else{
        return redirect()->route('dashboard.inventories.view_product.images_product', $id_product)->with('message_error','Imagen no insertada');
    }
}



//funcion que permite guardar los cambios en un producto
public function save_changes_view_product(Request $request){

    $user = Auth::user();
    $id_product = $request->id_product;
    $product = Product::find($id_product);
    $product->name = $request->name;
    $product->brand = $request->brand;
    $product->accessories = $request->accessories;
    $product->id_type_component = $request->id_type_component;
    $product->id_state_certificate = $request->id_state_certificate;
    $product->id_origin_certificate = $request->id_origin_certificate;
    //si existe una imagen lo guarda
    if ($request->hasFile('file')) {
        $file = $request->file('file');
        $fechaHoraActual = now()->format('Y-m-d_H-i-s');
        $name_file = $fechaHoraActual . '.' . $file->getClientOriginalExtension();
        $rutaImagen = public_path('storage/files/' . $name_file);
        $file->move(public_path('storage/files'), $name_file);
        $image_product = Image_product::where('id_product','=',"$id_product")->where('id_state','=','1')->first();
        $image_product->image = $name_file;
        $image_product->save();
    }
    //generamos un reporte
    ReportController::create_report("El usuario $user->name ha cambiado los datos del producto con la siguiente serial $product->serie con ID $product->id", $user->id, 18);
    $product->save();
    return redirect()->route('dashboard.inventories.view_product', $id_product)->with('message',"datos ingresados correctamente!");
}


//funcion que me permite obtener una serial personalizada y aleatoria para los productos
public function get_serie(){

    $finish = false;
    while(!$finish){
        //generamos la serial aleatoria
    $alfanumerico = str::random(7);
    $serie = "TDM".$alfanumerico;
    //validamos si ya existe esa serial
    $validation = Product::where('serie','=',"$serie")->where('id_state', 1)->first();
    if(!$validation){
        $finish = true;
        //si no existe la serial retornamos a archivo JS
        return response()->json(['serie' => $serie], 200);
    }
    }
}
}
