/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : xenon

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-12-29 14:11:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for x_unit
-- ----------------------------
DROP TABLE IF EXISTS `x_unit`;
CREATE TABLE `x_unit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL COMMENT '单位名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态: 0正常 1禁用',
  `remark` text,
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='计量单位';

-- ----------------------------
-- Records of x_unit
-- ----------------------------
INSERT INTO `x_unit` VALUES ('6', '5E057E79BE227', '箱', '0', '', '1577418381');

-- ----------------------------
-- Table structure for x_cate
-- ----------------------------
DROP TABLE IF EXISTS `x_cate`;
CREATE TABLE `x_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(20) DEFAULT NULL,
  `pid` int(11) unsigned DEFAULT NULL COMMENT '父级id',
  `name` varchar(20) NOT NULL COMMENT '分类名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态: 0正常 1禁用',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='分类';

-- ----------------------------
-- Records of x_cate
-- ----------------------------
INSERT INTO `x_cate` VALUES ('7', '5E05D264EBD06', null, '家电', '0', '', '1577439855');
INSERT INTO `x_cate` VALUES ('6', '5E058C8DB99A0', null, '服装', '0', '', '1577421987');

-- ----------------------------
-- Table structure for x_location
-- ----------------------------
DROP TABLE IF EXISTS `x_location`;
CREATE TABLE `x_location` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sn` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL COMMENT '库位',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态: 0正常 1禁用',
  `shelve` varchar(255) NOT NULL DEFAULT '默认' COMMENT '货架',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='库位管理';

-- ----------------------------
-- Records of x_location
-- ----------------------------
INSERT INTO `x_location` VALUES ('4', '5E05CAA38975C', 'A区', '0', '默认', '', '1577437869');
INSERT INTO `x_location` VALUES ('5', '5E05CAB053DFF', 'B区', '0', '默认', '', '1577437881');

-- ----------------------------
-- Table structure for x_product
-- ----------------------------
DROP TABLE IF EXISTS `x_product`;
CREATE TABLE `x_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(100) NOT NULL COMMENT '商品编号',
  `cjsn` varchar(100) DEFAULT NULL COMMENT '厂家编号',
  `name` varchar(10) NOT NULL COMMENT '商品名称',
  `cate` int(11) unsigned DEFAULT NULL COMMENT '分类id',
  `brand` int(11) unsigned DEFAULT NULL COMMENT '品牌id',
  `model` varchar(50) DEFAULT NULL COMMENT '型号',
  `spec` varchar(100) NOT NULL DEFAULT '' COMMENT '规格',
  `color` varchar(20) DEFAULT NULL COMMENT '颜色',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '默认价格',
  `unit` int(11) unsigned DEFAULT NULL COMMENT '单位id',
  `supplier` int(11) unsigned DEFAULT NULL COMMENT '默认供应商',
  `customer` int(11) unsigned DEFAULT NULL COMMENT '默认客户',
  `location` int(11) unsigned DEFAULT NULL COMMENT '默认库位',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态: 0正常 1禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Records of x_product
-- ----------------------------
INSERT INTO `x_product` VALUES ('11', '5E06CC08E7E16', '', '李宁', '6', '3', '', '', '0', '99.00', '6', '4', '1', '4', '', '1577503760', '0');
INSERT INTO `x_product` VALUES ('10', '5E06CBFBECDA0', '', '海尔', '7', '3', '', '', '0', '29.00', '6', '4', '1', '4', '', '1577503751', '0');

-- ----------------------------
-- Table structure for x_brand
-- ----------------------------
DROP TABLE IF EXISTS `x_brand`;
CREATE TABLE `x_brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `tel` varchar(15) DEFAULT NULL COMMENT '电话',
  `url` varchar(200) DEFAULT NULL COMMENT '网址',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态: 0正常 1禁用',
  `remark` text,
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='快递物流';

-- ----------------------------
-- Records of x_brand
-- ----------------------------
INSERT INTO `x_brand` VALUES ('3', null, '华为', '0512', 'www.huawei.com', '0', '1111', '1553051237');
INSERT INTO `x_brand` VALUES ('7', '5E058E2CB3393', '1111', '', '', '0', '', '1577422384');

-- ----------------------------
-- Table structure for x_express
-- ----------------------------
DROP TABLE IF EXISTS `x_express`;
CREATE TABLE `x_express` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `tel` varchar(15) DEFAULT NULL COMMENT '电话',
  `url` varchar(200) DEFAULT NULL COMMENT '网址',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态: 0正常 1禁用',
  `remark` text,
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='快递物流';

-- ----------------------------
-- Records of x_express
-- ----------------------------
INSERT INTO `x_express` VALUES ('2', '5E0588C358951', '顺丰快递', '05612', 'http://zjnewcars.com', '0', '1111', '1553135455');

-- ----------------------------
-- Table structure for x_supplier
-- ----------------------------
DROP TABLE IF EXISTS `x_supplier`;
CREATE TABLE `x_supplier` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `contact` varchar(20) DEFAULT NULL COMMENT '联系人',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话',
  `phone` varchar(12) NOT NULL COMMENT '手机号码',
  `email` varchar(40) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL COMMENT '省份',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `district` varchar(20) DEFAULT NULL COMMENT '县区',
  `street` varchar(200) DEFAULT NULL COMMENT '街道',
  `credit_id` varchar(50) DEFAULT NULL COMMENT '统一社会信用代码',
  `taxpayer_id` varchar(255) DEFAULT NULL COMMENT '纳税人识别号',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `bank` varchar(20) DEFAULT NULL COMMENT '开户行',
  `bank_number` varchar(30) DEFAULT NULL COMMENT '开户银行卡号',
  `bank_address` varchar(200) DEFAULT NULL COMMENT '开户行地址',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态: 0正常 1禁用',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='供应商管理';

-- ----------------------------
-- Records of x_supplier
-- ----------------------------
INSERT INTO `x_supplier` VALUES ('4', null, '北京亨通慧', '布尔', '', '18506292124', '30024168@qq.com', '北京市', '北京城区', '朝阳区', '111', '', '', '', '中国建设银行', '6223333', '北京市通州区', '0', '1577416420');
INSERT INTO `x_supplier` VALUES ('5', '5E057AFEA7226', '111', '1111', '1111', '111', '11', '河南省', '商丘市', '梁园区', '111', '111', '', '111', '中国工商银行', '', '11', '0', '1577417488');

-- ----------------------------
-- Table structure for x_customer
-- ----------------------------
DROP TABLE IF EXISTS `x_customer`;
CREATE TABLE `x_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `type` tinyint(1) unsigned DEFAULT NULL COMMENT '客户类型，0 个人，1商家',
  `contact` varchar(20) DEFAULT NULL COMMENT '联系人',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话',
  `phone` varchar(12) NOT NULL COMMENT '手机号码',
  `email` varchar(40) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL COMMENT '省份',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `district` varchar(20) DEFAULT NULL COMMENT '县区',
  `street` varchar(200) DEFAULT NULL COMMENT '街道',
  `credit_id` varchar(50) DEFAULT NULL COMMENT '统一社会信用代码',
  `taxpayer_id` varchar(255) DEFAULT NULL COMMENT '纳税人识别号',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `bank` varchar(20) DEFAULT NULL COMMENT '开户行',
  `bank_number` varchar(30) DEFAULT NULL COMMENT '开户银行卡号',
  `bank_address` varchar(200) DEFAULT NULL COMMENT '开户行地址',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态: 0正常 1禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_customer
-- ----------------------------
INSERT INTO `x_customer` VALUES ('1', null, '', '1577355860', '0', '1111', '', '18506292124', '30024167@qq.com', '浙江省', '杭州市', '西湖区', '111111', '', '', '', '中国工商银行', '', '', '0');
INSERT INTO `x_customer` VALUES ('2', null, '', '1577356263', '0', '22222', '', '18506292128', 'admin@b24.cn', '浙江省', '杭州市', '西湖区', '2222', '', '', '', '中国工商银行', '', '', '0');

-- ----------------------------
-- Table structure for x_admin
-- ----------------------------
DROP TABLE IF EXISTS `x_admin`;
CREATE TABLE `x_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(40) DEFAULT NULL,
  `username` varchar(16) DEFAULT NULL,
  `truename` varchar(20) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '0正常 1禁用',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(12) DEFAULT NULL COMMENT '手机号',
  `remark` text,
  `create_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_admin
-- ----------------------------
INSERT INTO `x_admin` VALUES ('1', '1111', 'admin', '测试', 'da146e60619d5e8252c3c67597a566eb', '0', '30024167@qq.com', '18506292124', '11111', null);
INSERT INTO `x_admin` VALUES ('8', '5E0460F9E6023', 'admin123', '测试', '21232f297a57a5a743894a0e4a801fc3', '1', '30024167@qq.com', '18506292124', '', '1577345293');

-- ----------------------------
-- Table structure for x_indepot
-- ----------------------------
DROP TABLE IF EXISTS `x_indepot`;
CREATE TABLE `x_indepot` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(20) NOT NULL COMMENT '入库单号',
  `type` varchar(40) DEFAULT NULL COMMENT '入库类型',
  `author` varchar(40) DEFAULT NULL COMMENT '操作人',
  `supplier` int(11) unsigned DEFAULT NULL COMMENT '供应商',
  `in_date` varchar(20) DEFAULT NULL COMMENT '入库日期',
  `count` decimal(10,2) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态: 0正常 1禁用',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='入库操作';

-- ----------------------------
-- Records of x_indepot
-- ----------------------------
INSERT INTO `x_indepot` VALUES ('68', '5E0813373103D', '1', '', '4', '2019-12-29', '9900.00', '0', '1577587522');

-- ----------------------------
-- Table structure for x_indepot_main
-- ----------------------------
DROP TABLE IF EXISTS `x_indepot_main`;
CREATE TABLE `x_indepot_main` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fid` int(11) unsigned NOT NULL COMMENT '父级的id',
  `pid` int(11) unsigned NOT NULL COMMENT '产品id',
  `num` int(11) unsigned NOT NULL COMMENT '数量',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '价格',
  `count` decimal(10,2) unsigned DEFAULT NULL COMMENT '合计',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='采购明细';

-- ----------------------------
-- Records of x_indepot_main
-- ----------------------------
INSERT INTO `x_indepot_main` VALUES ('75', '68', '11', '100', '99.00', '9900.00', '1577587522');

-- ----------------------------
-- Table structure for x_outdepot
-- ----------------------------
DROP TABLE IF EXISTS `x_outdepot`;
CREATE TABLE `x_outdepot` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(20) NOT NULL COMMENT '入库单号',
  `type` varchar(40) DEFAULT NULL COMMENT '入库类型',
  `author` varchar(40) DEFAULT NULL COMMENT '操作人',
  `supplier` int(11) unsigned DEFAULT NULL COMMENT '供应商',
  `in_date` varchar(20) DEFAULT NULL COMMENT '入库日期',
  `count` decimal(10,2) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态: 0正常 1禁用',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='入库操作';

-- ----------------------------
-- Records of x_outdepot
-- ----------------------------

-- ----------------------------
-- Table structure for x_outdepot_main
-- ----------------------------
DROP TABLE IF EXISTS `x_outdepot_main`;
CREATE TABLE `x_outdepot_main` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fid` int(11) unsigned NOT NULL COMMENT '父级的id',
  `pid` int(11) unsigned NOT NULL COMMENT '产品id',
  `num` int(11) unsigned NOT NULL COMMENT '数量',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '价格',
  `count` decimal(10,2) unsigned DEFAULT NULL COMMENT '合计',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='采购明细';

-- ----------------------------
-- Records of x_outdepot_main
-- ----------------------------

-- ----------------------------
-- Table structure for x_stock
-- ----------------------------
DROP TABLE IF EXISTS `x_stock`;
CREATE TABLE `x_stock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL COMMENT '产品id',
  `num` int(11) NOT NULL,
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='库存表';

-- ----------------------------
-- Records of x_stock
-- ----------------------------
INSERT INTO `x_stock` VALUES ('9', '11', '60', '0', '1577585670');
INSERT INTO `x_stock` VALUES ('10', '10', '5', '0', '1577585670');
