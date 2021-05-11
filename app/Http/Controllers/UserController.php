<?php

namespace App\Http\Controllers;


use App\Models\Feedback;
use App\Models\Good;
use App\Models\Order;
use App\Models\User;
use App\Models\Address;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;

class UserController extends Controller
{
    public function login(Request $request)
    {
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
        $user = User::where('openid', $openId)->first();
        $headPortrait = 'headPortrait';

        $res = Crypt::encryptString($openId);

        if ($user) {
//    用户名拦截 测试阶段不执行
//    if (false) {
//    if(true){
            return success_json($res, '登录成功');
        } else {
            User::create([
                'openid' => $openId,
                'session_key' => $session_key,
                'uionid' => $unionid,
                'head_portrait' => $headPortrait,
            ]);
            return success_json($res, '登录成功');
        }
    }

    public function getGoodList(Request $request)
    {
        $goodList = Good::all();
        return success_json($goodList);
    }

    public function comfirmOrde(Request $request)
    {
        $openId = $request->openId;
        $goodId = $request->input('goodId');
        $goodQuantity = $request->input('goodQuantity');
        $addr = $request->input('addr');
        $mailingType = $request->input('mailingType');
        $number = 'ws' . time();
//    临时字段

//    销量增加
        $goodSaleQuantity = Good::where('id', $goodId)->first()->sale_quantity;
        $goodSaleQuantityUpdated = Good::where('id', $goodId)->update([
            'sale_quantity' => $goodSaleQuantity + $goodQuantity
        ]);;
        if ($goodSaleQuantityUpdated === 0) {
            return error_json('订单提交失败');
        }

        $orderUpdated = Order::create([
            'openid' => $openId,
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


    }

    /**提交反馈
     * POST
     * @param string $openId 用户
     */
    public function setFeedback(Request $request)
    {
        $openId = $request->openId;
        $number = 'f' . time();
        $description = $request->input('description');
        $feedbackUpdated = Feedback::create([
            'number' => $number,
            'openid' => $openId,
            'description' => $description
        ]);
        if ($feedbackUpdated) {
            return success_json('提交反馈成功');
        } else {
            return error_json('提交反馈失败');
        }
    }

    public function getMyOrdes(Request $request)
    {
        $openId = $request->openId;
        $myOrdes = \App\Models\Order::where('openid', $openId)->get();
        return success_json($myOrdes);
    }

    public function setAddr(Request $request)
    {

        $openId = $request->openId;
        $name = $request->input('name');
        $region = $request->input('region');
        $detailAddr = $request->input('detailAddr');
        $phone = $request->input('phone');
        $currentAddr = $request->input('currentAddr');


        if ($currentAddr == 1 && $name && $region && $detailAddr && $phone) {
            Address::where([['openid', $openId], ['current_addr', $currentAddr]])->update([
                'current_addr' => 0
            ]);
        }


        if ($name && $region && $detailAddr && $phone && $currentAddr != null) {
            $addrUpdated = Address::create([
                'openid' => $openId,
                'name' => $name,
                'region' => $region,
                'detail_addr' => $detailAddr,
                'phone' => $phone,
                'current_addr' => $currentAddr
            ]);
            if ($addrUpdated) {
                return success_json('添加地址成功');
            } else {
                return error_json('添加地址失败');
            }
        } else {
            return error_json('添加地址失败');
        }
    }

    public function getAddr(Request $request)
    {
        $openId = $request->openId;
        $addrs = Address::where('openid', 'openId')->get();
        if ($addrs) {
            return success_json($addrs);
        } else {
            return error_json('获取地址失败');
        }
    }

    public function updateAddr(Request $request)
    {
        $openId = $request->openId;
        $name = $request->input('name');
        $region = $request->input('region');
        $detailAddr = $request->input('detailAddr');
        $phone = $request->input('phone');
        $currentAddr = $request->input('currentAddr');
        $addrId = $request->input('addrId');

        if ($currentAddr == 1 && $name && $region && $detailAddr && $phone) {
            Address::where([['openid', $openId], ['current_addr', $currentAddr]])->update([
                'current_addr' => 0
            ]);
        }

        $addr = Address::where([['openid', 'openId'], ['id', $addrId]])->first()->update([
            'user_id' => $openId,
            'name' => $name,
            'region' => $region,
            'detail_addr' => $detailAddr,
            'phone' => $phone,
            'current_addr' => $currentAddr,
        ]);
        if ($addr) {
            return success_json('更新地址成功');
        } else {
            return error_json('获取地址失败');
        }
    }

    public function getRankingList(Request $request)
    {
        $res = Order::select('good_id')->with('good')->get();

        return $res;
    }

    public function test(Request $request)
    {
        $res = Order::where('openid', 'openId')->join('users');

        return success_json($res);
    }

}
