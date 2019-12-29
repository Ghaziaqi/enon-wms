<?php
namespace app\admin\util;
use think\Db,
	app\admin\model\Indepot as In_depot;
	// app\admin\model\Outdepot as Out_depot;

class Depot
{
	/**
	 * [__construct 构造方法]
	 */
	function __construct()
	{
	}

	// 添加入库
	public function in_add($data){

		// 启动事务
		Db::startTrans();
		try {
            // 创建数据写到数据库
            $res = model('Indepot')->create($data);

            $tempList = [];
            foreach($data['p_id'] as $k=>$v){
                if( !empty($data['p_id'][$k]) ){
                    $tempList[] = [
                        'fid'           =>  $res['id'],
                        'pid'           =>  $data['p_id'][$k],
                        'num'           =>  $data['num'][$k],
                        'price'         =>  $data['price'][$k],
                        'count'         =>  $data['sum'][$k],
                        'create_time'   =>  time()
                    ];
                }
                
            }
            // 保存全部
            model('IndepotMain')->saveAll($tempList);
			// 修改仓库库存
			model('Stock')->setNum($tempList);

            // 提交事务
            Db::commit();
            return json([
                'error' =>  0,
                'msg'   =>  '添加成功'
            ]);	

		} catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
            return json([
                'error' =>  -10,
                'msg'   =>  $e->getMessage()
            ]);
        }

	}

	// 更新入库
	public function in_update($data){
		// 事务操作
		Db::transaction(function () use($data) {
			$model = new In_depot();
			//保存全部
			$model->update($data);

			// 组装插入的数据
			$temp = $addTemp = [];
			foreach ($data['data'] as $k => $v) {
				// 检测是否有该产品
				if( isset($v['sid']) ){
					$temp[] = [
						'id'			=> $v['id'],	
						'sid' 			=> $v['sid'],
						'pid' 			=> $v['pid'],
						'num' 			=> $v['num'],
						'price' 		=> $v['price'],
						'brand'			=>	$v['brand']['id'],
						'color'			=>	$v['color']['id'],
						'unit'			=>	$v['unit']['id'],
						'depot'			=>	$v['depot'],
						'location'		=>	$v['location'],
						'count'			=>	$v['count'],
					];
				}else{
					$addTemp[] = [
						'fid'			=> $data['id'],
						'sid' 			=> $data['id'],
						'pid' 			=> $v['id'],
						'num' 			=> $v['num'],
						'price' 		=> $v['price'],
						'brand'			=>	$v['brand']['id'],
						'color'			=>	$v['color']['id'],
						'unit'			=>	$v['unit']['id'],
						'depot'			=>	$v['depot'],
						'location'		=>	$v['location'],
						'count'			=>	$v['count'],
						'create_time'	=>	time()
					];
				}

			}
			// 更新
			model('IndepotMain')->saveAll($temp);
			// 新增
			model('IndepotMain')->insertAll($addTemp);

			// 检测是否有删除的数据
			isset($data['dels']) || $data['dels'] =[];
			// 删除
			model('IndepotMain')->destroy($data['dels']);

			// 修改仓库库存
			$stock = new Stock();
			$stock->setUpdateNum($data['data'], db('IndepotMain','in') );

			return ['error'	=>	0,'msg'	=>	'修改成功' ];
		});

		return ['error'	=>	0,'msg'	=>	'修改成功'];
	}



	// 出库添加
	public function out_add($data){
		// 启动事务
		Db::startTrans();
		try {
            // 创建数据写到数据库
            $res = model('Outdepot')->create($data);

            $tempList = [];
            foreach($data['p_id'] as $k=>$v){
                if( !empty($data['p_id'][$k]) ){
                    $tempList[] = [
                        'fid'           =>  $res['id'],
                        'pid'           =>  $data['p_id'][$k],
                        'num'           =>  $data['num'][$k],
                        'price'         =>  $data['price'][$k],
                        'count'         =>  $data['sum'][$k],
                        'create_time'   =>  time()
                    ];
                }
                
            }
            // 保存全部
            model('OutdepotMain')->saveAll($tempList);
			// 修改仓库库存
			model('Stock')->setNum($tempList,'update');

            // 提交事务
            Db::commit();
            return json([
                'error' =>  0,
                'msg'   =>  '添加成功'
            ]);	

		} catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
            return json([
                'error' =>  -10,
                'msg'   =>  $e->getMessage()
            ]);
        }
	}


	// 出库更新
	public function out_update($data){
		// 事务操作
		Db::transaction(function () use($data) {

			$model = new Out_depot();
			//保存全部
			$model->update($data);

			// 组装插入的数据
			$temp = $addTemp = [];
			foreach ($data['data'] as $k => $v) {
				// 检测是否有该产品
				if( isset($v['sid']) ){
					$temp[] = [
						'id'			=> $v['id'],	
						'sid' 			=> $v['sid'],
						'pid' 			=> $v['pid'],
						'num' 			=> $v['num'],
						'price' 		=> $v['price'],
						'brand'			=>	$v['brand']['id'],
						'color'			=>	$v['color']['id'],
						'unit'			=>	$v['unit']['id'],
						'depot'			=>	$v['depot'],
						'location'		=>	$v['location'],
						'count'			=>	$v['count'],
					];
				}else{
					$addTemp[] = [
						'fid'			=> $data['id'],
						'sid' 			=> $data['id'],
						'pid' 			=> $v['id'],
						'num' 			=> $v['num'],
						'price' 		=> $v['price'],
						'brand'			=>	$v['brand']['id'],
						'color'			=>	$v['color']['id'],
						'unit'			=>	$v['unit']['id'],
						'depot'			=>	$v['depot'],
						'location'		=>	$v['location'],
						'count'			=>	$v['count'],
						'create_time'	=>	time()
					];
				}

			}
			// 更新
			model('OutdepotMain')->saveAll($temp);
			// 新增
			model('OutdepotMain')->insertAll($addTemp);

			// 检测是否有删除的数据
			isset($data['dels']) || $data['dels'] =[];
			// 删除
			model('OutdepotMain')->destroy($data['dels']);

			// 修改仓库库存
			$stock = new Stock();
			$stock->setUpdateNum($data['data'], db('OutdepotMain'),'out' );

			return ['error'	=>	0,'msg'	=>	'修改成功' ];
		});

		return ['error'	=>	0,'msg'	=>	'修改成功'];
	}


}
