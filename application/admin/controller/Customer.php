<?php

namespace app\admin\controller;
use think\Controller;

class Customer extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        if( !request()->isAjax() ) return view();

		// 接受参数
		$pageSize = input('rows/d');
		$page = input('page/d');
		$sort = input('sort/s');
        $order = input('sortOrder/s');

        $where = [];
        $param = input('data');
        // 自定义 where 条件
        $where = [];

		//总记录数
		$count = model('Customer')->where($where)->count();

		// 查询
		$data = model('Customer')
		->where($where)
		->order($sort, $order)
		->page("{$page},{$pageSize}")
        ->select();
		return json([
			// 总记录数
			'total' =>  $count,
			'rows'	=>  $data
		]);
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        return view();
    }

    /**
     * 保存新建的资源
     *
     */
    public function save()
    {
        // 接受参数
        $data = input();
        $data['create_time'] = time();

        // 验证数据
        $validate = validate('Customer');
        $res = $validate->check( $data );
		$res || returnJson($validate->getError(),-100);

        // 创建数据写到数据库
        $res = model('Customer')->create($data);
        if($res){
            return json([
                'error' =>  0,
                'msg'   =>  '添加成功'
            ]);
        }else{
            return json([
                'error' =>  -10,
                'msg'   =>  '添加失败'
            ]);
        }
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        $row = model('Customer')->find($id);
        $this->assign([
            'row'   =>  $row
        ]);
        return view();
    }

    /**
     * 保存更新的资源
     *
     */
    public function update()
    {
        $data = input();

        // 验证数据
        $validate = validate('Customer');
        $res = $validate->check( $data );
		$res || returnJson($validate->getError(),-100);

        //更新数据
        $res = model('Customer')->update($data);
        if($res){
            return json([
                'error' =>  0,
                'msg'   =>  '修改成功'
            ]);
        }else{
            return json([
                'error' =>  -10,
                'msg'   =>  '修改失败'
            ]);
        }
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
		// 判断删除的是否是数组
		is_array($id) || $id = [$id];

		// 判断是否删除成功
    	if( model('Customer')->destroy($id) ){
    		return ['error'	=>	0,'msg'	=>	'删除成功'];
    	}else{
    		return ['error'	=>	100,'msg'	=>	'删除失败'];	
    	}
    }
}
