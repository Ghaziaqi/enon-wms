<?php
namespace app\controller;
use think\Controller,
	think\Session,
	app\model\User;

class Base extends Controller
{
	public function __construct(){
		parent::__construct();
    	if( !Session::get('uid','think') ){
            return $this->redirect("Login/index"); 
        }

        $this->assign([
        	'my_info'	=>	User::get(['id' => Session::get('uid','think') ])
        ]);

    }
    

}
