<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StateReview extends Model
{
    use HasFactory;
    protected $fillable = [
        'idSate',
        'idReview',
    ];
}
