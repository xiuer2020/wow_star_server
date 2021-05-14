<?php


namespace App\Http\Controllers;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AppController;

class TestController extends Controller
{
    public function index(){
        return success_json(Route::get('/get'), [AppController::class, 'test']);
    }
}
