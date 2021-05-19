<?php


namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Temp extends Model
{
    protected $guarded = ['id'];

    public function test() {
        return $this->belongsTo(Test::class);
    }
}
