<?php


namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $guarded = ['id'];
    public $timestamps = true;

    public function user()
    {
        return $this->belongsTo(User::class)->withDefault();
    }
}
