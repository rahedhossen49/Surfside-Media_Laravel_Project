<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    function User()
    {

        return $this->belongsTo(User::class)->select('id', 'name');
    }
    public function reviews()
    {
        return $this->hasMany(Review::class, 'product_id');
    }
}
