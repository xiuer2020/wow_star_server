<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use App\Models\User;

class VerifyRememberToken
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        try {
            $openId = Crypt::decryptString($request->input('token'));
            $user = User::where('openid', $openId);
            if ($user) {
                $request->openId = $openId;
                return $next($request);
            } else {
                return error_json('用户不存在');
            }
        } catch (\Exception $e) {
//            log($e);
            return error_json('token错误!');
        }

    }
}
