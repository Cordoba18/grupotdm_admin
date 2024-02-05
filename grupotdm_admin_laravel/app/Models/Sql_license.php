<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sql_license extends Model
{
    use HasFactory;

    protected $table = 'sql_licenses';
    protected $fillable = [
        'name',
        'id_State',
    ];
}
