/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : wms

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-03 13:01:35
*/
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for w_category
-- ----------------------------
DROP TABLE IF EXISTS `w_category`;
CREATE TABLE `w_category` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `desc` mediumtext,
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_category
-- ----------------------------
INSERT INTO `w_category` VALUES ('1', '0', '数码', '0', '', '1514456685');
INSERT INTO `w_category` VALUES ('2', '1', '手机', '0', '手机', '1514457825');
INSERT INTO `w_category` VALUES ('3', '0', '服装', '0', '', '1514554550');

-- ----------------------------
-- Table structure for w_customer
-- ----------------------------
DROP TABLE IF EXISTS `w_customer`;
CREATE TABLE `w_customer` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `address` varchar(40) NOT NULL,
  `desc` mediumtext,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `sn` (`sn`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='客户';

-- ----------------------------
-- Records of w_customer
-- ----------------------------
INSERT INTO `w_customer` VALUES ('1', '5a44a4f6f1f18', '苏州牧冬光电有限公司', '测试', '15069900798', '30024167@qq.com', '15069900798', '江苏省苏州市长阳街', '苏州牧冬光电有限公司...', '0', '1514448252');
INSERT INTO `w_customer` VALUES ('2', '5a44b3f23a31c', '爱美克空气过滤器', '测试', '1705280089', '30024167@qq.com', '0312-56777890', '苏州市工业园区长阳街', '爱美克空气过滤器', '0', '1514452007');

-- ----------------------------
-- Table structure for w_location
-- ----------------------------
DROP TABLE IF EXISTS `w_location`;
CREATE TABLE `w_location` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `storage` mediumint(5) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL COMMENT '0',
  `desc` varchar(200) DEFAULT NULL COMMENT '备注',
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='库位管理';

-- ----------------------------
-- Records of w_location
-- ----------------------------
INSERT INTO `w_location` VALUES ('1', '17122705595244343', 'B区', '1', '0', '', '1514368943');
INSERT INTO `w_location` VALUES ('2', '17122706022839995', 'A区', '3', '0', '', '1514368959');

-- ----------------------------
-- Table structure for w_order
-- ----------------------------
DROP TABLE IF EXISTS `w_order`;
CREATE TABLE `w_order` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(40) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `supplier` varchar(40) DEFAULT NULL,
  `state` tinyint(1) unsigned DEFAULT NULL COMMENT '1',
  `type` varchar(40) DEFAULT NULL,
  `res` mediumtext,
  `desc` mediumtext,
  `add_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_order
-- ----------------------------
INSERT INTO `w_order` VALUES ('1', 'SN2017122907045664503', '布尔', '默认', '1', '采购入库', '[[\"5a470f4c59ebd\",\"\\u8363\\u8000V10\",\"10\",\"1999.00\",\"\\u534e\\u4e1c\\u4ed3\\u5e93\",\"\\u4e2a\"],[\"5a47110d39206\",\"\\u91d1\\u7acbs10\",\"10\",\"2555.00\",\"\\u897f\\u5357\\u5730\\u533a\",\"\\u4e2a\"],[\"5a4711ce77e24\",\"\\u5c0f\\u7c736\",\"10\",\"2499.00\",\"\\u534e\\u4e2d\\u5730\\u533a\",\"\\u4e2a\"]]', '暂无备注', '1514546311');
INSERT INTO `w_order` VALUES ('2', 'SN2017122907323362528', '布尔', '苏州牧冬光电有限公司', '1', '销售退货', '[[\"5a470f4c59ebd\",\"\\u8363\\u8000V10\",\"10\",\"1999.00\",\"\\u534e\\u4e1c\\u4ed3\\u5e93\",\"\\u4e2a\"],[\"5a47110d39206\",\"\\u91d1\\u7acbs10\",\"10\",\"2555.00\",\"\\u897f\\u5357\\u5730\\u533a\",\"\\u4e2a\"],[\"5a4711ce77e24\",\"\\u5c0f\\u7c736\",\"10\",\"2499.00\",\"\\u534e\\u4e2d\\u5730\\u533a\",\"\\u4e2a\"]]', '暂无备注', '1514547169');
INSERT INTO `w_order` VALUES ('3', 'SN2017122908231479439', '布尔', '苏州牧冬光电有限公司', '1', '采购入库', '[[\"5a470f4c59ebd\",\"\\u8363\\u8000V10\",\"10\",\"1999.00\",\"\\u534e\\u4e1c\\u4ed3\\u5e93\",\"\\u4e2a\"],[\"5a47110d39206\",\"\\u91d1\\u7acbs10\",\"10\",\"2555.00\",\"\\u897f\\u5357\\u5730\\u533a\",\"\\u4e2a\"],[\"5a4711ce77e24\",\"\\u5c0f\\u7c736\",\"10\",\"2499.00\",\"\\u534e\\u4e2d\\u5730\\u533a\",\"\\u4e2a\"]]', '暂无备注', '1514550489');
INSERT INTO `w_order` VALUES ('4', 'SN2017122909362794921', '布尔', '苏州牧冬光电有限公司', '1', '采购入库', '[[\"5a470f4c59ebd\",\"\\u8363\\u8000V10\",\"10\",\"1999.00\",\"\\u534e\\u4e1c\\u4ed3\\u5e93\",\"\\u4e2a\"],[\"5a47110d39206\",\"\\u91d1\\u7acbs10\",\"10\",\"2555.00\",\"\\u897f\\u5357\\u5730\\u533a\",\"\\u4e2a\"],[\"5a4711ce77e24\",\"\\u5c0f\\u7c736\",\"10\",\"2499.00\",\"\\u534e\\u4e2d\\u5730\\u533a\",\"\\u4e2a\"]]', '暂无备注', '1514554602');
INSERT INTO `w_order` VALUES ('5', 'SN2017123012034396767', '布尔', '苏州牧冬光电有限公司', '1', '销售退货', '[[\"5a470f4c59ebd\",\"\\u8363\\u8000V10\",\"10\",\"1999.00\",\"\\u534e\\u4e1c\\u4ed3\\u5e93\",\"\\u4e2a\"],[\"5a47110d39206\",\"\\u91d1\\u7acbs10\",\"10\",\"2555.00\",\"\\u897f\\u5357\\u5730\\u533a\",\"\\u4e2a\"],[\"5a4711ce77e24\",\"\\u5c0f\\u7c736\",\"10\",\"2499.00\",\"\\u534e\\u4e2d\\u5730\\u533a\",\"\\u4e2a\"]]', '', '1514606653');
INSERT INTO `w_order` VALUES ('6', 'SN2017123012080844521', '布尔', '默认', '1', '采购入库', '[[\"5a470f4c59ebd\",\"\\u8363\\u8000V10\",\"10\",\"1999.00\",\"\\u534e\\u4e1c\\u4ed3\\u5e93\",\"\\u4e2a\"],[\"5a47110d39206\",\"\\u91d1\\u7acbs10\",\"10\",\"2555.00\",\"\\u897f\\u5357\\u5730\\u533a\",\"\\u4e2a\"],[\"5a4711ce77e24\",\"\\u5c0f\\u7c736\",\"10\",\"2499.00\",\"\\u534e\\u4e2d\\u5730\\u533a\",\"\\u4e2a\"]]', '', '1514606905');
INSERT INTO `w_order` VALUES ('9', 'SN2018010212422646979', '布尔', '苏州牧冬光电有限公司', '2', '采购出库', '[[\"5a470f4c59ebd\",\"\\u8363\\u8000V10\",\"10\",\"1999.00\",\"\\u534e\\u4e1c\\u4ed3\\u5e93\",\"\\u4e2a\"]]', '', '1514868162');
INSERT INTO `w_order` VALUES ('8', 'SN2018010109223955758', '布尔', '默认', '2', '采购出库', '[[\"5a450753a97ee\",\"\\u978b\\u5b50\",\"1\",\"5.00\",\"\\u534e\\u4e2d\\u5730\\u533a\",\"\\u7247\"]]', '', '1514812964');
INSERT INTO `w_order` VALUES ('7', 'SN2017123012112963113', '布尔', '苏州牧冬光电有限公司', '1', '采购入库', '[[\"5a470f4c59ebd\",\"\\u8363\\u8000V10\",\"10\",\"1999.00\",\"\\u534e\\u4e1c\\u4ed3\\u5e93\",\"\\u4e2a\"],[\"5a47110d39206\",\"\\u91d1\\u7acbs10\",\"10\",\"2555.00\",\"\\u897f\\u5357\\u5730\\u533a\",\"\\u4e2a\"],[\"5a4711ce77e24\",\"\\u5c0f\\u7c736\",\"10\",\"2499.00\",\"\\u534e\\u4e2d\\u5730\\u533a\",\"\\u4e2a\"]]', '', '1514607119');

-- ----------------------------
-- Table structure for w_product
-- ----------------------------
DROP TABLE IF EXISTS `w_product`;
CREATE TABLE `w_product` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(40) NOT NULL,
  `name` varchar(20) NOT NULL,
  `nbsn` varchar(40) DEFAULT NULL,
  `cjsn` varchar(40) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `storage` varchar(20) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `supplier` varchar(40) DEFAULT NULL,
  `customer` varchar(40) DEFAULT NULL,
  `spec` varchar(40) DEFAULT NULL COMMENT '规格',
  `price` decimal(10,2) unsigned DEFAULT NULL,
  `num` mediumint(9) unsigned DEFAULT NULL COMMENT '数量',
  `status` tinyint(1) unsigned DEFAULT '0',
  `desc` mediumtext,
  `add_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='产品';

-- ----------------------------
-- Records of w_product
-- ----------------------------
INSERT INTO `w_product` VALUES ('1', '5a450753a97ee', '鞋子', '', '5a450753a97ee', '数码', '华中地区', 'A区', '片', '苏州牧冬光电有限公司', '爱美克空气过滤器', '', '5.00', '14', '0', '111', '1514473336');
INSERT INTO `w_product` VALUES ('2', '5a45c671401ec', '产品1', '', '5a45c671401ec', '手机', '西北仓库', 'A区', '箱', '苏州牧冬光电有限公司', '爱美克空气过滤器', '', '10.00', '10', '0', '', '1514522247');
INSERT INTO `w_product` VALUES ('3', '5a4644bcb7ec1', '服装', '', '5a4644bcb7ec1', '服装', '华东仓库', 'B区', '箱', '苏州牧冬光电有限公司', '爱美克空气过滤器', '', '0.00', '7', '0', '', '1514554572');
INSERT INTO `w_product` VALUES ('4', '5a470f4c59ebd', '荣耀V10', '', '5a470f4c59ebd', '手机', '华东仓库', 'B区', '个', '苏州牧冬光电有限公司', '爱美克空气过滤器', '', '1999.00', '8', '0', '', '1514606441');
INSERT INTO `w_product` VALUES ('5', '5a47110d39206', '金立s10', '', '5a47110d39206', '手机', '西南地区', 'B区', '个', '苏州牧冬光电有限公司', '爱美克空气过滤器', '', '2555.00', '15', '0', '', '1514606883');
INSERT INTO `w_product` VALUES ('6', '5a4711ce77e24', '小米6', '', '5a4711ce77e24', '手机', '华中地区', 'B区', '个', '苏州牧冬光电有限公司', '爱美克空气过滤器', '', '2499.00', '10', '0', '', '1514607078');

-- ----------------------------
-- Table structure for w_storage
-- ----------------------------
DROP TABLE IF EXISTS `w_storage`;
CREATE TABLE `w_storage` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(40) NOT NULL COMMENT '编号',
  `name` varchar(40) NOT NULL COMMENT '名字',
  `contact` varchar(16) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `desc` mediumtext,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态： 0正常 1禁用',
  `address` varchar(40) DEFAULT NULL,
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `sn` (`sn`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='仓库管理';

-- ----------------------------
-- Records of w_storage
-- ----------------------------
INSERT INTO `w_storage` VALUES ('1', 'SN2017122704154711343', '华东仓库', '布尔', '17052850083', '华东仓库', '0', '江苏省苏州市', '1514349093');
INSERT INTO `w_storage` VALUES ('2', 'SN2017122704160191249', '华北仓库', '测试', '15052850085', '华北仓库', '0', '山东省青岛市城阳区', '1514350644');
INSERT INTO `w_storage` VALUES ('3', 'SN2017122704163071894', '华南仓库', '阿德民', '18101565682', '华南仓库', '0', '广东省广州市天河区车陂', '1514351327');
INSERT INTO `w_storage` VALUES ('4', 'SN2017122704163675950', '东北仓库', '马云', '15069900798', '东北仓库', '0', '黑龙江省哈尔滨市', '1514351479');
INSERT INTO `w_storage` VALUES ('5', 'SN2017122704165667035', '西北仓库', '秦始皇', '17052850085', '西北仓库', '0', '陕西省西安市大雁区', '1514351552');
INSERT INTO `w_storage` VALUES ('6', 'SN2017122704171789530', '华中地区', '无名', '17052850083', '华中地区', '0', '湖北省武汉市汉口区', '1514351653');
INSERT INTO `w_storage` VALUES ('7', 'SN2017122704172619176', '西南地区', '张杰', '17052850086', '西南地区', '0', '四川省成都市', '1514351716');

-- ----------------------------
-- Table structure for w_supplier
-- ----------------------------
DROP TABLE IF EXISTS `w_supplier`;
CREATE TABLE `w_supplier` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `address` varchar(40) NOT NULL,
  `desc` mediumtext,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `sn` (`sn`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='供应商';

-- ----------------------------
-- Records of w_supplier
-- ----------------------------
INSERT INTO `w_supplier` VALUES ('1', '5a44a4f6f1f18', '苏州牧冬光电有限公司', '测试', '15069900798', '30024167@qq.com', '15069900798', '江苏省苏州市长阳街', '苏州牧冬光电有限公司...', '0', '1514448252');

-- ----------------------------
-- Table structure for w_unit
-- ----------------------------
DROP TABLE IF EXISTS `w_unit`;
CREATE TABLE `w_unit` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `desc` mediumtext,
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_unit
-- ----------------------------
INSERT INTO `w_unit` VALUES ('1', '箱', '0', '箱', '1514454975');
INSERT INTO `w_unit` VALUES ('2', '个', '0', '', '1514455204');
INSERT INTO `w_unit` VALUES ('3', '包', '0', '', '1514455226');
INSERT INTO `w_unit` VALUES ('4', '片', '0', '', '1514455232');

-- ----------------------------
-- Table structure for w_user
-- ----------------------------
DROP TABLE IF EXISTS `w_user`;
CREATE TABLE `w_user` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `phone` varchar(12) DEFAULT NULL COMMENT '手机号',
  `eamil` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `truename` varchar(16) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0:正常 1:禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of w_user
-- ----------------------------
INSERT INTO `w_user` VALUES ('1', 'bool', '21232f297a57a5a743894a0e4a801fc3', '17052850083', '30024167', '布尔', '0');
INSERT INTO `w_user` VALUES ('2', 'admin', '21232f297a57a5a743894a0e4a801fc3', '17052850083', '30024167', '管理员', '0');
