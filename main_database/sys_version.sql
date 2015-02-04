/*
Navicat MySQL Data Transfer

Source Server         : localhost:3307
Source Server Version : 50540
Source Host           : localhost:3307
Source Database       : dhdc

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2015-02-03 22:33:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_version
-- ----------------------------
DROP TABLE IF EXISTS `sys_version`;
CREATE TABLE `sys_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `frontend` varchar(255) DEFAULT NULL,
  `backend` varchar(255) DEFAULT NULL,
  `database` varchar(255) DEFAULT NULL,
  `note1` varchar(255) DEFAULT NULL,
  `note2` varchar(255) DEFAULT NULL,
  `note3` varchar(255) DEFAULT NULL,
  `note4` varchar(255) DEFAULT NULL,
  `note5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_version
-- ----------------------------
INSERT INTO `sys_version` VALUES ('1', '20150131', '20150131', '20150131', 'ไทย', null, null, null, null);
