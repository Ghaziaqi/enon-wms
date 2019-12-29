<?php
// 返回json
function returnJson($str,$code=0,$data=[])
{
    header('Access-Control-Allow-Origin: *');
    header('Content-type: application/json');

    // count($data)<=0 && $data = (object)$data;

    die(json_encode([
        'error' => $code,
        'msg' => $str,
        'data' => $data
    ]));
}