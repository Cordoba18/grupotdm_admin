<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Report_detail extends Model
{
    use HasFactory;
    protected $table = 'report_details';
    protected $fillable = [
        'report',

    ];
}
