<?php


namespace App\Http\Controllers;


use App\Models\Good;
use App\Models\Order;
use Illuminate\Http\Request;

use Illuminate\Support\Str;

class OrderController extends Controller
{
    public function test(Str $str)
    {

}

    public function index(Request $request)
    {
        $user = \Auth::user();
        return success_json($user);
//        $list = Good::where('user_id',$user_id)->find(1);
    }

    public function detail()
    {

    }

    public function add()
    {
    }

    public function update()
    {
    }

    public function destroy()
    {
    }

    public function comfirmOrder(Request $request)
    {
        $rules = [
            'good_id' => 'required',
            'quantity' => 'required',
            'address' => 'required',
            'post_type' => 'required'
        ];
        $this->validate($request, $rules);

        $user = \Auth::user();
        $data = $request->only('good_id', 'address', 'quantity', 'post_type');
        $data['number'] = 'ws' . time();
        $data['openid'] = $user->openid;
        // 销量增加
        $goodSaleQuantity = Good::where('id', $data['good_id'])->first()->sale_quantity;
        $goodSaleQuantityUpdated = Good::where('id', $data['good_id'])->update([
            'sale_quantity' => $goodSaleQuantity + $data['quantity'],
        ]);
        if ($goodSaleQuantityUpdated === 0) {
            return error_json('订单提交失败');
        }
        $orderUpdated = Order::create($data);

        return success_json(compact('orderUpdated', 'user'));
    }
}
