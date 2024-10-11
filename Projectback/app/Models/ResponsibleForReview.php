<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ResponsibleForReview extends Model
{
    protected $table = 'responsible_for_reviews';

    public function review()
    {
        return $this->belongsTo(Review::class, 'review_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
