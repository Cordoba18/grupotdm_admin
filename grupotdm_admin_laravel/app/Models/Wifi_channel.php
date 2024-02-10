<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Wifi_channel extends Model
{
    use HasFactory;
    protected $table = 'wifi_channels';
    protected $fillable = [
        'code',
        'detail',
        'amount',
        'date_start',
        'date_finish',
        'unit_value',
        'id_state',
    ];
}
