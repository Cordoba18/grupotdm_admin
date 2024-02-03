<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Server extends Model
{
    use HasFactory;

    protected $table = 'servers';
    protected $fillable = [
        'name',
        'OS',
        'service',
        'observations',
        'RAM',
        'vcpu',
        'totaldd',
        'ip',
        'SPLA_RDP_TS',
        'SPLA_EXCEL',
        'id_state',
    ];
}
