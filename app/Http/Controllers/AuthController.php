<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\WxSession;
use EasyWeChat\Factory;
use Illuminate\Http\Request;


class AuthController extends Controller
{

    /**
     * 获取openid
     * POST
     * @param String $code 授权码
     */
    public function getOpenid(Request $request)
    {
        $rules = [
            'code' => 'required'
        ];
        $this->validate($request, $rules);

        $code = $request->input('code');
        $config = config('wechat.miniprogram');
        $app = Factory::miniProgram($config);

        $session = $app->auth->session($code);
        if (isset($session['errcode']) && $session['errcode'] != 0) return error_json($session['errmsg']);
        $openid = $session['openid'];
        $session_key = $session['session_key'];

        WxSession::where('openid', $openid)->delete();
        WxSession::create(compact('openid', 'session_key'));

        return success_json(compact('openid', 'session_key'));
    }

    /**
     * 登录
     * POST
     * @param String $openid Openid
     * @param String $session_key SessionKey
     * @param String $iv IV
     * @param String $encryptedData encryptedData
     */
    public function login(Request $request)
    {
        $rules = [
            'openid' => 'required',
            'iv' => 'required',
            'encryptedData' => 'required',
        ];
        $this->validate($request, $rules);

        $openid = $request->input('openid');
        $session_key = '';
        $session = WxSession::where('openid', $openid)->orderByDesc('id')->first();
        if (!$session) return error_json('no session', 414);
        if ($session) {
            $session_key = $session->session_key;
            $iv = $request->input('iv');
            $encryptedData = $request->input('encryptedData');

            $config = config('wechat.miniprogram');
            try {

                $app = Factory::miniProgram($config);
                $decryptData = $app->encryptor->decryptData($session_key, $iv, $encryptedData);
                return success_json($decryptData);
            } catch (\Exception $exception) {
                return error_json($exception->getMessage(), 414);
            }
        }
        $user = User::where('openid', $openid)->first();
        if ($user) {
            if ($session_key) $user->session_key = $session_key;
            $user->save();
        } else {
            $user = User::create(compact('openid', 'session_key'));
        }
        $user->tokens()->delete();
        $token = $user->createToken('token_name')->plainTextToken;

        return success_json(['token' => $token, 'user' => $user]);
    }
}
