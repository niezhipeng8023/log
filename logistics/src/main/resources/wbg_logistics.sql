/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : wbg_logistics

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2019-12-29 16:08:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `a_account` varchar(50) DEFAULT NULL COMMENT '账号',
  `a_password` varchar(50) DEFAULT NULL COMMENT '密码',
  `a_rank` varchar(8) DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '123456', '123456', '最高管理');
INSERT INTO `admin` VALUES ('2', '456789', '456789', '普通管理');

-- ----------------------------
-- Table structure for depart
-- ----------------------------
DROP TABLE IF EXISTS `depart`;
CREATE TABLE `depart` (
  `staff_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `staff_name` varchar(50) DEFAULT NULL COMMENT '员工姓名',
  `gender` char(2) DEFAULT NULL COMMENT '性别',
  `birthhday` datetime DEFAULT NULL COMMENT '出生日期',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机号码',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `dedpart_no` int(11) DEFAULT NULL COMMENT '部门',
  `firm_no` int(11) DEFAULT NULL COMMENT '公司',
  PRIMARY KEY (`staff_no`),
  KEY `dedpart_no` (`dedpart_no`),
  KEY `firm_no` (`firm_no`),
  CONSTRAINT `depart_ibfk_1` FOREIGN KEY (`dedpart_no`) REFERENCES `dispatch` (`depart_no`),
  CONSTRAINT `depart_ibfk_2` FOREIGN KEY (`firm_no`) REFERENCES `firm` (`firm_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of depart
-- ----------------------------
INSERT INTO `depart` VALUES ('1', '李晓辉', '男', '1998-09-03 00:00:00', '13879458134', 'passweiuasf', '1', '2');
INSERT INTO `depart` VALUES ('2', '刘亦菲', '女', '1966-10-12 00:00:00', '15484258134', 'paliuyif', '2', '1');
INSERT INTO `depart` VALUES ('3', '张小龙', '男', '1933-11-04 00:00:00', '15444458134', 'paliuyif', '2', '2');
INSERT INTO `depart` VALUES ('4', '李萌萌', '男', '1983-02-08 00:00:00', '14564458134', 'pas456456f', '1', '3');
INSERT INTO `depart` VALUES ('5', '小小小', '男', '2019-12-31 00:00:00', '18177702451', '123456', '1', '1');

-- ----------------------------
-- Table structure for diaodu
-- ----------------------------
DROP TABLE IF EXISTS `diaodu`;
CREATE TABLE `diaodu` (
  `dis_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `staff_no` int(11) DEFAULT NULL COMMENT '员工编号',
  `license` varchar(50) DEFAULT NULL COMMENT '车牌号',
  `waybill_no` varchar(50) DEFAULT NULL COMMENT '运单号',
  PRIMARY KEY (`dis_id`),
  KEY `license` (`license`),
  KEY `waybill_no` (`waybill_no`),
  KEY `staff_no` (`staff_no`),
  CONSTRAINT `diaodu_ibfk_1` FOREIGN KEY (`license`) REFERENCES `vehicle` (`license`),
  CONSTRAINT `diaodu_ibfk_2` FOREIGN KEY (`waybill_no`) REFERENCES `waybill` (`waybill_no`),
  CONSTRAINT `diaodu_ibfk_3` FOREIGN KEY (`staff_no`) REFERENCES `depart` (`staff_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diaodu
-- ----------------------------
INSERT INTO `diaodu` VALUES ('1', '1', '泸A12234', '201804055546');

-- ----------------------------
-- Table structure for dispatch
-- ----------------------------
DROP TABLE IF EXISTS `dispatch`;
CREATE TABLE `dispatch` (
  `depart_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `depart_name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  PRIMARY KEY (`depart_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dispatch
-- ----------------------------
INSERT INTO `dispatch` VALUES ('1', '财务部');
INSERT INTO `dispatch` VALUES ('2', '运输部');
INSERT INTO `dispatch` VALUES ('3', '信息部');
INSERT INTO `dispatch` VALUES ('4', '人力部');

-- ----------------------------
-- Table structure for firm
-- ----------------------------
DROP TABLE IF EXISTS `firm`;
CREATE TABLE `firm` (
  `firm_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `firm_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  PRIMARY KEY (`firm_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of firm
-- ----------------------------
INSERT INTO `firm` VALUES ('1', '上海电院物流上海分公司');
INSERT INTO `firm` VALUES ('2', '上海电院物流深圳分公司');
INSERT INTO `firm` VALUES ('3', '上海电院物流珠海分公司');
INSERT INTO `firm` VALUES ('4', '上海电院物流珠江分公司');

-- ----------------------------
-- Table structure for infro
-- ----------------------------
DROP TABLE IF EXISTS `infro`;
CREATE TABLE `infro` (
  `infro_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `contents` text COMMENT '内容',
  `i_time` datetime DEFAULT NULL COMMENT '时间',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`infro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infro
-- ----------------------------
INSERT INTO `infro` VALUES ('1', '暂时没有什么内容', '2019-12-28 16:14:24', '关于元旦放假');

-- ----------------------------
-- Table structure for positions
-- ----------------------------
DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions` (
  `pos_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '货运单',
  `waybill_no` varchar(50) DEFAULT NULL COMMENT '运单号',
  `p_time` datetime DEFAULT NULL COMMENT '时间',
  `p_position` varchar(50) DEFAULT NULL COMMENT '位置',
  PRIMARY KEY (`pos_id`),
  KEY `waybill_no` (`waybill_no`),
  CONSTRAINT `positions_ibfk_1` FOREIGN KEY (`waybill_no`) REFERENCES `waybill` (`waybill_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of positions
-- ----------------------------
INSERT INTO `positions` VALUES ('1', '201878987879', '2019-12-28 16:14:25', '广东省珠海市斗门区揽收');
INSERT INTO `positions` VALUES ('2', '201878987879', '2019-12-28 16:14:25', '正在发往深圳市');

-- ----------------------------
-- Table structure for route
-- ----------------------------
DROP TABLE IF EXISTS `route`;
CREATE TABLE `route` (
  `route_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `route_name` varchar(200) DEFAULT NULL COMMENT '路线名称',
  `staff_no` int(11) DEFAULT NULL COMMENT '员工编号',
  PRIMARY KEY (`route_no`),
  KEY `staff_no` (`staff_no`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`staff_no`) REFERENCES `depart` (`staff_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of route
-- ----------------------------
INSERT INTO `route` VALUES ('1', '广东茂名-广东珠海', '2');
INSERT INTO `route` VALUES ('2', '广东茂名-广东深圳', '1');

-- ----------------------------
-- Table structure for vehicle
-- ----------------------------
DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle` (
  `license` varchar(50) NOT NULL COMMENT '车牌号',
  `v_type` varchar(10) DEFAULT NULL COMMENT '品牌',
  `vload` int(11) DEFAULT NULL COMMENT '载重',
  `staff_no` int(11) DEFAULT NULL COMMENT '员工编号',
  PRIMARY KEY (`license`),
  KEY `staff_no` (`staff_no`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`staff_no`) REFERENCES `depart` (`staff_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vehicle
-- ----------------------------
INSERT INTO `vehicle` VALUES ('泸A12234', '中联重科', '60', '3');
INSERT INTO `vehicle` VALUES ('泸A66666', '老师莱斯', '2', '1');
INSERT INTO `vehicle` VALUES ('泸A88462', '一汽重卡', '70', '1');

-- ----------------------------
-- Table structure for waybill
-- ----------------------------
DROP TABLE IF EXISTS `waybill`;
CREATE TABLE `waybill` (
  `waybill_no` varchar(50) NOT NULL COMMENT '运单号',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  `unit` varchar(5) DEFAULT NULL COMMENT '单位',
  `s_pro` varchar(50) DEFAULT NULL COMMENT '起始省份',
  `s_city` varchar(50) DEFAULT NULL COMMENT '起始城市',
  `e_pro` varchar(50) DEFAULT NULL COMMENT '目的省份',
  `e_city` varchar(50) DEFAULT NULL COMMENT '目的城市',
  `s_name` varchar(50) DEFAULT NULL COMMENT '发件人姓名',
  `s_phone` varchar(50) DEFAULT NULL COMMENT '发件人手机',
  `s_address` varchar(100) DEFAULT NULL COMMENT '发件人地址',
  `r_name` varchar(20) DEFAULT NULL COMMENT '收件的姓名',
  `r_phone` varchar(50) DEFAULT NULL COMMENT '收件人手机',
  `r_address` varchar(100) DEFAULT NULL COMMENT '收件的地址',
  PRIMARY KEY (`waybill_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waybill
-- ----------------------------
INSERT INTO `waybill` VALUES ('201804055546', '1', '个', '江苏', '南京', '湛江', '杭州', '韦邦杠', '18776203778', '广东省珠海市南方IT学院', '小妹妹', '16482464688', '广东省佛山市顺德区AA村');
INSERT INTO `waybill` VALUES ('201878987879', '20', '个', '广东', '珠海', '广东', '深圳', '黄心眼', '18656203778', '广东省珠海市南方IT学院', '熊邦阁', '18978978978', '广东省深圳市小乱说的');
