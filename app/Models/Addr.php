<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Addr extends Model
{
    use HasFactory;


    protected $fillable = [
        'open_id',
        'name',
        'region',
        'detail_addr',
        'phone',
        'current_addr'
    ];
    protected $guarded = ['id'];

}
