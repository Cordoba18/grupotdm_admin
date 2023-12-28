<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Image_product extends Model
{
    use HasFactory;
    protected $table = 'images_products';
    protected $fillable = [
        'image',
        'id_product',
        'id_state',
    ];
}
