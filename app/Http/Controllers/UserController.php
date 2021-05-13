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
    public function getGoodList(Request $request)
    {
        $goodList = Good::all();
        return success_json($goodList);
    }


    /**提交反馈
     * POST
     * @param string $openid 用户
     */
    public function setFeedback(Request $request)
    {
        $rules = [
            'description' => 'required'
        ];
        $this->validate($request, $rules);

        $user = \Auth::user();
        $data = $request->only(['description']);
        $data['number'] = 'f' . time();
        $data['openid'] = $user->openid;
        $feedbackUpdated = Feedback::create($data);
        return success_json(compact('user', 'feedbackUpdated'));
    }

    public function getMyOrders(Request $request)
    {
        $openid = $request->openid;
        $myOrders = Order::where('openid', $openid)->get();
        return success_json($myOrders);
    }

    public function setAddress(Request $request)
    {

        $openid = $request->openid;
        $name = $request->input('name');
        $region = $request->input('region');
        $detailAddress = $request->input('detailAddress');
        $phone = $request->input('phone');
        $currentAddress = $request->input('currentAddress');


        if ($currentAddress == 1 && $name && $region && $detailAddress && $phone) {
            Address::where([['openid', $openid], ['current_address', $currentAddress]])->update([
                'current_address' => 0
            ]);
        }


        if ($name && $region && $detailAddress && $phone && $currentAddress != null) {
            $addressUpdated = Address::create([
                'openid' => $openid,
                'name' => $name,
                'region' => $region,
                'detail_address' => $detailAddress,
                'phone' => $phone,
                'current_address' => $currentAddress
            ]);
            if ($addressUpdated) {
                return success_json('添加地址成功');
            } else {
                return error_json('添加地址失败');
            }
        } else {
            return error_json('添加地址失败');
        }
    }

    public function getAddress(Request $request)
    {
        $user = \Auth::user();
        $openid = $user->openid;
        $addresss = Address::where('openid', $openid)->get();
        if ($addresss) {
            return success_json($addresss);
        } else {
            return error_json('获取地址失败');
        }
    }

    public function updateAddress(Request $request)
    {
        $data = $request->only(['name', 'region', 'detail_address', 'phone', 'current_address', 'address_id']);
        $user = \Auth::user();

        $data['openid'] = $user->openid;

        if ($data['current_address'] == 1) {
            Address::where([['openid', $user->openid], ['current_address', $data['current_address']]])->update([
                'current_address' => 0
            ]);
        }

        $address = Address::where([['openid', $user->openid], ['id', $data['address_id']]])->first()->update($data);
        return success_json(compact('user'));
    }

    public function getRankingList(Request $request)
    {
        $res = Order::select('good_id')->with('good')->get();

        return $res;
    }

    public function test(Request $request)
    {
        $res = Order::where('openid', 'openid')->join('users');

        return success_json($res);
    }

}
