<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AuthController;

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

//Route::get('login', [UserController::class, 'login']);

Route::post('login', [AuthController::class, 'login']);
Route::get('getOpenid', [AuthController::class, 'getOpenid']);
Route::get('test', [UserController::class, 'test']);

Route::group(['middleware'=>'auth:sanctum'], function(){
    Route::get('getGoodList', [UserController::class, 'getGoodList']);
    Route::get('comfirmOrde', [UserController::class, 'comfirmOrde'])->middleware('myToken');
    Route::get('setFeedback', [UserController::class, 'setFeedback'])->middleware('myToken');
    Route::get('getMyOrdes', [UserController::class, 'getMyOrdes'])->middleware('myToken');
    Route::get('setAddr', [UserController::class, 'setAddr'])->middleware('myToken');
    Route::get('getAddr', [UserController::class, 'getAddr'])->middleware('myToken');
    Route::get('updateAddr', [UserController::class, 'updateAddr'])->middleware('myToken');
    Route::get('getRankingList', [UserController::class, 'getRankingList']);


    Route::get('index', [UserController::class, 'index']);
});
