<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\OrderController;

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
Route::get('getGoodList', [UserController::class, 'getGoodList']);
//Route::post('getAddress', [UserController::class, 'getAddress']);
Route::get('test', [UserController::class, 'test']);

Route::group(['middleware'=>'auth:sanctum'], function(){
    Route::post('getAddress', [UserController::class, 'getAddress'])->name('getAddress');

    Route::post('comfirmOrder', [OrderController::class, 'comfirmOrder']);


    Route::post('setFeedback', [UserController::class, 'setFeedback']);
    Route::post('getMyOrders', [UserController::class, 'getMyOrders']);
    Route::post('setAddress', [UserController::class, 'setAddress']);

    Route::post('updateAddress', [UserController::class, 'updateAddress']);
    Route::post('getRankingList', [UserController::class, 'getRankingList']);


    Route::get('index', [UserController::class, 'index']);
});

