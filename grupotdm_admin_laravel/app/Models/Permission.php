<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    use HasFactory;
    protected $table = 'priorities';
    protected $fillable = [
        'date_application',
        'date_permission',
        'time_exit',
        'time_return',
        'time_tomorrow',
        'id_user_collaborator',
        'id_user_boss',
        'id_user_reception',
        'observations',
        'id_reason',
        'id_replenish_time',
        'id_state',
    ];
}
