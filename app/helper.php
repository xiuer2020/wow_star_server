<?php

function success_json($data = '', $msg = '成功', $code = 200)
{
    $success = true;
    $rs = compact('data', 'success', 'msg', 'code');

    return response()->json($rs, $code);
}

function error_json($msg = 'error', $code = 200)
{
    $success = false;
    $rs = compact('success', 'msg', 'code');

    return response()->json($rs, 200);
}

function object_to_array ($obj){
    $arr = array();

    foreach ($obj as $key=>$value){
        $arr[$key] = $value;
    }
    return $arr;
}
