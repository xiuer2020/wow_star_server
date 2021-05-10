<?php


namespace App\Http\Controllers;


use App\Models\Good;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index(Request $request)
    {
        $user = \Auth::user();
        return success_json($user);
//        $list = Good::where('user_id',$user_id)->find(1);
    }

    public function  detail()
    {

    }

    public function add()
    {}

    public function update()
    {}

    public function destroy()
    {}
}
