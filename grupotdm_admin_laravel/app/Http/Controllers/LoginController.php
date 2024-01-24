<?php

//importaciones
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;


//declaracion de clase
class LoginController extends Controller
{

    //funcion que retorna la vista para iniciar sesion
    public function index(){
        return view('user.login');

    }

    //funcion que permite realizar el inicio de sesion
    public function logueo(Request $request){

        $email = $request->email;
       $credentials = request()->only('email', 'password');
       //validamos si el usuario esta activo
       $user = DB::selectOne("SELECT * FROM users WHERE email='$email' AND id_state = 1");
       if ($user) {
        //validamos las credenciales de autenticacion
        if (Auth::attempt($credentials)) {
            //generamos la session
            request()->session()->regenerate();
            //generamos el reporte
            ReportController::create_report("El usuario $user->name con correo $user->email ha ingresado al sistema", $user->id, 8);
            return redirect()->route('dashboard');

           }else{
            return redirect()->route('login')->with('message_error', 'Credenciales incorrectas');

           }
       }else {
        return redirect()->route('login')->with('message_error', 'Usuario no existente o inactivo');
       }

    }

    //funcion que permite cerrar sesion
    public function logout(Request $request){


        Auth::guard('web')->logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        Session::flush();
        Auth::logout();
        return redirect()->route('login');


    }


}
