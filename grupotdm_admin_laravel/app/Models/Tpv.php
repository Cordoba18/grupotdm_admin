<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tpv extends Model
{
    use HasFactory;

    protected $table = 'tpvs';
    protected $fillable = [
        'tpv',
        'id_user',
        'id_company',
        'id_tpv_component',
        'id_state',
    ];
}
