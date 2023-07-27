<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ApproveReview extends Model
{
    use HasFactory;
    protected $fillable = [
        'idReview',
        'committeMNDate',
        'committeMNNumber',
        'committeSCDate',
        'committeSCNumber',
        'orderDate',
        'orderNumber',
        'resolution',
    ];
}
