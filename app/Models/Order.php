<?php


namespace App\Models;


use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use DefaultDatetimeFormat;
    protected $guarded = ['id'];
    public $timestamps = true;
    protected $fillable = [
        'number',
        'open_id',
        'addr',
        'quantity',
        'good_id',
        'mailing_type'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'open_id');
    }
//    public function user(){
//        return $this->hasOne('App\Models\User');
//    }
    public function good()
    {
        return $this->belongsTo(Good::class)->withDefault()->select('id');
    }
}
