<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    use HasFactory;
    protected $fillable = [
        'educLevel',
        'branch',
        'speciality',
        'specialization',
        'nameOp',
        'guaranty',
        'category',
        'structural',
        'faculty',
        'date',
    ];
}
