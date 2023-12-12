<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Theme_user extends Model
{
    use HasFactory;
    protected $table = 'themes_users';
    protected $fillable = [
        'theme_user',
    ];
}
