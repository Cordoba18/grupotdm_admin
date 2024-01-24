<?php

namespace App\Http\Controllers;

use App\Mail\SendCode;
use App\Models\Code;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class RecoveryPasswordController extends Controller
{
    //funcion que retorna la vista para recuperar contraseña

    public function index(){

        return view('user.recovery_password');
    }

    //funcion que me permite enviar el codigo para la recuperacion de contraseña
    public function sendcode(Request $request){

        $email = $request->email;
        //validamos si el usuario existe
        $valitation = DB::selectOne("SELECT * from users WHERE email='$email'");

        if (!$valitation) {
            return redirect()->route('recover')->with('message_error', 'El usuario no existe en nuestro sistema');
        }else{

            $name = $valitation->name;
            //en caso de que haya un codigo con el correo se elimina y se inserta un nuevo codigo
            DB::table('codes')->where('email', $request->email)->delete();
            $code = new Code();
            $new_code = RecoveryPasswordController::randNumer();
            $code->email = $email;
            $code->code =  $new_code;
            $code ->save();
            //enviamos un correo
            Mail::to($email)->send(new SendCode($new_code, $name, " utiliza el codigo de recuperaciòn de contraseña para validar tu cuenta : ", "RECUPERACIÒN DE CONTRASEÑA"));
            return view('user.sendcode_recovery_password',compact('email'));
        }
    }

    //funcion que permite retornar un codigo aleatorio de 6 digitos
    public static function randNumer() {
        $d=rand(100000,999999);
        return $d;
    }

    //funcion que permite validar el codigo ingresado por el usuario
    public function validecode(Request $request){

        $email = $request->email;
        //buscamos el codigo del usuario en la base de datos
        $user_code = DB::selectOne("SELECT * FROM codes WHERE email='$email'");
        $code = $request->code;
        //comparamos el codigo preescrito con el existente
        if ($code == $user_code->code) {
            return view('user.change_password_recovery_password',compact('email'));
        }else{
            return view('user.sendcode_recovery_password', compact('email'))->with('message_error', 'Código no válido');
        }
    }


    //funcion que me permite guardar la nueva contraseña
    public function changepassword(Request $request){
        $password = Hash::make($request->password);
        $user = User::where('email', $request->email)->first();
        $user->password = $password;
        $user->save();
        return response()->json(['message' => true], 200);
    }

}
