<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Address extends Model
{
    use HasFactory;
    protected $table = 'addresses';

    protected $fillable = [
        'openid',
        'name',
        'region',
        'detail_addr',
        'phone',
        'current_addr'
    ];
    protected $guarded = ['id'];

}
