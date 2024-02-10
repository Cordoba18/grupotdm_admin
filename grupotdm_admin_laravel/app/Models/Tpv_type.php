<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tpv_type extends Model
{
    use HasFactory;

    protected $table = 'tpv_types';
    protected $fillable = [
        'tpv_type',
    ];
}
