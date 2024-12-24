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

 Date: 19/12/2024 00:27:46
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

-- ----------------------------
-- Table structure for product_details
-- ----------------------------
DROP TABLE IF EXISTS `product_details`;
CREATE TABLE `product_details`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProduct` int(10) UNSIGNED NULL DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_details-products`(`idProduct`) USING BTREE,
  CONSTRAINT `fk_product_details-products` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_details
-- ----------------------------
INSERT INTO `product_details` VALUES (1, 1, 'Kích thước\r\n', '11 cm (dài) x 9,5 cm (cao)\r\n');
INSERT INTO `product_details` VALUES (2, 1, 'Chất liệu\r\n', 'Da cá sấu Thái Lan mặt ngoài, mặt trong da bò Italy\r\n');
INSERT INTO `product_details` VALUES (3, 1, 'Cam kết\r\n', 'Cam kết hoàn tiền lại nếu sản phẩm không phải da cá sấu và không giống như hình chụp.\r\n');
INSERT INTO `product_details` VALUES (4, 1, 'Thương hiệu\r\n', 'Gento\r\n');
INSERT INTO `product_details` VALUES (5, 2, 'Chất liệu', 'Da cá sấu mặt ngoài, mặt trong da bò');
INSERT INTO `product_details` VALUES (6, 2, 'Loại đế', 'Đế cao su');
INSERT INTO `product_details` VALUES (7, 2, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_details` VALUES (8, 2, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_details` VALUES (9, 2, 'Cam kết', 'Cam kết hoàn tiền lại nếu sản phẩm không phải da cá sấu và không giống như hình chụp.\r\nCam kết hoàn tiền 100% nếu sản phẩm không phải da cá sấu');
INSERT INTO `product_details` VALUES (10, 3, 'Kích thước', '20cm (dài) x 16.5cm (cao) x 12cm (rộng)');
INSERT INTO `product_details` VALUES (11, 3, 'Chất liệu', 'Da cá sấu Thái Lan');
INSERT INTO `product_details` VALUES (12, 3, 'Cam kết', 'Cam kết hoàn tiền lại nếu túi xách không phải là da cá sấu và không giống như hình chụp.');
INSERT INTO `product_details` VALUES (13, 3, 'Thương hiệu', 'Gento');

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProduct` int(10) UNSIGNED NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_images-products`(`idProduct`) USING BTREE,
  CONSTRAINT `fk_product_images-products` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_images
-- ----------------------------
INSERT INTO `product_images` VALUES (1, 1, 'https://www.gento.vn/wp-content/uploads/2024/07/vi-nam-da-ca-sau8.jpg');
INSERT INTO `product_images` VALUES (2, 1, 'https://www.gento.vn/wp-content/uploads/2024/07/vi-nam-da-ca-sau4.jpg');
INSERT INTO `product_images` VALUES (3, 1, 'https://www.gento.vn/wp-content/uploads/2024/07/vi-nam-da-ca-sau3.jpg');
INSERT INTO `product_images` VALUES (4, 1, 'https://www.gento.vn/wp-content/uploads/2024/05/vi-da-ca-sau-nam-3.jpg');
INSERT INTO `product_images` VALUES (5, 2, 'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m34htcbgjimx5b.webp');
INSERT INTO `product_images` VALUES (6, 2, 'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m3gngaydahew02.webp');
INSERT INTO `product_images` VALUES (7, 2, 'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m3gngaydagtxb8.webp');
INSERT INTO `product_images` VALUES (8, 2, 'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m34htcbgkx7d91.webp');
INSERT INTO `product_images` VALUES (9, 3, 'https://www.gento.vn/wp-content/uploads/2024/04/Tui-xach-da-ca-sau-hang-hieu-gento-gs10033.jpg');
INSERT INTO `product_images` VALUES (10, 3, 'https://www.gento.vn/wp-content/uploads/2024/04/Tui-xach-da-ca-sau-hang-hieu-gento-gs10031.jpg');
INSERT INTO `product_images` VALUES (11, 3, 'https://www.gento.vn/wp-content/uploads/2024/04/Tui-xach-da-ca-sau-hang-hieu-gento-gs100312.jpg');

-- ----------------------------
-- Table structure for product_options
-- ----------------------------
DROP TABLE IF EXISTS `product_options`;
CREATE TABLE `product_options`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProduct` int(10) UNSIGNED NULL DEFAULT NULL,
  `group` int(11) NULL DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `idImage` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_options-produts`(`idProduct`) USING BTREE,
  INDEX `fk_product_options-product_images`(`idImage`) USING BTREE,
  CONSTRAINT `fk_product_options-produts` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_options-product_images` FOREIGN KEY (`idImage`) REFERENCES `product_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_options
-- ----------------------------
INSERT INTO `product_options` VALUES (1, 1, 1, 'Loại da', 'Da lưng', 1);
INSERT INTO `product_options` VALUES (2, 1, 1, 'Loại da', 'Da bụng', 4);
INSERT INTO `product_options` VALUES (4, 2, 1, 'Màu sắc', 'Nâu', 6);
INSERT INTO `product_options` VALUES (5, 2, 1, 'Màu sắc', 'Đen', 5);
INSERT INTO `product_options` VALUES (6, 2, 2, 'Size', '40', NULL);
INSERT INTO `product_options` VALUES (7, 2, 2, 'Size', '41', NULL);
INSERT INTO `product_options` VALUES (8, 2, 2, 'Size', '42', NULL);

-- ----------------------------
-- Table structure for product_variants
-- ----------------------------
DROP TABLE IF EXISTS `product_variants`;
CREATE TABLE `product_variants`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProduct` int(10) UNSIGNED NULL DEFAULT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `idOption1` int(10) UNSIGNED NULL DEFAULT NULL,
  `idOption2` int(10) UNSIGNED NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_variants-products`(`idProduct`) USING BTREE,
  INDEX `fk_product_variants-product_options_1`(`idOption1`) USING BTREE,
  INDEX `fk_product_variants-product_options_2`(`idOption2`) USING BTREE,
  CONSTRAINT `fk_product_variants-products` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_variants-product_options_1` FOREIGN KEY (`idOption1`) REFERENCES `product_options` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_variants-product_options_2` FOREIGN KEY (`idOption2`) REFERENCES `product_options` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_variants
-- ----------------------------
INSERT INTO `product_variants` VALUES (1, 1, 'VN-V706-DaBung-Den', 2, NULL, 1000);
INSERT INTO `product_variants` VALUES (2, 1, 'VN-V706_DaLung-Den', 1, NULL, 500);
INSERT INTO `product_variants` VALUES (3, 2, 'SKU-Den-40', 5, 6, 1000);
INSERT INTO `product_variants` VALUES (4, 2, 'SKU-Den-41', 5, 7, 995);
INSERT INTO `product_variants` VALUES (5, 2, 'SKU-Den-42', 5, 8, 999);
INSERT INTO `product_variants` VALUES (6, 2, 'SKU-Nau-40', 4, 6, 500);
INSERT INTO `product_variants` VALUES (7, 2, 'SKU-Nau-41', 4, 7, 555);
INSERT INTO `product_variants` VALUES (8, 2, 'SKU-Nau-42', 4, 8, 425);
INSERT INTO `product_variants` VALUES (9, 3, NULL, NULL, NULL, 50);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idCategory` int(10) UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createDate` date NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_products-categories`(`idCategory`) USING BTREE,
  CONSTRAINT `fk_products-categories` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 1, 'Ví gấp nam da cá sấu V7068\r\n', 'https://www.gento.vn/wp-content/uploads/2024/05/vi-da-ca-sau-nam-3.jpg', 1100000, NULL, '2024-12-18', 1);
INSERT INTO `products` VALUES (2, 10, 'Giày mọi mặt dập vân cá sấu', 'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m34htcbgjiqj0d@resize_w450_nl.webp', 1550000, NULL, '2024-12-17', 1);
INSERT INTO `products` VALUES (3, 4, 'Túi xách da cá sấu hàng hiệu Gento GS1003', 'https://www.gento.vn/wp-content/uploads/2024/04/Tui-xach-da-ca-sau-hang-hieu-gento-gs1003.jpg', 7000000, NULL, '2024-12-10', 1);

SET FOREIGN_KEY_CHECKS = 1;
