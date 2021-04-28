<?php
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


use Illuminate\Support\Facades\DB;

Route::get('user/{user}', function ($user) {

    return view('user.profile', ['user' => $user]);
});
Route::get('/hello', function (){
    $users = DB::table('flight')->get();
    return $users;
});


Route::get('text', function () {
    dd('1');
});
