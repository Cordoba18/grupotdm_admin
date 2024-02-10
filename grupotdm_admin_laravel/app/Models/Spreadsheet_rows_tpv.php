<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Spreadsheet_rows_tpv extends Model
{
    use HasFactory;
    protected $table = 'spreadsheet_rows_tpvs';
    protected $fillable = [
        'id_payment_method',
        'id_spreadsheet_tpv',
        'value_pos',
        'value_treasurer',
    ];
}
