<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class State_Certificate extends Model
{
    use HasFactory;
    protected $table = 'states_certificates';
    protected $fillable = [
        'state_certificate',
    ];
}
