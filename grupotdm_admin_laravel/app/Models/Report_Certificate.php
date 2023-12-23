<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Report_Certificate extends Model
{
    use HasFactory;
    protected $table = 'reports_certificate';
    protected $fillable = [
        'description',
        'image',
        'date',
        'id_user',
        'id_certificate',
        'id_state',
    ];
}
