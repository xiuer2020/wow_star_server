<?php


namespace App\Http\Controllers;


use App\Models\Good;
use App\Models\Order;
use App\Models\RankingList;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index(Request $request)
    {
        $user = \Auth::user();
        $orders = Order::where('user_id', $user->id)->with('user', 'good')->get();
        return success_json(compact('orders'));
    }

    public function add(Request $request)
    {
        $rules = [
            'good_id' => 'required',
            'quantity' => 'required',
            'region' => 'required',
            'detail_address' => 'required',
            'post_type' => 'required'
        ];
        $this->validate($request, $rules);

        $user = \Auth::user();
        $data = $request->only('good_id', 'region', 'detail_address', 'quantity', 'post_type');
        $data['number'] = 'ws' . time();
        $data['user_id'] = $user->id;
        // 销量增加
        $good_sale_quantity = Good::where('id', $data['good_id'])->first()->sale_quantity;
        $good_sale_quantity_updated = Good::where('id', $data['good_id'])->update([
            'sale_quantity' => $good_sale_quantity + $data['quantity'],
        ]);
        if ($good_sale_quantity_updated === 0) {
            return error_json('订单提交失败');
        }
        $order_updated = Order::create($data);
        $ranking_list_record = RankingList::where([['user_id', $data['user_id']], ['good_id', $data['good_id']]])->with('user')->get();

        return success_json(compact('order_updated', 'user', 'ranking_list_record'));
    }

    public function detail()
    {

    }

    public function update()
    {
    }

    public function destroy()
    {
    }

}
