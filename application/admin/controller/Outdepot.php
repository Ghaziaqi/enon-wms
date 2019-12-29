<?php
namespace app\admin\controller;
use think\Db;

class Outdepot extends Base
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
		$count = model('Outdepot')->where($where)->count();

		// 查询
		$data = model('Outdepot')
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
     */
    public function create()
    {
        $customer = model('Customer')->where(['status' => 0 ])->select();
        $this->assign([
            'customer'  =>  $customer
        ]);
        return view();
    }


    public function select()
    {
        $cate = model('Cate')->where(['status' => 0 ])->select();
        $brand = model('Brand')->where(['status' => 0 ])->select();
        // $unit = model('Unit')->where(['status' => 0 ])->select();
        $this->assign([
            'cate'      =>  $cate,
            'brand'     =>  $brand,
        ]);
        return view();
    }


    public function search()
    {
        $param = input();
        $where = [
            // 'sn'        =>  $param['sn'],
            // 'cate'      =>  $param['cate'],
            // 'brand'     =>  $param['brand'],
            // 'name'      =>  ['like','%'.$param['name'].'%']
        ];

        empty( $param['sn'] )       || $where['a.sn']     = $param['sn'];
        empty( $param['name'] )     || $where['a.name']   = ['like','%'.$param['name'].'%'];
        empty( $param['cate'] )     || $where['a.cate']   = $param['cate'];
        empty( $param['brand'] )    || $where['a.brand']  = $param['brand'];

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
        ->select();

		return json([
			'rows'	=>  $data
		]);

    }


    /**
     * 保存新建的资源
     *
     */
    public function save()
    {
        $data = input();
        $data['create_time'] = time();

        // 验证数据
        $validate = validate('Outdepot');
        $res = $validate->check( $data );
		$res || returnJson($validate->getError(),-100);

        // 添加入库更新库存
        return (new \app\admin\util\Depot)->out_add($data);
    }

    /**
     * 显示指定的资源
     *
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
        //
    }

    /**
     * 保存更新的资源
     *
     */
    public function update()
    {
        //
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
        
        // 遍历id
        foreach ($id as $k => $v) {

            $row = model('OutdepotMain')->where(['fid' => $v])->select();
            model('Stock')->resetNum($v,$row,'update');
            model('Outdepot')->where(['id' => $v])->delete();
            model('OutdepotMain')->where(['fid' => $v])->delete();
        }
        return ['error'	=>	0,'msg'	=>	'删除成功'];	
    }
}
