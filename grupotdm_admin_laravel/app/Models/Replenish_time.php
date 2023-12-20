<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Replenish_time extends Model
{
    use HasFactory;
    protected $table = 'replenish_times';
    protected $fillable = [
        'replenish_time',
    ];
}
