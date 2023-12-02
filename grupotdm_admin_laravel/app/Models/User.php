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
        'password',
        'id_company',
        'id_area',
        'id_chargy',
        'id_state',
    ];

}
