<?php


namespace App\Http\Controllers;
use App\Http\Controllers\AppController;
use App\Models\Temp;
use App\Models\Test;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful;
use Illuminate\Support\Facades\Cookie;

class TestController extends Controller
{
    public function index(Request $request){
        $res = Test::where('id', 1)->get();

        return success_json($res);
    }
}
