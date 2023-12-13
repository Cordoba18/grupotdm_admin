<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Calification extends Model
{
    use HasFactory;
    protected $table = 'califications';
    protected $fillable = [
        'calification',
        'comment',
        'id_ticket',
        'id_user',
        'date',
    ];
}
