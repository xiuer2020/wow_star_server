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
        'detail_address',
        'phone',
        'current_address'
    ];
    protected $guarded = ['id'];

}
