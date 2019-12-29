<?php

namespace app\admin\validate;

use think\Validate;

class Admin extends Validate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
        'sn'        =>  'require',
        'truename'  =>  'require',
        'username'  =>  'require|max:16|min:4|unique:admin',
        'password'  =>  'require|min:4',
        'phone'     =>  'require|mobile',
        'email'     =>  'require|email',
    ];
    
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [
        'sn.require'        =>  '编号不能为空',
        'truename.require'  =>  '姓名不能为空',
        'username.require'  =>  '账号不能为空',
        'username.min'      =>  '账号不能小于4位',
        'username.max'      =>  '账号不能大于16位',
        'username.unique'   =>  '账号已经存在',
        'password.require'  =>  '密码不能为空',
        'password.min'      =>  '密码不能小于4位',
        'phone.require'     =>  '手机号不能为空',
        'phone.mobile'      =>  '手机号格式错误',
        'email.require'     =>  '邮箱不能为空',
        'email.email'       =>  '邮箱格式错误',
    ];

    // 验证场景
    protected $scene = [
        'update'  =>  [
            'truename',
            // 'username',
            'password',
            'phone',
            'email',
        ],
    ];


}
