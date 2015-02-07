/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : dhdc

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-02-07 13:37:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_set_time
-- ----------------------------
DROP TABLE IF EXISTS `sys_set_time`;
CREATE TABLE `sys_set_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_time` varchar(255) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_set_time
-- ----------------------------
INSERT INTO `sys_set_time` VALUES ('1', '01:00:00', '9');
