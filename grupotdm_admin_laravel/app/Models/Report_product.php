<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Report_product extends Model
{
    use HasFactory;
    protected $table = 'report_products';
    protected $fillable = [
        'report',
        'id_product',
        'id_certificate',
    ];
}
