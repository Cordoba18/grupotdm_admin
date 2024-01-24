<?php
//importaciones
namespace App\Http\Controllers;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
//Declaracion de clase
class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;
}
