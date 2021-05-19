<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Traits\DefaultDatetimeFormat;

class Feedback extends Model
{
    use DefaultDatetimeFormat;
    protected $table = 'feedbacks';
    protected $guarded = ['id'];
}
