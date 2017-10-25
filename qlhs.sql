/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : qlhs

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2017-10-25 21:20:11
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `chinhanh`
-- ----------------------------
DROP TABLE IF EXISTS `chinhanh`;
CREATE TABLE `chinhanh` (
  `IDCN` char(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `TenCN` varchar(50) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `DiaChi` varchar(100) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`IDCN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- ----------------------------
-- Records of chinhanh
-- ----------------------------

-- ----------------------------
-- Table structure for `hocsinh`
-- ----------------------------
DROP TABLE IF EXISTS `hocsinh`;
CREATE TABLE `hocsinh` (
  `IDHS` char(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `IDPH` char(10) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `IDPhong` char(10) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TenHS` varchar(30) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `DiaChi` varchar(50) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `NgayNhapHoc` datetime DEFAULT NULL,
  PRIMARY KEY (`IDHS`),
  KEY `fk_phong` (`IDPhong`),
  KEY `fk_phuhuynh` (`IDPH`),
  CONSTRAINT `fk_phong` FOREIGN KEY (`IDPhong`) REFERENCES `phong` (`IDPhong`),
  CONSTRAINT `fk_phuhuynh` FOREIGN KEY (`IDPH`) REFERENCES `phuhuynh` (`IDPH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- ----------------------------
-- Records of hocsinh
-- ----------------------------

-- ----------------------------
-- Table structure for `khoi`
-- ----------------------------
DROP TABLE IF EXISTS `khoi`;
CREATE TABLE `khoi` (
  `IDKhoi` char(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `TenKhoi` varchar(50) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `IDCN` char(10) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`IDKhoi`),
  KEY `fk_chinhanh` (`IDCN`),
  CONSTRAINT `fk_chinhanh` FOREIGN KEY (`IDCN`) REFERENCES `chinhanh` (`IDCN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- ----------------------------
-- Records of khoi
-- ----------------------------

-- ----------------------------
-- Table structure for `lop`
-- ----------------------------
DROP TABLE IF EXISTS `lop`;
CREATE TABLE `lop` (
  `IDLop` char(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `TenLop` varchar(20) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `IDKhoi` char(10) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`IDLop`),
  KEY `fk_khoi` (`IDKhoi`),
  CONSTRAINT `fk_khoi` FOREIGN KEY (`IDKhoi`) REFERENCES `khoi` (`IDKhoi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- ----------------------------
-- Records of lop
-- ----------------------------

-- ----------------------------
-- Table structure for `phong`
-- ----------------------------
DROP TABLE IF EXISTS `phong`;
CREATE TABLE `phong` (
  `IDPhong` char(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `TenPhong` varchar(20) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `IDLop` char(10) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`IDPhong`),
  KEY `fk_lop` (`IDLop`),
  CONSTRAINT `fk_lop` FOREIGN KEY (`IDLop`) REFERENCES `lop` (`IDLop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- ----------------------------
-- Records of phong
-- ----------------------------

-- ----------------------------
-- Table structure for `phuhuynh`
-- ----------------------------
DROP TABLE IF EXISTS `phuhuynh`;
CREATE TABLE `phuhuynh` (
  `IDPH` char(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `TenPH` varchar(30) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `SDT` int(11) DEFAULT NULL,
  `Password` varchar(30) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`IDPH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- ----------------------------
-- Records of phuhuynh
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `SDT` int(11) NOT NULL,
  `Password` varchar(30) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `Role` char(8) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`SDT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
