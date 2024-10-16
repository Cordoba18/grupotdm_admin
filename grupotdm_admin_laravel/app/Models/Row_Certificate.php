<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Row_Certificate extends Model
{
    use HasFactory;

    protected $table = 'rows_certificates';
    protected $fillable = [
        'id_product',
        'id_certificate',
    ];
}
