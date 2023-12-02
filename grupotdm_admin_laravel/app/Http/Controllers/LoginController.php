<?php

namespace App\Http\Controllers;

use App\Models\Area;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    //

    public function index(){


        return view('user.login');

    }
}
