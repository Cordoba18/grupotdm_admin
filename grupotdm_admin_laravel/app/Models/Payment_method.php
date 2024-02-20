<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payment_method extends Model
{
    use HasFactory;

    protected $table = 'payment_methods';
    protected $fillable = [
        'name',
        'description',
        'id_company',
        'id_state',
    ];
}
