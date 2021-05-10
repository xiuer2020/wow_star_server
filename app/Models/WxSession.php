<?php


namespace App\Models;


use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class WxSession extends Model
{
    use DefaultDatetimeFormat;
    protected $guarded = ['id'];
    protected $table = 'wx_sessions';
}
