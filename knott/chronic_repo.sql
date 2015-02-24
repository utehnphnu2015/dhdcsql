/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50541
Source Host           : 127.0.0.1:3306
Source Database       : dhdc

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2015-02-24 15:17:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for chronic_repo
-- ----------------------------
DROP TABLE IF EXISTS `chronic_repo`;
CREATE TABLE `chronic_repo` (
  `HOSPCODE` varchar(5) NOT NULL,
  `PID` varchar(15) NOT NULL,
  `DATE_DIAG` date NOT NULL COMMENT 'วันเดือนปีที่ตรวจพบครั้งแรก',
  `CHRONIC` varchar(6) NOT NULL,
  `HOSP_DX` varchar(5) NOT NULL COMMENT 'รหัสสถานพยาบาลที่วินิจฉัยครั้งแรก',
  `HOSP_RX` varchar(5) DEFAULT NULL COMMENT 'รหัสสถานพยาบาลที่ไปรับบริการ',
  `DATE_DISCH` date NOT NULL,
  `TYPEDISCH` varchar(2) NOT NULL,
  `D_UPDATE` datetime NOT NULL,
  `BG_YEAR` varchar(4) NOT NULL,
  PRIMARY KEY (`HOSPCODE`,`PID`,`CHRONIC`),
  KEY `idx1` (`HOSPCODE`,`PID`),
  KEY `idx2` (`CHRONIC`),
  KEY `idx3` (`DATE_DIAG`),
  KEY `idx4` (`HOSP_DX`),
  KEY `idx5` (`HOSP_RX`),
  KEY `idx6` (`DATE_DISCH`),
  KEY `idx7` (`TYPEDISCH`),
  KEY `idx8` (`HOSPCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
