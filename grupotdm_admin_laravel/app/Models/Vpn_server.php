<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vpn_server extends Model
{
    use HasFactory;
    protected $table = 'vpn_servers';
    protected $fillable = [
        'id_ip_linux_direction',
        'id_vpn',
        'id_state',
    ];
}
