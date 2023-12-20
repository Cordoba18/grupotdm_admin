<?php

namespace App\Http\Controllers;

use App\Models\Area;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;


class LoginController extends Controller
{

    public function index(){
        return view('user.login');

    }

    public function logueo(Request $request){

        $email = $request->email;
       $credentials = request()->only('email', 'password');
       $user = DB::selectOne("SELECT * FROM users WHERE email='$email' AND id_state = 1");
       if ($user) {
        if (Auth::attempt($credentials)) {
            request()->session()->regenerate();
            ReportController::create_report("El usuario $user->name con correo $user->email ha ingresado al sistema", $user->id, 8);
            return redirect()->route('dashboard');

           }else{
            return redirect()->route('login')->with('message_error', 'Credenciales incorrectas');

           }
       }else {
        return redirect()->route('login')->with('message_error', 'Usuario no existente o inactivo');
       }

    }
    public function logout(Request $request){


        Auth::guard('web')->logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        Session::flush();
        Auth::logout();
        return redirect()->route('login');


    }


}
