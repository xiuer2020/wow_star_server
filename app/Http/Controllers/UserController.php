<?php

namespace App\Http\Controllers;

use App\Models\Feedback;
use App\Models\Address;
use Illuminate\Http\Request;

class UserController extends Controller
{
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

    public function setAddress(Request $request)
    {
        $rules = [
            'name' => 'required',
            'region' => 'required',
            'phone' => 'required',
            'current_address' => 'required',
            'detail_address' => 'required'
        ];
        $this->validate($request, $rules);

        $data = $request->only(['name', 'region', 'detail_address', 'phone', 'current_address']);
        $user = \Auth::user();
        $data['openid'] = $user->openid;
        if ($data['current_address'] == 1) {
            Address::where([['openid', $user->openid], ['current_address', $data['current_address']]])->update([
                'current_address' => 0
            ]);
        }
        $addressUpdated = Address::create($data);

        return success_json(compact('addressUpdated', 'user'));
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
        $rules = [
            'name' => 'required',
            'region' => 'required',
            'detail_address' => 'required',
            'phone' => 'required',
            'current_address' => 'required',
            'address_id' => 'required'
        ];
        $this->validate($request, $rules);

        $data = $request->only(['name', 'region', 'detail_address', 'phone', 'current_address', 'address_id']);
        $user = \Auth::user();
        $data['openid'] = $user->openid;
        if ($data['current_address'] == 1) {
            Address::where([['openid', $user->openid], ['current_address', $data['current_address']]])->update([
                'current_address' => 0
            ]);
        }

        $addressUpdated = Address::where([['openid', $user->openid], ['id', $data['address_id']]])->first()->update($data);
        return success_json(compact('user'));
    }

}
