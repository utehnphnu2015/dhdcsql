/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50541
Source Host           : localhost:3306
Source Database       : dhdc

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2015-02-17 11:13:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_month
-- ----------------------------
DROP TABLE IF EXISTS `sys_month`;
CREATE TABLE `sys_month` (
  `month` varchar(6) NOT NULL,
  `selyear` varchar(4) DEFAULT NULL,
  `selmonth` varchar(2) DEFAULT NULL,
  `month_th` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_month
-- ----------------------------
INSERT INTO `sys_month` VALUES ('201310', '2557', '10', 'ตุลาคม');
INSERT INTO `sys_month` VALUES ('201311', '2557', '11', 'พฤศจิกายน');
INSERT INTO `sys_month` VALUES ('201312', '2557', '12', 'ธันวาคม');
INSERT INTO `sys_month` VALUES ('201401', '2557', '01', 'มกราคม');
INSERT INTO `sys_month` VALUES ('201402', '2557', '02', 'กุมภาพันธ์');
INSERT INTO `sys_month` VALUES ('201403', '2557', '03', 'มีนาคม');
INSERT INTO `sys_month` VALUES ('201404', '2557', '04', 'เมษายน');
INSERT INTO `sys_month` VALUES ('201405', '2557', '05', 'พฤษภาคม');
INSERT INTO `sys_month` VALUES ('201406', '2557', '06', 'มิถุนายน');
INSERT INTO `sys_month` VALUES ('201407', '2557', '07', 'กรกฎาคม');
INSERT INTO `sys_month` VALUES ('201408', '2557', '08', 'สิงหาคม');
INSERT INTO `sys_month` VALUES ('201409', '2557', '09', 'กันยายน');
INSERT INTO `sys_month` VALUES ('201410', '2558', '10', 'ตุลาคม');
INSERT INTO `sys_month` VALUES ('201411', '2558', '11', 'พฤศจิกายน');
INSERT INTO `sys_month` VALUES ('201412', '2558', '12', 'ธันวาคม');
INSERT INTO `sys_month` VALUES ('201501', '2558', '01', 'มกราคม');
INSERT INTO `sys_month` VALUES ('201502', '2558', '02', 'กุมภาพันธ์');
INSERT INTO `sys_month` VALUES ('201503', '2558', '03', 'มีนาคม');
INSERT INTO `sys_month` VALUES ('201504', '2558', '04', 'เมษายน');
INSERT INTO `sys_month` VALUES ('201505', '2558', '06', 'พฤษภาคม');
INSERT INTO `sys_month` VALUES ('201506', '2558', '06', 'มิถุนายน');
INSERT INTO `sys_month` VALUES ('201507', '2668', '07', 'กรกฎาคม');
INSERT INTO `sys_month` VALUES ('201508', '2558', '08', 'สิงหาคม');
INSERT INTO `sys_month` VALUES ('201509', '2558', '09', 'กันยายน');
