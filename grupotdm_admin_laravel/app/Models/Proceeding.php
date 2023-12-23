<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Proceeding extends Model
{
    use HasFactory;
    protected $table = 'proceedings';
    protected $fillable = [
        'proceeding',
    ];
}
