<?php

namespace App\Http\Controllers;

use App\Mail\SendCode;
use App\Models\Area;
use App\Models\Code;
use App\Models\Companie;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
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
}
