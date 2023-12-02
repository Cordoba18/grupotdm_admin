<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Directorie extends Model
{
    use HasFactory;
    protected $table = 'directories';
    protected $fillable = [
        'name',
        'code',
        'directory',
        'date_create',
        'date_update',
        'id_user',
        'id_state',
    ];
}
