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
    //

    public function index(){

        return view('user.recovery_password');
    }

    public function sendcode(Request $request){

        $email = $request->email;
        $valitation = DB::selectOne("SELECT * from users WHERE email='$email'");

        if (!$valitation) {
            return redirect()->route('recover')->with('message_error', 'El usuario no existe en nuestro sistema');
        }else{
            $name = $valitation->name;
            DB::table('codes')->where('email', $request->email)->delete();
            $code = new Code();
            $new_code = RecoveryPasswordController::randNumer();
            $code->email = $email;
            $code->code =  $new_code;
            $code ->save();
            Mail::to($email)->send(new SendCode($new_code, $name, " utiliza el codigo de recuperaciòn de contraseña para validar tu cuenta : ", "RECUPERACIÒN DE CONTRASEÑA"));
            return view('user.sendcode_recovery_password',compact('email'));
        }
    }

    public static function randNumer() {
        $d=rand(100000,999999);
        return $d;
    }

    public function validecode(Request $request){

        $email = $request->email;
        $user_code = DB::selectOne("SELECT * FROM codes WHERE email='$email'");
        $code = $request->code;
        if ($code == $user_code->code) {
            return view('user.change_password_recovery_password',compact('email'));
        }else{
            return view('user.sendcode_recovery_password',compact('email'))->with('message_error', 'Codìgo no valido');
        }
    }

    public function changepassword(Request $request){
        $password = Hash::make($request->password);
        $user = User::where('email', $request->email)->first();
        $user->password = $password;
        $user->save();
        return response()->json(['message' => true], 200);
    }

}
