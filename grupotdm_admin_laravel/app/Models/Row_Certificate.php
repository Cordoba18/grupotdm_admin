<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Row_Certificate extends Model
{
    use HasFactory;

    protected $table = 'rows_certificates';
    protected $fillable = [
        'amount',
        'description',
        'brand',
        'serie',
        'id_certificate',
        'id_origin_certificate',
        'id_state_certificate',
        'id_type_component',
        'accesories',
    ];
}
