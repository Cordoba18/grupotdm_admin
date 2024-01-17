<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;

use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Auth\Authenticatable as AuthenticatableTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class User extends Model implements Authenticatable
{
    use HasFactory, AuthenticatableTrait;

    protected $table = 'users';
    protected $fillable = [
        'name',
        'email',
        'nit',
        'phone',
        'password',
        'id_company',
        'id_area',
        'id_chargy',
        'id_state',
    ];

    public function adminlte_image(){
        return "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/480px-User_icon_2.svg.png";
    }

    public function adminlte_profile_url(){
        return 'dashboard/profile';
    }

}
