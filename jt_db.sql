/*
 Navicat Premium Data Transfer

 Source Server         : mariadb
 Source Server Type    : MySQL
 Source Server Version : 100307
 Source Host           : localhost:3306
 Source Schema         : jt_db

 Target Server Type    : MySQL
 Target Server Version : 100307
 File Encoding         : 65001

 Date: 07/06/2020 12:21:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `userid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`, `productid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 5, 1);
INSERT INTO `cart` VALUES (1, 6, 1);
INSERT INTO `cart` VALUES (4, 4, 1);
INSERT INTO `cart` VALUES (4, 5, 1);
INSERT INTO `cart` VALUES (4, 6, 1);
INSERT INTO `cart` VALUES (9, 4, 1);
INSERT INTO `cart` VALUES (9, 5, 2);
INSERT INTO `cart` VALUES (9, 6, 1);
INSERT INTO `cart` VALUES (10, 6, 6);

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` decimal(10, 2) DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES (4, '【新品现货】锤子(smartisan) 坚果 Pro3 智能识别拍照手机 骁龙855锤子坚果手机 12+256 绿色 双卡双待', 3599.00, 'c3a6229fcbc9c907.jpg');
INSERT INTO `commodity` VALUES (5, '东家菜', 39.10, '1fec724485e437e4.jpg');
INSERT INTO `commodity` VALUES (6, '戴尔DELL游匣G3 15.6英寸英特尔酷睿i7游戏笔记本电脑(i7-9750H 8G 512G GTX1660TiMQ 6G 2年整机上门)', 9999.00, '1acfea8c6d4a1f87.jpg');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES (1, 'wangshili', '123456');
INSERT INTO `userinfo` VALUES (10, '我是傻逼', '123456');

SET FOREIGN_KEY_CHECKS = 1;
