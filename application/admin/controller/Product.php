<?php
namespace app\admin\controller;


class Product extends Base
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
        $count = model('Product')->alias('a')
        ->where($where)
        ->count();

		// 查询
        $data = model('Product')->alias('a')
        ->field('
            a.*,
            b.name as cate_name,
            c.name as brand_name,
            d.name as unit_name
        ')
        ->leftJoin('cate b','a.cate = b.id')
        ->leftJoin('brand c','a.brand = c.id')
        ->leftJoin('unit d','a.unit = d.id')
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
        $cate = model('Cate')->where(['status' => 0 ])->select();
        $brand = model('Brand')->where(['status' => 0 ])->select();
        $unit = model('Unit')->where(['status' => 0 ])->select();
        $supplier = model('Supplier')->where(['status' => 0 ])->select();
        $customer = model('Customer')->where(['status' => 0 ])->select();
        $location = model('Location')->where(['status' => 0 ])->select();
        // location
        $this->assign([
            'cate'      =>  $cate,
            'brand'     =>  $brand,
            'unit'      =>  $unit,
            'supplier'  =>  $supplier,
            'customer'  =>  $customer,
            'location'  =>  $location
        ]);
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
        $validate = validate('Product');
        $res = $validate->check( $data );
		$res || returnJson($validate->getError(),-100);

        // 创建数据写到数据库
        $res = model('Product')->create($data);
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
        $row = model('Product')->find($id);
        
        $cate = model('Cate')->where(['status' => 0 ])->select();
        $brand = model('Brand')->where(['status' => 0 ])->select();
        $unit = model('Unit')->where(['status' => 0 ])->select();
        $supplier = model('Supplier')->where(['status' => 0 ])->select();
        $customer = model('Customer')->where(['status' => 0 ])->select();
        $location = model('Location')->where(['status' => 0 ])->select();
        // location
        $this->assign([
            'row'       =>  $row,
            'cate'      =>  $cate,
            'brand'     =>  $brand,
            'unit'      =>  $unit,
            'supplier'  =>  $supplier,
            'customer'  =>  $customer,
            'location'  =>  $location
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
        $validate = validate('Product');
        $res = $validate->check( $data );
		$res || returnJson($validate->getError(),-100);

        //更新数据
        $res = model('Product')->update($data);
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
    	if( model('Product')->destroy($id) ){
    		return ['error'	=>	0,'msg'	=>	'删除成功'];
    	}else{
    		return ['error'	=>	100,'msg'	=>	'删除失败'];	
    	}
    }
    
}
