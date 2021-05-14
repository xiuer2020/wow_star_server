<?php


namespace App\Models;


use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use DefaultDatetimeFormat;

    protected $guarded = ['id'];
    public $timestamps = true;

    public function user()
    {
        return $this->belongsTo(User::class)->withDefault();
    }

    public function good()
    {
        return $this->belongsTo(Good::class)->withDefault();
    }
}
