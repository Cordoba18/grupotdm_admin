<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Certificate extends Model
{
    use HasFactory;

    protected $table = 'certificates';
    protected $fillable = [
        'id_proceeding',
        'date',
        'address',
        'id_user_delivery',
        'id_user_receives',
        'id_user_reception',
        'general_remarks',
        'image_exit',
        'date_exit',
        'image_delivery',
        'date_delivery',
        'id_state',
    ];
}
