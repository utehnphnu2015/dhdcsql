/*
Navicat MySQL Data Transfer

Source Server         : localhost:3307
Source Server Version : 50540
Source Host           : localhost:3307
Source Database       : dhdc

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2015-02-04 10:19:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_count_all
-- ----------------------------
DROP TABLE IF EXISTS `sys_count_all`;
CREATE TABLE `sys_count_all` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hospcode` varchar(255) DEFAULT NULL,
  `month` varchar(6) DEFAULT NULL,
  `person` int(11) DEFAULT NULL,
  `address` int(11) DEFAULT NULL,
  `death` int(255) DEFAULT NULL,
  `chronic` int(255) DEFAULT NULL,
  `card` int(255) DEFAULT NULL,
  `home` int(255) DEFAULT NULL,
  `village` int(255) DEFAULT NULL,
  `disability` int(255) DEFAULT NULL,
  `provider` int(255) DEFAULT NULL,
  `women` int(255) DEFAULT NULL,
  `drugallergy` int(255) DEFAULT NULL,
  `functional` int(255) DEFAULT NULL,
  `icf` int(255) DEFAULT NULL,
  `service` int(255) DEFAULT NULL,
  `diagnosis_opd` int(255) DEFAULT NULL,
  `drug_opd` int(255) DEFAULT NULL,
  `procedure_opd` int(255) DEFAULT NULL,
  `charge_opd` int(255) DEFAULT NULL,
  `surveillance` int(255) DEFAULT NULL,
  `accident` int(255) DEFAULT NULL,
  `labfu` int(255) DEFAULT NULL,
  `chronicfu` int(255) DEFAULT NULL,
  `admission` int(255) DEFAULT NULL,
  `diagnosis_ipd` int(255) DEFAULT NULL,
  `drug_ipd` int(255) DEFAULT NULL,
  `procedure_ipd` int(255) DEFAULT NULL,
  `charge_ipd` int(255) DEFAULT NULL,
  `appointment` int(255) DEFAULT NULL,
  `dental` int(255) DEFAULT NULL,
  `rehabilitation` int(255) DEFAULT NULL,
  `ncdscreen` int(255) DEFAULT NULL,
  `fp` int(255) DEFAULT NULL,
  `prenatal` int(255) DEFAULT NULL,
  `anc` int(255) DEFAULT NULL,
  `labor` int(255) DEFAULT NULL,
  `postnatal` int(255) DEFAULT NULL,
  `newborn` int(255) DEFAULT NULL,
  `newborn_care` int(255) DEFAULT NULL,
  `epi` int(255) DEFAULT NULL,
  `nutrition` int(255) DEFAULT NULL,
  `specialpp` int(255) DEFAULT NULL,
  `community_activity` int(255) DEFAULT NULL,
  `community_service` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
