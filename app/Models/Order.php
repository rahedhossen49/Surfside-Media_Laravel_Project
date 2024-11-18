<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    public function user(){

        return $this->belongsTo(user::class);
    }

    public function orderItems(){

        return $this->hasMany(OrderItem::class);
    }


    public function transaction(){
        return $this->hasOne(Transaction::class);
    }

    public function coustomer()
{
    return $this->belongsTo(User::class);
}

}
