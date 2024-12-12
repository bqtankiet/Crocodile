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

 Date: 12/12/2024 18:22:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carousels
-- ----------------------------
DROP TABLE IF EXISTS `carousels`;
CREATE TABLE `carousels`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carousels
-- ----------------------------
INSERT INTO `carousels` VALUES (1, 'Đẳng cấp và sang trọng', 'Túi xách da cá sấu cao cấp, điểm nhấn hoàn hảo cho phong cách của bạn. Khám phá bộ sưu tập mới nhất tại cửa hàng của chúng tôi!', 'carousel1.webp', 'https://www.kwanpen.com/cdn/shop/files/WEB_BANNER_24_05c9b547-c32b-4bb2-b4f4-aa1bb8f1456c_1400x.jpg?v=1703841410', 1);
INSERT INTO `carousels` VALUES (2, 'Thời thượng và quý phái ', 'Túi xách da cá sấu cao cấp, điểm nhấn hoàn hảo cho phong cách của bạn. Khám phá bộ sưu tập mới nhất tại cửa hàng của chúng tôi!', 'carousel2.webp', 'https://www.kwanpen.com/cdn/shop/files/website_sub_banner_raffles_1400x.jpg?v=1672822845', 1);
INSERT INTO `carousels` VALUES (3, 'Cao cấp và chất lượng', 'Túi xách da cá sấu cao cấp, điểm nhấn hoàn hảo cho phong cách của bạn. Khám phá bộ sưu tập mới nhất tại cửa hàng của chúng tôi!', 'carousel3.webp', 'https://www.kwanpen.com/cdn/shop/files/July_Banner_Crest_Collection_web_1400x.jpg?v=1691053629', 1);

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
INSERT INTO `categories` VALUES (1, 'Ví Nam', 'wallet-icon.png', 1);
INSERT INTO `categories` VALUES (2, 'Ví Nữ', 'purse.png', 1);
INSERT INTO `categories` VALUES (3, 'Túi Xách Nam', 'briefcase-line-icon.png', 1);
INSERT INTO `categories` VALUES (4, 'Túi Xách Nữ', 'handbag.png', 1);
INSERT INTO `categories` VALUES (5, 'Túi Đeo Chéo', 'sling-bag.png', 1);
INSERT INTO `categories` VALUES (6, 'Balo', 'backpack-icon.png', 1);
INSERT INTO `categories` VALUES (7, 'Vali', 'tourist-bag-icon.png', 1);
INSERT INTO `categories` VALUES (8, 'Thắt Lưng', 'man-belt-icon.png', 1);
INSERT INTO `categories` VALUES (9, 'Áo Khoác', 'aokhoacda.png', 1);
INSERT INTO `categories` VALUES (10, 'Giày Tây', 'man-shoe-icon.png', 1);
INSERT INTO `categories` VALUES (11, 'Giày Cao Gót', 'high-heels-128.webp', 1);
INSERT INTO `categories` VALUES (12, 'Dép', 'male-shoes-128.png', 1);
INSERT INTO `categories` VALUES (13, 'Phụ Kiện', 'smartwatch-icon.png', 1);
INSERT INTO `categories` VALUES (14, 'Danh Mục Khác', '3dot-icon.png', 1);

SET FOREIGN_KEY_CHECKS = 1;
