/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : dhdc

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-02-04 16:06:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_files
-- ----------------------------
DROP TABLE IF EXISTS `sys_files`;
CREATE TABLE `sys_files` (
  `file_name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_files
-- ----------------------------
INSERT INTO `sys_files` VALUES ('person');
INSERT INTO `sys_files` VALUES ('address');
INSERT INTO `sys_files` VALUES ('death');
INSERT INTO `sys_files` VALUES ('chronic');
INSERT INTO `sys_files` VALUES ('card');
INSERT INTO `sys_files` VALUES ('home');
INSERT INTO `sys_files` VALUES ('village');
INSERT INTO `sys_files` VALUES ('disability');
INSERT INTO `sys_files` VALUES ('provider');
INSERT INTO `sys_files` VALUES ('women');
INSERT INTO `sys_files` VALUES ('drugallergy');
INSERT INTO `sys_files` VALUES ('functional');
INSERT INTO `sys_files` VALUES ('icf');
INSERT INTO `sys_files` VALUES ('service');
INSERT INTO `sys_files` VALUES ('diagnosis_opd');
INSERT INTO `sys_files` VALUES ('drug_opd');
INSERT INTO `sys_files` VALUES ('procedure_opd');
INSERT INTO `sys_files` VALUES ('charge_opd');
INSERT INTO `sys_files` VALUES ('surveillance');
INSERT INTO `sys_files` VALUES ('accident');
INSERT INTO `sys_files` VALUES ('labfu');
INSERT INTO `sys_files` VALUES ('chronicfu');
INSERT INTO `sys_files` VALUES ('admission');
INSERT INTO `sys_files` VALUES ('diagnosis_ipd');
INSERT INTO `sys_files` VALUES ('drug_ipd');
INSERT INTO `sys_files` VALUES ('procedure_ipd');
INSERT INTO `sys_files` VALUES ('charge_ipd');
INSERT INTO `sys_files` VALUES ('appointment');
INSERT INTO `sys_files` VALUES ('dental');
INSERT INTO `sys_files` VALUES ('rehabilitation');
INSERT INTO `sys_files` VALUES ('ncdscreen');
INSERT INTO `sys_files` VALUES ('fp');
INSERT INTO `sys_files` VALUES ('prenatal');
INSERT INTO `sys_files` VALUES ('anc');
INSERT INTO `sys_files` VALUES ('labor');
INSERT INTO `sys_files` VALUES ('postnatal');
INSERT INTO `sys_files` VALUES ('newborn');
INSERT INTO `sys_files` VALUES ('newborn_care');
INSERT INTO `sys_files` VALUES ('epi');
INSERT INTO `sys_files` VALUES ('nutrition');
INSERT INTO `sys_files` VALUES ('specialpp');
INSERT INTO `sys_files` VALUES ('community_activity');
INSERT INTO `sys_files` VALUES ('community_service');
