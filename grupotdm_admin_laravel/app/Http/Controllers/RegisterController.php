<?php

namespace App\Http\Controllers;

use App\Mail\Notification;
use App\Mail\SendCode;
use App\Models\Area;
use App\Models\Code;
use App\Models\Companie;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class RegisterController extends Controller
{
    public function index(){

          $areas = Area::all();
        $companies = Companie::all();
        return view("user.register",compact('areas', 'companies'));
    }

    public function validate_email(Request $request){
        if (DB::select("SELECT * FROM users WHERE email = '$request->email'")) {
            return response()->json(['message' => true], 200);
        }else{
            DB::table('codes')->where('email', $request->email)->delete();
            $code = new Code();
            $new_code = RegisterController::randNumer();
            $code->email = $request->email;
            $code->code =  $new_code;
            $code ->save();
            Mail::to($request->email)->send(new SendCode($new_code, $request->name, " utiliza el codigo de activacion para finalizar la creaciòn de tu cuenta : ", "CREACION DE CUENTA"));
            return response()->json(['message' => $new_code], 200);
        }
}
public static function randNumer() {
    $d=rand(100000,999999);
    return $d;
}

function new_user(Request $request){

    $user = new User();
    $user->name = $request->name;
    $user->email = $request->email;
    $user->nit= $request->nit;
    $user->password = Hash::make($request->password);
    $user->id_company = $request->id_company;
    $user->id_state = 2;
    $user->id_area = $request->id_area;
    $id_chargy = DB::selectOne("SELECT c.id FROM charges c WHERE c.id_area =$request->id_area AND c.chargy='JEFE DE AREA'");
    $user->id_chargy = $id_chargy->id;
    $company = DB::selectOne("SELECT c.company FROM companies c WHERE c.id = $request->id_company");
    $area = DB::selectOne("SELECT a.area FROM areas a WHERE a.id = $request->id_area");
    Mail::to("soporte@eltemplodelamoda.com.co")->send(new Notification($request->name, $request->email ,  $company->company, $area->area));
    $user->save();
    return response()->json(['message' => true], 200);

}
}
