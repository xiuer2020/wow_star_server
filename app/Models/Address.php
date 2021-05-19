<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Traits\DefaultDatetimeFormat;

class Address extends Model
{
    use DefaultDatetimeFormat;
    protected $table = 'addresses';
    protected $guarded = ['id'];
}
