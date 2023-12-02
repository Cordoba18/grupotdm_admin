<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    use HasFactory;
    protected $table = 'tickets';
    protected $fillable = [
        'name',
        'description',
        'file',
        'date_start',
        'date_finally',
        'id_priority',
        'id_user_sender',
        'id_user_destination',
        'id_state',
    ];
}
