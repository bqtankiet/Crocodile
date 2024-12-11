/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MariaDB
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : crocodile

 Target Server Type    : MariaDB
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 12/12/2024 02:21:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Ví Nam', NULL, 1);
INSERT INTO `categories` VALUES (2, 'Ví Nữ', NULL, 1);
INSERT INTO `categories` VALUES (3, 'Túi Xách Nam', NULL, 1);
INSERT INTO `categories` VALUES (4, 'Túi Xách Nữ', NULL, 1);
INSERT INTO `categories` VALUES (5, 'Túi Đeo Chéo', NULL, 1);
INSERT INTO `categories` VALUES (6, 'Balo', NULL, 1);
INSERT INTO `categories` VALUES (7, 'Vali', NULL, 1);
INSERT INTO `categories` VALUES (8, 'Thắt Lưng', NULL, 1);
INSERT INTO `categories` VALUES (9, 'Áo Khoác', NULL, 1);
INSERT INTO `categories` VALUES (10, 'Giày Tây', NULL, 1);
INSERT INTO `categories` VALUES (11, 'Giày Cao Gót', NULL, 1);
INSERT INTO `categories` VALUES (12, 'Dép', NULL, 1);
INSERT INTO `categories` VALUES (13, 'Phụ Kiện', NULL, 1);
INSERT INTO `categories` VALUES (14, 'Danh Mục Khác', NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
