<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Spreadsheet_tpv extends Model
{
    use HasFactory;

    protected $table = 'spreadsheet_tpvs';
    protected $fillable = [
        'total',
        'sub_total',
        'difference',
        'id_tpv',
        'id_spreadsheet',
        'id_state',
    ];
}
