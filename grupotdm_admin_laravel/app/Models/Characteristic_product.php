<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Characteristic_product extends Model
{
    use HasFactory;

    protected $table = 'characteristics_products';
    protected $fillable = [
        'type',
        'detail',
        'id_product',
        'id_state',
    ];
}
