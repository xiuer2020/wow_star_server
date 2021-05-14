<?php


namespace App\Http\Controllers;


use App\Models\Good;
use App\Models\Order;
use App\Models\RankingList;
use App\Models\User;
use Illuminate\Http\Request;

class AppController extends Controller
{
    public function getGoodList()
    {
        $goodList = Good::all();
        return success_json($goodList);
    }

    public function getRankingList(Request $request)
    {
        $rules = [
            'good_id'=>'required'
        ];
        $this->validate($request, $rules);

        $good_id = $request->input('good_id');
        $res = RankingList::where('good_id', $good_id)->orderByDesc('quantity')->with('user')->get();



        return success_json($res);
    }
}
