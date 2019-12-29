<?php

namespace app\admin\model;

use think\Model;
use think\Db;

class Stock extends Model
{
    // $depot->in_depot($data,$type);

	// 改写仓库库存
    public function setNum($data,$type="in"){

		// 事务操作
		Db::transaction(function () use($data,$type) {

			foreach ($data as $k => $v) {

                $row = $this->getByPid($v['pid']);
                if(!$row){
                    $this->create([
                        'pid'           =>  $v['pid'],
                        'num'           =>  0,
                        'create_time'   =>  time()
                    ]);
                }

				// 更新库存
				if( $type=="in" ){	
					if(  $v['num'] >0 ){
						// 自增
						$this->where(['pid' => $v['pid']])->setInc('num', $v['num']);
					}else {
						// 自减
						$this->where(['pid' => $v['pid']])->setDec('num', $v['num']);
					}
				}else{
					if(  $v['num'] < 0 ){
						// 自增
						$this->where(['pid' => $v['pid']])->setInc('num', $v['num']);
					}else {
						// 自减
						$this->where(['pid' => $v['pid']])->setDec('num', $v['num']);
					}
				}

			}

		});
 
	}
	
	// 更新库存
	public function setUpdateNum($data,$model,$type="in"){
		// 事务操作
		Db::transaction(function () use($data,$model,$type) {

			// 更新库存			
			foreach ($data as $k => $v) {
				$res = $model->find($v['id']);
				// 判断是否修改数量
				if( $res['num'] != $v['num'] ){
					// 计算更新新增
					$num = $v['num'] - $res['num'];
					if($num>0){

						if($type == 'in'){
								$this->where(['pid' => $v['pid']])->setInc('num', $num);
						}else{
							$this->where(['pid' => $v['pid']])->setDec('num', $num);	
						}

					}else{
						$num = abs($num);
						if($type == 'in'){
							$this->where(['pid' => $v['pid']])->setDec('num', $num);	
						}else{
							$this->where(['pid' => $v['pid']])->setInc('num', $num);
						}
						
					}

				}

			}
		});
	}

	// 删除重置数量
	public function resetNum($fid,$data,$type="in"){
		// 事务操作
		Db::transaction(function () use($fid,$data,$type) {
            
			// 遍历
			foreach ($data as $k => $v) {
				if( $type == 'in' ){
					$this->where(['pid' => $v['pid']])->setDec('num', $v['num']);	
				}else{
					$this->where(['pid' => $v['pid']])->setInc('num', $v['num']);		
				}
			}

		});
	}



}
