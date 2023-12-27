<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Origin_Certificate extends Model
{
    use HasFactory;

    protected $table = 'origins_certificates';
    protected $fillable = [
        'origin_certificate',
    ];
}
