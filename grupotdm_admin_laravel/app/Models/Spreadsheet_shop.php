<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Spreadsheet_shop extends Model
{
    use HasFactory;

    protected $table = 'spreadsheet_shops';
    protected $fillable = [
        'id_user',
        'id_shop',
        'id_state',
    ];
}
