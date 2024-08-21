<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Approve extends Model
{
    use HasFactory;

    protected $guarded = false;
    public function reviewRelation()
    {
        return $this->belongsTo(Review::class);
    }
}
