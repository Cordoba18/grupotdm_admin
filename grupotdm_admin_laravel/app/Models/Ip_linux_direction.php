<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ip_linux_direction extends Model
{
    use HasFactory;
    protected $table = 'ip_linux_directions';
    protected $fillable = [
        'ip',
        'id_serve',
        'id_state',
    ];
}
