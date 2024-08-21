<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    use HasFactory;
    protected $guarded = false;

    public function status() {
        return $this->belongsTo(Status::class);
    }

public function comment()
{
    return $this->hasMany(Comment::class);
}

public function approve()
{
    return $this->hasMany(Approve::class);
}

    public function file() {
        return $this->hasMany(File::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }



}