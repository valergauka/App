<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Op extends Model
{
    use HasFactory;
    protected $fillable = [
        'branch',
        'speciality',
        'specialisation',
        'op',
    ];
}
