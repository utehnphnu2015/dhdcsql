/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : dhdc

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-02-06 21:42:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_month
-- ----------------------------
DROP TABLE IF EXISTS `sys_month`;
CREATE TABLE `sys_month` (
  `month` varchar(6) NOT NULL,
  PRIMARY KEY (`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_month
-- ----------------------------
INSERT INTO `sys_month` VALUES ('201310');
INSERT INTO `sys_month` VALUES ('201311');
INSERT INTO `sys_month` VALUES ('201312');
INSERT INTO `sys_month` VALUES ('201401');
INSERT INTO `sys_month` VALUES ('201402');
INSERT INTO `sys_month` VALUES ('201403');
INSERT INTO `sys_month` VALUES ('201404');
INSERT INTO `sys_month` VALUES ('201405');
INSERT INTO `sys_month` VALUES ('201406');
INSERT INTO `sys_month` VALUES ('201407');
INSERT INTO `sys_month` VALUES ('201408');
INSERT INTO `sys_month` VALUES ('201409');
INSERT INTO `sys_month` VALUES ('201410');
INSERT INTO `sys_month` VALUES ('201411');
INSERT INTO `sys_month` VALUES ('201412');
INSERT INTO `sys_month` VALUES ('201501');
INSERT INTO `sys_month` VALUES ('201502');
INSERT INTO `sys_month` VALUES ('201503');
INSERT INTO `sys_month` VALUES ('201504');
INSERT INTO `sys_month` VALUES ('201505');
INSERT INTO `sys_month` VALUES ('201506');
INSERT INTO `sys_month` VALUES ('201507');
INSERT INTO `sys_month` VALUES ('201508');
INSERT INTO `sys_month` VALUES ('201509');
