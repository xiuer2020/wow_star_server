<?php

use Illuminate\Support\Facades\Route;

use Illuminate\Http\Request;

//对 Illuminate\Http\Request 类进行依赖注入

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


Route::get('register', function (Request $request) {
//    return '注册成功';
    $code = $request->input('code');
    $userName = $request->input('userName');

    $userNameRes = DB::table('users')->where('name', $userName)->first();
//    if($userNameRes){
//    用户名拦截 测试阶段不执行
    if(false){
        return error_json('用户名已经注册');
    }

    $passWord = $request->input('passWord');

//    $openid, $session_key, $unionid;为临时变量
    $openId = '$openid';
    $session_key = '$session_key';
    $unionid = '$unionid';


    if (false) {
        $res = \Http::get('http://headhunting.dghclw.com/api/global-data');

        $data = $res->body();

        $data = json_decode($data);
    }
//    无小程序密钥, 临时逻辑

    $user = App\Models\User::create([
        'name' => $userName,
        'password' => $passWord,
        'open_id' => $openId,
        'session_key' => $session_key,
        'uionid' => $unionid,
    ]);


    return success_json('注册成功');
});

Route::get('login', function (Request $request) {
    $userName = $request->input('userName');
    $passWord = $request->input('passWord');
    $user = \App\Models\User::where([['name' , $userName],['password',$passWord]] )->first();

    $newUser = \App\Models\User::where([['name' , $userName],['password',$passWord]])->update([
        'remember_token'=>'remember_token'
    ]);
    if($newUser !== 0){
        return success_json('remember_token', '登录成功');
    }else{
        return error_json('登录失败');
    }
});
