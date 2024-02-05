<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Server_sql_license extends Model
{
    use HasFactory;

    protected $table = 'server_sql_licenses';
    protected $fillable = [
        'id_server',
        'id_sql_licenses',
        'id_state',
    ];
}
