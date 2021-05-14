<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\AppController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\TestController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('login', [AuthController::class, 'login'])->name('login');
Route::post('getOpenid', [AuthController::class, 'getOpenid']);
Route::get('getGoodList', [AppController::class, 'getGoodList']);
Route::post('getRankingList', [AppController::class, 'getRankingList']);
Route::get('test', [TestController::class, 'index']);

Route::group(['middleware'=>'auth:sanctum'], function(){
    Route::post('comfirmOrder', [OrderController::class, 'add']);
    Route::post('getMyOrders', [OrderController::class, 'index']);

    Route::post('setFeedback', [UserController::class, 'setFeedback']);
    Route::post('getAddress', [UserController::class, 'getAddress']);
    Route::post('setAddress', [UserController::class, 'setAddress']);
    Route::post('updateAddress', [UserController::class, 'updateAddress']);
});

