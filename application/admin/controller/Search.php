<?php
namespace app\admin\controller;

class Search extends Base
{
    public function index()
    {
        if( !request()->isAjax() ){
            $cate = model('Cate')->where(['status' => 0 ])->select();
            $brand = model('Brand')->where(['status' => 0 ])->select();
            $unit = model('Unit')->where(['status' => 0 ])->select();
            // 
            $this->assign([
                'cate'      =>  $cate,
                'brand'     =>  $brand,
                'unit'      =>  $unit
            ]);
            return view();
        } 

		// 接受参数
		$pageSize = input('rows/d');
		$page = input('page/d');
		$sort = input('sort/s');
        $order = input('sortOrder/s');

        $where = [];
        $param = input('data');

        // 自定义 where 条件
        $where = [];

        empty( $param['sn'] )       || $where[]     = ['a.sn','=',$param['sn']];
        empty( $param['name'] )     || $where[]     = ['a.name','like','%'.$param['name'].'%'];
        empty( $param['cate'] )     || $where[]     = ['a.cate','=',$param['cate']];
        empty( $param['brand'] )    || $where[]     = ['a.brand','=',$param['brand']];

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
            'rows'	=>  $data,
            'sql'   =>  model('Product')->getLastSql()
		]);
    }

    public function main()
    {
        return view();
    }

}
