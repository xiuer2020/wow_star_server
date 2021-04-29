<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\ServiceProvider;

class UserController extends Controller
{
    public function show(User $user)
    {
        return view('user.profile', ['user' => $user]);
    }
    public function index(Request $request)
    {

        $user = $request->input('user');
//    $open

        $users = DB::table('users')->get();
        return $users;
    }
}
