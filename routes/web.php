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


Route::get('login', function (Request $request) {
    $code = $request->input('code');
    if (false) {
        $res = \Http::get('http://headhunting.dghclw.com/api/global-data');

        $data = $res->body();

        $data = json_decode($data);
    }
//    无小程序密钥, 临时逻辑

    $openId = 'openId';
    $session_key = 'session_key';
    $unionid = 'unionid';
    $user = DB::table('users')->where('open_id', $openId)->first();
    $headPortrait = 'headPortrait';

    $rememberToken = 'rememberToken';
    if ($user) {
//    用户名拦截 测试阶段不执行
//    if (false) {
//    if(true){
        $newUser = \App\Models\User::where('open_id', $openId)->update([
            'remember_token' => $rememberToken
        ]);
        if ($newUser !== 0) {
            return success_json('remember_token', '登录成功');
        } else {
            return error_json('登录失败');
        }
    } else {
        App\Models\User::create([
            'open_id' => $openId,
            'session_key' => $session_key,
            'uionid' => $unionid,
            'head_portrait' => $headPortrait,
            'remember_token' => $rememberToken
        ]);
        return success_json($rememberToken, '登录成功');
    }
});

Route::get('getGoodList', function (Request $request) {
    $goodList = App\Models\Good::all();
    return success_json($goodList);
});

Route::get('comfirmOrde', function (Request $request) {
    $userId = 2;
//    $goodId = $request->input('goodId');
//    $goodQuantity = $request->input('goodQuantity');
//    $addr = $request->input('addr');
//    $mailingType = $request->input('mailingType');

    $goodId = '1';
    $goodQuantity = 2;
    $addr = '广州';
    $mailingType = 'mailingType';
    $number = 'ws' . time();
//    临时字段

//    销量增加
    $goodSaleQuantity = \App\Models\Good::where('id', $goodId)->first()->sale_quantity;
    $goodSaleQuantityUpdated = \App\Models\Good::where('id', $goodId)->update([
        'sale_quantity' => $goodSaleQuantity + $goodQuantity
    ]);;
    if ($goodSaleQuantityUpdated === 0) {
        return error_json('订单提交失败');
    }

    $orderUpdated = \App\Models\Order::create([
        'user_id' => $userId,
        'number' => $number,
        'addr' => $addr,
        'quantity' => $goodQuantity,
        'mailing_type' => $mailingType,
        'good_id' => $goodId
    ]);
    if ($orderUpdated) {
        return success_json('订单提交成功');
    } else {
        return error_json('订单提交失败');
    }


});

Route::get('setFeedback', function (Request $requestt) {
    $userId = 1;
    $number = 'f' . time();
    $description = 'decription';
    $feedbackUpdated = \App\Models\Feedback::create([
        'number' => $number,
        'user_id' => $userId,
        'description' => $description
    ]);
    if ($feedbackUpdated) {
        return success_json('提交反馈成功');
    } else {
        return error_json('提交反馈失败');
    }
});

Route::get('getMyOrdes', function (Request $request) {
    $userId = 2;
    $myOrdes = \App\Models\Order::where('user_id', 2)->get();
    return success_json($myOrdes);
});

Route::get('setAddr', function (Request $request) {
//Route::post('setAddr', function (Request $request) {
    $userId = 'openId';
    $name = 'name';
    $addr = 'addr';
    $phone = 'phone';
    $addrUpdated = \App\Models\Addr::create([
        'user_id' => $userId,
        'name' => $name,
        'addr' => $addr,
        'phone'=>$phone
    ]);
    if ($addrUpdated) {
        return success_json('添加地址成功');
    } else {
        return error_json('添加地址失败');
    }
});

Route::get('getAddr', function (Request $request) {
    $addrs = \App\Models\Addr::where('user_id', 'openId')->get();
    if($addrs){
        return success_json($addrs);
    }else{
        return error_json('获取地址失败');
    }
});

Route::get('updateAddr', function (Request $request) {
    $userId = 'openId';
    $name = 'name';
    $addr = 'addr';
    $phone = 'phone';


    $addr = \App\Models\Addr::where('user_id', 'openId')->first()->update([
        'user_id' => $userId,
        'name' => $name,
        'addr' => $addr,
        'phone'=>$phone
    ]);
    if($addr){
        return success_json('更新地址成功');
    }else{
        return error_json('获取地址失败');
    }
});


Route::get('test', function () {
    return \Illuminate\Support\Facades\Crypt::encryptString('123');
});

