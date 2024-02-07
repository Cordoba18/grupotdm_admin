<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vpn extends Model
{
    use HasFactory;

    protected $table = 'vpns';
    protected $fillable = [
        'name',
        'file',
        'id_user',
        'id_state',
    ];
}
