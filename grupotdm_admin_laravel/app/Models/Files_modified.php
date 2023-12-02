<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Files_modified extends Model
{
    use HasFactory;
    protected $table = 'files_modified';
    protected $fillable = [
        'name',
        'file',
        'date_update',
        'id_file',
        'id_user',
    ];
}
