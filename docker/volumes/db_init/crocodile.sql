CREATE DATABASE IF NOT EXISTS crocodile;
USE crocodile;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ward` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDefault` tinyint(1) NULL DEFAULT 0,
  `districtId` int(11) NULL DEFAULT NULL,
  `wardCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_user`(`userId` ASC) USING BTREE,
  CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of addresses
-- ----------------------------
INSERT INTO `addresses` VALUES (2, 1, 'Nguyễn Văn A', '0123456789', 'Hà Nội', 'Hoàn Kiếm', 'Phường Hàng Bạc', 'Số 123, Đường ABC', 1, 1489, '1A0205');
INSERT INTO `addresses` VALUES (5, 1, 'Admin', '0855804174', 'Thành phố Thủ Đức', 'Long Thạnh Mỹ', 'Quận 9', '42/2', 0, 2090, '22405');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carousels
-- ----------------------------
INSERT INTO `carousels` VALUES (1, 'Đẳng cấp và sang trọng', 'Túi xách da cá sấu cao cấp, điểm nhấn hoàn hảo cho phong cách của bạn. Khám phá bộ sưu tập mới nhất tại cửa hàng của chúng tôi!', '/uploads/images/carousels/carousel1.png', 'http://localhost:8080/uploads/images/carousels/carousel1.png', 1);
INSERT INTO `carousels` VALUES (2, 'Thời thượng và quý phái ', 'Túi xách da cá sấu cao cấp, điểm nhấn hoàn hảo cho phong cách của bạn. Khám phá bộ sưu tập mới nhất tại cửa hàng của chúng tôi!', '/uploads/images/carousels/carousel2.png', 'http://localhost:8080/uploads/images/carousels/carousel2.png', 1);
INSERT INTO `carousels` VALUES (3, 'Cao cấp và chất lượng', 'Túi xách da cá sấu cao cấp, điểm nhấn hoàn hảo cho phong cách của bạn. Khám phá bộ sưu tập mới nhất tại cửa hàng của chúng tôi!', '/uploads/images/carousels/carousel3.png', 'http://localhost:8080/uploads/images/carousels/carousel3.png', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Ví Nam', '/uploads/images/categories/cate-1.png', 1);
INSERT INTO `categories` VALUES (2, 'Ví Nữ', '/uploads/images/categories/cate-2.png', 1);
INSERT INTO `categories` VALUES (3, 'Túi Xách Nam', '/uploads/images/categories/cate-3.png', 1);
INSERT INTO `categories` VALUES (4, 'Túi Xách Nữ', '/uploads/images/categories/cate-4.png', 1);
INSERT INTO `categories` VALUES (5, 'Túi Đeo Chéo', '/uploads/images/categories/cate-5.png', 1);
INSERT INTO `categories` VALUES (6, 'Balo', '/uploads/images/categories/cate-6.png', 1);
INSERT INTO `categories` VALUES (7, 'Vali', '/uploads/images/categories/cate-7.png', 1);
INSERT INTO `categories` VALUES (8, 'Thắt Lưng', '/uploads/images/categories/cate-8.png', 1);
INSERT INTO `categories` VALUES (9, 'Áo Khoác', '/uploads/images/categories/cate-9.png', 1);
INSERT INTO `categories` VALUES (10, 'Giày Tây', '/uploads/images/categories/cate-10.png', 1);
INSERT INTO `categories` VALUES (11, 'Giày Cao Gót', '/uploads/images/categories/cate-11.png', 1);
INSERT INTO `categories` VALUES (12, 'Dép', '/uploads/images/categories/cate-12.png', 1);
INSERT INTO `categories` VALUES (13, 'Phụ Kiện', '/uploads/images/categories/cate-13.png', 1);
INSERT INTO `categories` VALUES (14, 'Danh Mục Khác', '/uploads/images/categories/cate-14.png', 1);
INSERT INTO `categories` VALUES (22, 'TestCate', '/uploads/images/categories/cate-14.png', NULL);

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `iframe` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contacts
-- ----------------------------
INSERT INTO `contacts` VALUES (1, 'ĐỒ DA CAO CẤP CROCODILE', '27 Phan Đình Phùng, Phường 17 Quận Phú Nhuận,                             Tp HCM', '082 878 6789', '<iframe class=\"google-map\"\n                    src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.2408235347784!2d106.68294947485718!3d10.792858489356917!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528d2542cb98f%3A0xd62d81f3f3579bb9!2zMjcgUGhhbiDEkMOsbmggUGjDuW5nLCBQaMaw4budbmcgMTcsIFBow7ogTmh14bqtbiwgSOG7kyBDaMOtIE1pbmgsIFZpZXRuYW0!5e0!3m2!1sen!2s!4v1730818827712!5m2!1sen!2s\"\n                    width=\"1688\" height=\"600\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"\n                    referrerpolicy=\"no-referrer-when-downgrade\"></iframe>');

-- ----------------------------
-- Table structure for discount_codes
-- ----------------------------
DROP TABLE IF EXISTS `discount_codes`;
CREATE TABLE `discount_codes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('PERCENTAGE','FIXED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(10, 2) NOT NULL,
  `maxDiscount` decimal(10, 2) NULL DEFAULT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `maxUses` int(11) NOT NULL,
  `minOrderValue` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `status` enum('ACTIVE','EXPIRED','USED_UP') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'ACTIVE',
  `category` enum('COUPON','VOUCHER','FREESHIP') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'COUPON',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discount_codes
-- ----------------------------
INSERT INTO `discount_codes` VALUES (1, 'CROCODILE', 'PERCENTAGE', 30.00, 200000.00, '2025-05-05 23:15:11', '2025-05-31 23:15:17', 1000, 0.00, 'ACTIVE', 'COUPON');
INSERT INTO `discount_codes` VALUES (2, 'CROCODILE100K', 'FIXED', 100000.00, NULL, '2025-05-16 23:18:52', '2025-05-31 23:18:56', 1000, 0.00, 'ACTIVE', 'COUPON');
INSERT INTO `discount_codes` VALUES (3, 'TEST', 'PERCENTAGE', 10.00, 100000.00, '2025-05-16 23:49:44', '2025-06-15 23:49:44', 10000, 200000.00, 'ACTIVE', 'COUPON');
INSERT INTO `discount_codes` VALUES (4, 'TEST123', 'PERCENTAGE', 10.00, 100000.00, '2025-05-16 23:56:45', '2025-06-15 23:56:45', 10000, 200000.00, 'ACTIVE', 'COUPON');
INSERT INTO `discount_codes` VALUES (5, 'SUMMER2025', 'PERCENTAGE', 10.00, 100000.00, '2025-05-17 02:55:00', '2025-06-30 02:55:00', 123, 500000.00, 'ACTIVE', 'COUPON');
INSERT INTO `discount_codes` VALUES (6, 'ABC', 'PERCENTAGE', 10.00, 10000.00, '2025-05-17 03:52:00', '2025-05-23 10:52:00', 100, 50000000.00, 'ACTIVE', 'COUPON');
INSERT INTO `discount_codes` VALUES (7, 'ABCDEF', 'FIXED', 10.00, NULL, '2025-05-17 03:56:00', '2025-05-29 10:56:00', 100, 500000.00, 'ACTIVE', 'COUPON');
INSERT INTO `discount_codes` VALUES (8, 'SUMMER2022', 'FIXED', 10000.00, NULL, '2025-05-17 03:57:00', '2025-05-22 10:57:00', 100, 500000.00, 'ACTIVE', 'COUPON');
INSERT INTO `discount_codes` VALUES (9, 'ABCDEFGH', 'FIXED', 100000.00, NULL, '2025-05-17 04:01:00', '2025-05-22 11:01:00', 100, 500000.00, 'ACTIVE', 'COUPON');
INSERT INTO `discount_codes` VALUES (10, 'KIETDZ', 'FIXED', 500000.00, NULL, '2025-05-17 11:36:00', '2025-05-24 18:36:00', 100, 500000.00, 'ACTIVE', 'COUPON');
INSERT INTO `discount_codes` VALUES (11, 'VOUCHER1', 'FIXED', 500000.00, NULL, '2025-05-17 11:36:00', '2025-06-13 18:36:00', 99, 0.00, 'ACTIVE', 'VOUCHER');
INSERT INTO `discount_codes` VALUES (12, 'VOUCHER2', 'FIXED', 500000.00, NULL, '2025-05-17 11:36:00', '2025-06-27 18:36:00', 95, 30000.00, 'ACTIVE', 'VOUCHER');
INSERT INTO `discount_codes` VALUES (14, 'VOUCHER3', 'FIXED', 500000.00, NULL, '2025-05-17 11:36:00', '2025-06-28 18:36:00', 0, 20000.00, 'ACTIVE', 'VOUCHER');
INSERT INTO `discount_codes` VALUES (15, 'VOUCHER4', 'PERCENTAGE', 25.00, 100000.00, '2025-05-17 11:36:00', '2025-06-28 18:36:00', 99, 50000.00, 'ACTIVE', 'VOUCHER');

-- ----------------------------
-- Table structure for discount_usage
-- ----------------------------
DROP TABLE IF EXISTS `discount_usage`;
CREATE TABLE `discount_usage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discountCodeId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `usedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `discount_code_id`(`discountCodeId` ASC) USING BTREE,
  INDEX `order_id`(`orderId` ASC) USING BTREE,
  INDEX `user_id`(`userId` ASC) USING BTREE,
  CONSTRAINT `discount_usage_ibfk_1` FOREIGN KEY (`discountCodeId`) REFERENCES `discount_codes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `discount_usage_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `discount_usage_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discount_usage
-- ----------------------------

-- ----------------------------
-- Table structure for inventory_histories
-- ----------------------------
DROP TABLE IF EXISTS `inventory_histories`;
CREATE TABLE `inventory_histories`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idVariant` int(10) UNSIGNED NOT NULL,
  `idOrder` int(11) NULL DEFAULT NULL,
  `quantityChange` int(11) NOT NULL,
  `changeType` enum('IMPORT','SALE','RETURN','ADJUSTMENT') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `changeDate` datetime NOT NULL DEFAULT current_timestamp(),
  `idSupplier` int(11) UNSIGNED NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idVariant`(`idVariant` ASC) USING BTREE,
  INDEX `idSupplier`(`idSupplier` ASC) USING BTREE,
  INDEX `inventory_histories_ibfk_4`(`idOrder` ASC) USING BTREE,
  CONSTRAINT `inventory_histories_ibfk_1` FOREIGN KEY (`idVariant`) REFERENCES `product_variants` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `inventory_histories_ibfk_3` FOREIGN KEY (`idSupplier`) REFERENCES `suppliers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `inventory_histories_ibfk_4` FOREIGN KEY (`idOrder`) REFERENCES `orders_v2` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 246 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory_histories
-- ----------------------------
INSERT INTO `inventory_histories` VALUES (4, 1, NULL, 22, 'IMPORT', '2025-04-20 09:24:18', 2, NULL);
INSERT INTO `inventory_histories` VALUES (6, 2, 71, -10, 'SALE', '2025-04-20 09:37:54', 1, NULL);
INSERT INTO `inventory_histories` VALUES (7, 2, 74, -300, 'SALE', '2025-04-26 07:41:23', 1, NULL);
INSERT INTO `inventory_histories` VALUES (8, 1, 75, -1, 'SALE', '2025-04-26 08:06:04', 1, NULL);
INSERT INTO `inventory_histories` VALUES (9, 1, 79, -1, 'SALE', '2025-04-26 08:07:37', 1, NULL);
INSERT INTO `inventory_histories` VALUES (53, 1, NULL, 20, 'IMPORT', '2025-04-29 06:20:47', 1, 'Nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (54, 2, NULL, 110, 'IMPORT', '2025-04-29 06:20:47', 2, 'Nhập kho tháng 4');
INSERT INTO `inventory_histories` VALUES (55, 3, NULL, 60, 'IMPORT', '2025-04-29 06:20:47', 3, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (56, 4, NULL, 90, 'IMPORT', '2025-04-29 06:20:48', 4, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (57, 5, NULL, 50, 'IMPORT', '2025-04-29 06:20:48', 5, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (58, 1, NULL, 20, 'IMPORT', '2025-04-29 06:24:06', 1, 'Nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (59, 2, NULL, 110, 'IMPORT', '2025-04-29 06:24:06', 2, 'Nhập kho tháng 4');
INSERT INTO `inventory_histories` VALUES (60, 3, NULL, 60, 'IMPORT', '2025-04-29 06:24:07', 3, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (61, 4, NULL, 90, 'IMPORT', '2025-04-29 06:24:08', 4, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (62, 5, NULL, 50, 'IMPORT', '2025-04-29 06:24:08', 5, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (64, 1, NULL, 20, 'IMPORT', '2025-04-29 06:30:47', 1, 'Nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (65, 2, NULL, 110, 'IMPORT', '2025-04-29 06:30:48', 2, 'Nhập kho tháng 4');
INSERT INTO `inventory_histories` VALUES (66, 3, NULL, 60, 'IMPORT', '2025-04-29 06:30:48', 3, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (67, 4, NULL, 90, 'IMPORT', '2025-04-29 06:30:48', 4, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (68, 5, NULL, 50, 'IMPORT', '2025-04-29 06:30:49', 5, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (70, 1, NULL, 20, 'IMPORT', '2025-04-29 06:59:19', 1, 'Nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (71, 2, NULL, 110, 'IMPORT', '2025-04-29 06:59:19', 2, 'Nhập kho tháng 4');
INSERT INTO `inventory_histories` VALUES (72, 3, NULL, 60, 'IMPORT', '2025-04-29 06:59:19', 3, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (73, 4, NULL, 90, 'IMPORT', '2025-04-29 06:59:20', 4, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (74, 5, NULL, 50, 'IMPORT', '2025-04-29 06:59:20', 5, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (75, 1, NULL, 20, 'IMPORT', '2025-04-29 09:02:37', 1, 'Nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (76, 2, NULL, 110, 'IMPORT', '2025-04-29 09:02:38', 2, 'Nhập kho tháng 4');
INSERT INTO `inventory_histories` VALUES (77, 3, NULL, 60, 'IMPORT', '2025-04-29 09:02:38', 3, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (78, 4, NULL, 90, 'IMPORT', '2025-04-29 09:02:39', 4, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (79, 5, NULL, 50, 'IMPORT', '2025-04-29 09:02:39', 5, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (80, 1, NULL, 20, 'IMPORT', '2025-04-29 09:02:56', 1, 'Nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (81, 2, NULL, 110, 'IMPORT', '2025-04-29 09:02:57', 2, 'Nhập kho tháng 4');
INSERT INTO `inventory_histories` VALUES (82, 3, NULL, 60, 'IMPORT', '2025-04-29 09:02:57', 3, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (83, 4, NULL, 90, 'IMPORT', '2025-04-29 09:02:57', 4, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (84, 5, NULL, 50, 'IMPORT', '2025-04-29 09:02:58', 5, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (85, 1, NULL, 20, 'IMPORT', '2025-04-29 09:03:05', 1, 'Nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (86, 2, NULL, 110, 'IMPORT', '2025-04-29 09:03:06', 2, 'Nhập kho tháng 4');
INSERT INTO `inventory_histories` VALUES (87, 3, NULL, 60, 'IMPORT', '2025-04-29 09:03:06', 3, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (88, 4, NULL, 90, 'IMPORT', '2025-04-29 09:03:06', 4, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (89, 5, NULL, 50, 'IMPORT', '2025-04-29 09:03:07', 5, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (92, 1, NULL, 20, 'IMPORT', '2025-04-29 09:15:04', 1, 'Nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (93, 2, NULL, 110, 'IMPORT', '2025-04-29 09:15:04', 2, 'Nhập kho tháng 4');
INSERT INTO `inventory_histories` VALUES (94, 3, NULL, 60, 'IMPORT', '2025-04-29 09:15:05', 3, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (95, 4, NULL, 90, 'IMPORT', '2025-04-29 09:15:05', 4, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (96, 5, NULL, 50, 'IMPORT', '2025-04-29 09:15:05', 5, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (100, 2, 80, -7, 'SALE', '2025-04-29 09:31:18', 1, NULL);
INSERT INTO `inventory_histories` VALUES (101, 1, NULL, 20, 'IMPORT', '2025-04-29 09:41:36', 1, 'Nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (102, 2, NULL, 110, 'IMPORT', '2025-04-29 09:41:36', 2, 'Nhập kho tháng 4');
INSERT INTO `inventory_histories` VALUES (103, 3, NULL, 60, 'IMPORT', '2025-04-29 09:41:37', 3, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (104, 4, NULL, 90, 'IMPORT', '2025-04-29 09:41:37', 4, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (105, 5, NULL, 50, 'IMPORT', '2025-04-29 09:41:38', 5, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (106, 1, NULL, 20, 'IMPORT', '2025-04-29 09:42:06', 1, 'Nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (107, 2, NULL, 110, 'IMPORT', '2025-04-29 09:42:07', 2, 'Nhập kho tháng 4');
INSERT INTO `inventory_histories` VALUES (108, 3, NULL, 60, 'IMPORT', '2025-04-29 09:42:07', 3, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (109, 4, NULL, 90, 'IMPORT', '2025-04-29 09:42:07', 4, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (111, 1, NULL, 20, 'IMPORT', '2025-04-29 09:53:11', 1, 'Nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (112, 2, NULL, 110, 'IMPORT', '2025-04-29 09:53:11', 2, 'Nhập kho tháng 4');
INSERT INTO `inventory_histories` VALUES (113, 3, NULL, 60, 'IMPORT', '2025-04-29 09:53:12', 3, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (114, 4, NULL, 90, 'IMPORT', '2025-04-29 09:53:12', 4, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (116, 1, NULL, 20, 'IMPORT', '2025-04-29 09:54:12', 1, 'Nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (117, 2, NULL, 110, 'IMPORT', '2025-04-29 09:54:12', 2, 'Nhập kho tháng 4');
INSERT INTO `inventory_histories` VALUES (118, 3, NULL, 60, 'IMPORT', '2025-04-29 09:54:13', 3, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (119, 4, NULL, 90, 'IMPORT', '2025-04-29 09:54:13', 4, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (121, 1, NULL, 20, 'IMPORT', '2025-05-03 05:57:27', 1, 'Nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (122, 2, NULL, 110, 'IMPORT', '2025-05-03 05:57:27', 2, 'Nhập kho tháng 4');
INSERT INTO `inventory_histories` VALUES (123, 3, NULL, 60, 'IMPORT', '2025-05-03 05:57:28', 3, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (124, 4, NULL, 90, 'IMPORT', '2025-05-03 05:57:28', 4, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (125, 5, NULL, 50, 'IMPORT', '2025-05-03 05:57:29', 5, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (126, 1, NULL, 20, 'IMPORT', '2025-05-03 06:04:37', 1, 'Nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (127, 2, NULL, 110, 'IMPORT', '2025-05-03 06:04:38', 2, 'Nhập kho tháng 4');
INSERT INTO `inventory_histories` VALUES (128, 3, NULL, 60, 'IMPORT', '2025-05-03 06:04:38', 3, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (129, 4, NULL, 90, 'IMPORT', '2025-05-03 06:04:39', 4, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (130, 5, NULL, 50, 'IMPORT', '2025-05-03 06:04:39', 5, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (131, 1, NULL, 20, 'IMPORT', '2025-05-03 06:30:05', 1, 'Nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (132, 2, NULL, 110, 'IMPORT', '2025-05-03 06:30:06', 2, 'Nhập kho tháng 4');
INSERT INTO `inventory_histories` VALUES (133, 3, NULL, 60, 'IMPORT', '2025-05-03 06:30:06', 3, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (134, 4, NULL, 90, 'IMPORT', '2025-05-03 06:30:07', 4, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (135, 5, NULL, 50, 'IMPORT', '2025-05-03 06:30:07', 5, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (148, 1, 194, -99, 'SALE', '2025-05-09 14:13:43', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (149, 2, 194, -99, 'SALE', '2025-05-09 14:13:43', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (150, 3, 194, -99, 'SALE', '2025-05-09 14:13:43', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (151, 2, 195, -1, 'SALE', '2025-05-09 17:04:29', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (152, 1, 196, -99, 'SALE', '2025-05-09 17:16:07', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (153, 2, 196, -99, 'SALE', '2025-05-09 17:16:07', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (154, 3, 196, -99, 'SALE', '2025-05-09 17:16:07', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (155, 1, 197, -2, 'SALE', '2025-05-09 17:18:13', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (156, 1, 198, -2, 'SALE', '2025-05-09 17:20:26', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (157, 2, 199, -1, 'SALE', '2025-05-10 03:36:11', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (158, 2, 200, -1, 'SALE', '2025-05-10 03:36:13', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (172, 125, 214, -1, 'SALE', '2025-05-11 13:34:59', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (173, 125, 215, -3, 'SALE', '2025-05-11 13:35:40', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (174, 2, 216, -1, 'SALE', '2025-05-11 13:36:39', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (175, 2, 217, -1, 'SALE', '2025-05-11 13:56:34', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (176, 2, 218, -1, 'SALE', '2025-05-11 15:25:36', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (177, 6, 219, -1, 'SALE', '2025-05-11 15:59:47', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (178, 2, 220, -1, 'SALE', '2025-05-11 16:01:19', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (179, 12, 221, -1, 'SALE', '2025-05-11 16:07:23', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (180, 10, 222, -1, 'SALE', '2025-05-11 16:22:42', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (181, 1, 223, -1, 'SALE', '2025-05-16 01:19:36', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (182, 2, 224, -1, 'SALE', '2025-05-17 08:08:55', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (183, 2, 225, -1, 'SALE', '2025-05-17 11:14:44', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (184, 2, 226, -1, 'SALE', '2025-05-17 11:38:00', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (185, 7, 227, -1, 'SALE', '2025-05-17 11:56:14', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (186, 12, 228, -1, 'SALE', '2025-05-29 16:50:32', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (187, 12, 229, -1, 'SALE', '2025-05-29 16:51:31', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (188, 2, 230, -1, 'SALE', '2025-06-02 02:01:44', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (189, 2, 231, -1, 'SALE', '2025-06-02 02:22:21', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (190, 2, 232, -1, 'SALE', '2025-06-02 05:10:39', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (191, 7, 232, -1, 'SALE', '2025-06-02 05:10:39', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (192, 12, 232, -2, 'SALE', '2025-06-02 05:10:39', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (193, 2, 233, -1, 'SALE', '2025-06-02 05:12:05', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (194, 7, 233, -1, 'SALE', '2025-06-02 05:12:05', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (195, 12, 233, -2, 'SALE', '2025-06-02 05:12:05', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (196, 9, 234, -1, 'SALE', '2025-06-02 05:24:39', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (197, 122, 235, -3, 'SALE', '2025-06-02 05:45:51', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (198, 74, 236, -1, 'SALE', '2025-06-02 05:47:21', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (199, 76, 236, -1, 'SALE', '2025-06-02 05:47:21', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (200, 2, 237, -1, 'SALE', '2025-06-02 06:07:24', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (201, 6, 237, -1, 'SALE', '2025-06-02 06:07:24', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (202, 125, 237, -1, 'SALE', '2025-06-02 06:07:24', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (203, 2, 238, -1, 'SALE', '2025-06-02 06:22:39', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (204, 73, 238, -1, 'SALE', '2025-06-02 06:22:39', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (205, 2, 239, -1, 'SALE', '2025-06-02 06:23:01', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (206, 73, 239, -1, 'SALE', '2025-06-02 06:23:01', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (207, 11, 240, -1, 'SALE', '2025-06-02 06:27:13', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (208, 2, 241, -1, 'SALE', '2025-06-02 06:36:36', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (209, 2, 242, -1, 'SALE', '2025-06-02 06:45:54', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (210, 2, 243, -1, 'SALE', '2025-06-02 06:47:29', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (211, 18, 244, -1, 'SALE', '2025-06-02 06:50:11', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (212, 201, 245, -1, 'SALE', '2025-06-02 06:51:17', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (213, 10, 245, -1, 'SALE', '2025-06-02 06:51:17', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (214, 1, 246, -1, 'SALE', '2025-06-02 08:13:43', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (215, 7, 247, -1, 'SALE', '2025-06-02 08:15:10', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (218, 202, 250, -2, 'SALE', '2025-06-02 08:43:42', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (219, 169, 251, -1, 'SALE', '2025-06-02 08:44:15', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (220, 200, 252, -2, 'SALE', '2025-06-02 08:44:45', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (221, 22, NULL, 20, 'IMPORT', '2025-06-02 10:27:30', 1, 'Nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (222, 1, NULL, 20, 'IMPORT', '2025-06-02 10:37:59', 1, 'Nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (223, 2, NULL, 110, 'IMPORT', '2025-06-02 10:37:59', 2, 'Nhập kho tháng 4');
INSERT INTO `inventory_histories` VALUES (224, 3, NULL, 60, 'IMPORT', '2025-06-02 10:37:59', 3, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (225, 4, NULL, 90, 'IMPORT', '2025-06-02 10:37:59', 4, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (226, 5, NULL, 50, 'IMPORT', '2025-06-02 10:37:59', 5, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (228, 160, 254, -1, 'SALE', '2025-06-02 14:14:10', NULL, NULL);
INSERT INTO `inventory_histories` VALUES (241, 1, NULL, 20, 'IMPORT', '2025-06-03 01:00:52', 1, 'Nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (242, 2, NULL, 110, 'IMPORT', '2025-06-03 01:00:52', 2, 'Nhập kho tháng 4');
INSERT INTO `inventory_histories` VALUES (243, 3, NULL, 60, 'IMPORT', '2025-06-03 01:00:52', 3, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (244, 4, NULL, 90, 'IMPORT', '2025-06-03 01:00:52', 4, 'nhập bổ sung');
INSERT INTO `inventory_histories` VALUES (245, 5, NULL, 50, 'IMPORT', '2025-06-03 01:00:52', 5, 'nhập bổ sung');

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idOrder` int(11) NULL DEFAULT NULL,
  `idVariant` int(11) UNSIGNED NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT 1,
  `unitPrice` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_details-orders`(`idOrder` ASC) USING BTREE,
  INDEX `fk_order_details-product_variants`(`idVariant` ASC) USING BTREE,
  CONSTRAINT `fk_order_details-orders` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_details-product_variants` FOREIGN KEY (`idVariant`) REFERENCES `product_variants` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES (1, 1, 3, 1, 0);
INSERT INTO `order_details` VALUES (2, 2, 10, 10, 0);
INSERT INTO `order_details` VALUES (4, 15, 4, 3, 0);
INSERT INTO `order_details` VALUES (7, 4, 11, 4, 0);
INSERT INTO `order_details` VALUES (8, 1, 2, 3, 0);
INSERT INTO `order_details` VALUES (9, 4, 7, 5, 0);
INSERT INTO `order_details` VALUES (13, 6, 21, 2, 0);
INSERT INTO `order_details` VALUES (16, 6, 28, 1, 0);
INSERT INTO `order_details` VALUES (21, 4, 6, 3, 0);
INSERT INTO `order_details` VALUES (23, 1, 16, 1, 0);
INSERT INTO `order_details` VALUES (24, 2, 26, 1, 0);
INSERT INTO `order_details` VALUES (25, 2, 27, 1, 0);
INSERT INTO `order_details` VALUES (26, 1, 19, 1, 0);
INSERT INTO `order_details` VALUES (28, 2, 3, 1, 0);
INSERT INTO `order_details` VALUES (30, 2, 158, 4, 0);
INSERT INTO `order_details` VALUES (33, 4, 81, 1, 0);
INSERT INTO `order_details` VALUES (37, 11, 78, 1, 0);
INSERT INTO `order_details` VALUES (45, 4, 164, 1, 0);
INSERT INTO `order_details` VALUES (46, 4, 165, 1, 0);
INSERT INTO `order_details` VALUES (47, 2, 162, 1, 0);
INSERT INTO `order_details` VALUES (48, 2, 151, 1, 0);
INSERT INTO `order_details` VALUES (50, 12, 194, 1, 0);
INSERT INTO `order_details` VALUES (51, 13, 196, 1, 0);
INSERT INTO `order_details` VALUES (52, 14, 197, 1, 0);
INSERT INTO `order_details` VALUES (56, 71, 2, 10, 0);
INSERT INTO `order_details` VALUES (57, 74, 2, 300, 0);
INSERT INTO `order_details` VALUES (58, 75, 1, 1, 0);
INSERT INTO `order_details` VALUES (59, 79, 1, 1, 0);
INSERT INTO `order_details` VALUES (60, 80, 2, 7, 0);
INSERT INTO `order_details` VALUES (61, 82, 1, 1, 0);
INSERT INTO `order_details` VALUES (62, 82, 2, 1, 0);

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idOrder` int(11) NULL DEFAULT NULL,
  `idProductVariant` int(11) UNSIGNED NULL DEFAULT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  `unitPrice` decimal(10, 2) NULL DEFAULT NULL,
  `o1Key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `o1Value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `o2Key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `o2Value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idOrder`(`idOrder` ASC) USING BTREE,
  INDEX `order_items_ibfk_2`(`idProductVariant` ASC) USING BTREE,
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`idOrder`) REFERENCES `orders_v2` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`idProductVariant`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 301 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES (1, 1, 1, 2, 199000.00, 'Loại da', 'Da bụng', NULL, NULL);
INSERT INTO `order_items` VALUES (2, 1, 115, 1, 120000.00, 'Mau Sac', 'Do', 'Size', '12');
INSERT INTO `order_items` VALUES (3, 80, 1, 2, 500000.00, 'Loại da', 'Da bụng', NULL, NULL);
INSERT INTO `order_items` VALUES (4, 80, 115, 1, 500000.00, 'Mau Sac', 'Do', 'Size', '12');
INSERT INTO `order_items` VALUES (5, 81, 2, 3, 800000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (6, 81, 3, 1, 800000.00, 'Mau Sac', 'Den', NULL, NULL);
INSERT INTO `order_items` VALUES (31, 94, 1, 4, 1000000.00, 'Loại da', 'Da bụng', NULL, NULL);
INSERT INTO `order_items` VALUES (32, 94, 115, 1, 700000.00, 'Mau Sac', 'Do', 'Size', '12');
INSERT INTO `order_items` VALUES (33, 95, 3, 2, 700000.00, 'Mau Sac', 'Den', NULL, NULL);
INSERT INTO `order_items` VALUES (34, 95, 4, 1, 600000.00, 'Loại da', 'Da bụng', NULL, NULL);
INSERT INTO `order_items` VALUES (43, 80, 1, 1, 1100000.00, 'Loại da', 'Da bụng', NULL, NULL);
INSERT INTO `order_items` VALUES (44, 80, 2, 1, 400000.00, 'Mau Sac', 'Đỏ', NULL, NULL);
INSERT INTO `order_items` VALUES (45, 81, 3, 1, 2600000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (46, 81, 4, 1, 600000.00, 'Mau Sac', 'Đen', NULL, NULL);
INSERT INTO `order_items` VALUES (71, 94, 4, 2, 1500000.00, 'Mau Sac', 'Đen', NULL, NULL);
INSERT INTO `order_items` VALUES (72, 94, 158, 1, 1700000.00, 'Loại da', 'Da bụng', 'Size', '38');
INSERT INTO `order_items` VALUES (73, 95, 5, 1, 1200000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (74, 95, 154, 1, 800000.00, 'Mau Sac', 'Đen', NULL, NULL);
INSERT INTO `order_items` VALUES (83, 100, 1, 1, 1100000.00, 'Loại da', 'Da bụng', NULL, NULL);
INSERT INTO `order_items` VALUES (84, 100, 2, 1, 1400000.00, 'Mau Sac', 'Đỏ', NULL, NULL);
INSERT INTO `order_items` VALUES (85, 101, 3, 1, 2600000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (86, 101, 4, 1, 1200000.00, 'Mau Sac', 'Đen', NULL, NULL);
INSERT INTO `order_items` VALUES (105, 111, 1, 1, 1100000.00, 'Loại da', 'Da bụng', NULL, NULL);
INSERT INTO `order_items` VALUES (106, 111, 2, 1, 1350000.00, 'Mau Sac', 'Đỏ', NULL, NULL);
INSERT INTO `order_items` VALUES (107, 111, 3, 1, 1150000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (108, 112, 155, 1, 3000000.00, 'Loại da', 'Da bụng', 'Size', '40');
INSERT INTO `order_items` VALUES (109, 112, 4, 1, 1300000.00, 'Mau Sac', 'Đen', NULL, NULL);
INSERT INTO `order_items` VALUES (214, 194, 1, 99, 1100000.00, 'Loại da', 'Da bụng', NULL, NULL);
INSERT INTO `order_items` VALUES (215, 194, 2, 99, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (216, 194, 3, 99, 1550000.00, 'Màu sắc', 'Đen', 'Size', '40');
INSERT INTO `order_items` VALUES (217, 195, 2, 1, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (218, 196, 1, 99, 1100000.00, 'Loại da', 'Da bụng', NULL, NULL);
INSERT INTO `order_items` VALUES (219, 196, 2, 99, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (220, 196, 3, 99, 1550000.00, 'Màu sắc', 'Đen', 'Size', '40');
INSERT INTO `order_items` VALUES (221, 197, 1, 2, 1100000.00, 'Loại da', 'Da bụng', NULL, NULL);
INSERT INTO `order_items` VALUES (222, 198, 1, 2, 1100000.00, 'Loại da', 'Da bụng', NULL, NULL);
INSERT INTO `order_items` VALUES (223, 199, 2, 1, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (224, 200, 2, 1, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (238, 214, 125, 1, 12000000.00, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (239, 215, 125, 3, 12000000.00, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (240, 216, 2, 1, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (241, 217, 2, 1, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (242, 218, 2, 1, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (243, 219, 6, 1, 1550000.00, 'Màu sắc', 'Nâu', 'Size', '40');
INSERT INTO `order_items` VALUES (244, 220, 2, 1, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (245, 221, 12, 1, 7000000.00, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (246, 222, 10, 1, 1350000.00, 'Màu sắc', 'Đen', NULL, NULL);
INSERT INTO `order_items` VALUES (247, 223, 1, 1, 1100000.00, 'Loại da', 'Da bụng', NULL, NULL);
INSERT INTO `order_items` VALUES (248, 224, 2, 1, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (249, 225, 2, 1, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (250, 226, 2, 1, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (251, 227, 7, 1, 1550000.00, 'Màu sắc', 'Nâu', 'Size', '41');
INSERT INTO `order_items` VALUES (252, 228, 12, 1, 7000000.00, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (253, 229, 12, 1, 7000000.00, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (254, 230, 2, 1, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (255, 231, 2, 1, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (256, 232, 2, 1, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (257, 232, 7, 1, 1550000.00, 'Màu sắc', 'Nâu', 'Size', '41');
INSERT INTO `order_items` VALUES (258, 232, 12, 2, 7000000.00, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (259, 233, 2, 1, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (260, 233, 7, 1, 1550000.00, 'Màu sắc', 'Nâu', 'Size', '41');
INSERT INTO `order_items` VALUES (261, 233, 12, 2, 7000000.00, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (262, 234, 9, 1, 1350000.00, 'Màu sắc', 'Nâu', NULL, NULL);
INSERT INTO `order_items` VALUES (263, 235, 122, 3, 2800000.00, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (264, 236, 74, 1, 1100000.00, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (265, 236, 76, 1, 999000.00, 'Màu Sắc', 'Đen', NULL, NULL);
INSERT INTO `order_items` VALUES (266, 237, 2, 1, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (267, 237, 6, 1, 1550000.00, 'Màu sắc', 'Nâu', 'Size', '40');
INSERT INTO `order_items` VALUES (268, 237, 125, 1, 12000000.00, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (269, 238, 2, 1, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (270, 238, 73, 1, 2200000.00, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (271, 239, 2, 1, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (272, 239, 73, 1, 2200000.00, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (273, 240, 11, 1, 799000.00, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (274, 241, 2, 1, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (275, 242, 2, 1, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (276, 243, 2, 1, 1100000.00, 'Loại da', 'Da lưng', NULL, NULL);
INSERT INTO `order_items` VALUES (277, 244, 18, 1, 2100000.00, 'Màu sắc ', 'Nâu đen', NULL, NULL);
INSERT INTO `order_items` VALUES (278, 245, 201, 1, 5999000.00, 'Size', '43', NULL, NULL);
INSERT INTO `order_items` VALUES (279, 245, 10, 1, 1350000.00, 'Màu sắc', 'Đen', NULL, NULL);
INSERT INTO `order_items` VALUES (280, 246, 1, 1, 1100000.00, 'Loại da', 'Da bụng', NULL, NULL);
INSERT INTO `order_items` VALUES (281, 247, 7, 1, 1550000.00, 'Màu sắc', 'Nâu', 'Size', '41');
INSERT INTO `order_items` VALUES (284, 250, 202, 2, 5999000.00, 'Size', '44', NULL, NULL);
INSERT INTO `order_items` VALUES (285, 251, 169, 1, 2199000.00, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (286, 252, 200, 2, 5699000.00, 'Size', '44', NULL, NULL);
INSERT INTO `order_items` VALUES (288, 254, 160, 1, 3399000.00, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for order_status
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enumValue` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `enumValue`(`enumValue` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_status
-- ----------------------------
INSERT INTO `order_status` VALUES (1, 'processing', 'Đơn hàng đang đóng gói');
INSERT INTO `order_status` VALUES (2, 'shipped ', 'Đã lấy hàng');
INSERT INTO `order_status` VALUES (3, 'in_transit', 'Đang trên đường vận chuyển');
INSERT INTO `order_status` VALUES (4, 'delivering', 'Đang giao hàng');
INSERT INTO `order_status` VALUES (5, 'success', 'Đã giao hàng');
INSERT INTO `order_status` VALUES (6, 'canceled', 'Đã bị hủy');
INSERT INTO `order_status` VALUES (7, 'pending', 'Đang chờ xử lý');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NULL DEFAULT NULL,
  `idAddress` int(11) NULL DEFAULT NULL,
  `total` int(11) NULL DEFAULT NULL,
  `invoiceDate` datetime NULL DEFAULT current_timestamp(),
  `paymentDate` datetime NULL DEFAULT NULL,
  `paymentMethod` enum('MOMO','CASH','ZALOPAY','VNPAY') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` enum('PENDING','PROCESSING','COMPLETED','CANCELLED','AWAITING','') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_orders-users`(`idUser` ASC) USING BTREE,
  CONSTRAINT `fk_orders-users` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 1, NULL, 8175000, '2025-01-14 00:00:00', NULL, 'CASH', 'AWAITING');
INSERT INTO `orders` VALUES (2, 2, NULL, 34774000, '2024-11-13 13:05:22', NULL, 'MOMO', 'COMPLETED');
INSERT INTO `orders` VALUES (4, 1, NULL, 25724000, '2024-12-27 13:24:06', NULL, 'CASH', 'COMPLETED');
INSERT INTO `orders` VALUES (6, 2, NULL, 4393000, '2025-01-10 13:29:26', NULL, 'ZALOPAY', 'COMPLETED');
INSERT INTO `orders` VALUES (11, 1, 1, 1200000, '2025-01-14 15:59:07', NULL, 'ZALOPAY', 'PROCESSING');
INSERT INTO `orders` VALUES (12, 1, 1, 4179000, '2025-01-14 18:01:56', NULL, 'MOMO', 'PENDING');
INSERT INTO `orders` VALUES (13, 1, 1, 3599000, '2025-01-15 01:18:47', NULL, 'MOMO', 'CANCELLED');
INSERT INTO `orders` VALUES (14, 1, 1, 3599000, '2025-01-15 17:05:45', NULL, 'ZALOPAY', 'PENDING');
INSERT INTO `orders` VALUES (15, 1, 1, 4650000, '2025-01-15 17:37:13', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (20, 1, 1, NULL, '2025-01-15 17:55:13', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (27, 1, 1, NULL, '2025-01-15 23:50:49', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (28, 1, 1, NULL, '2025-01-16 01:36:26', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (31, 1, 1, NULL, '2025-01-16 04:02:47', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (32, 1, 1, NULL, '2025-01-16 04:14:41', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (33, 1, 1, NULL, '2025-01-16 04:19:24', NULL, 'MOMO', 'PENDING');
INSERT INTO `orders` VALUES (34, 1, 1, NULL, '2025-01-16 04:22:38', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (35, 1, 1, NULL, '2025-01-16 04:24:42', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (36, 1, 1, NULL, '2025-01-16 04:26:26', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (37, 1, 1, NULL, '2025-01-16 04:30:08', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (38, 1, 1, NULL, '2025-01-16 04:30:32', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (39, 1, 1, NULL, '2025-01-16 04:30:39', NULL, 'MOMO', 'PENDING');
INSERT INTO `orders` VALUES (51, 1, 1, NULL, '2025-01-16 04:53:43', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (52, 1, 1, NULL, '2025-01-16 04:54:20', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (53, 1, 1, NULL, '2025-01-16 04:56:55', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (54, 1, 1, NULL, '2025-01-16 04:57:33', NULL, 'MOMO', 'PENDING');
INSERT INTO `orders` VALUES (55, 1, 1, NULL, '2025-01-16 04:59:06', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (56, 1, 1, NULL, '2025-01-16 05:00:49', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (57, 1, 1, NULL, '2025-01-16 05:04:08', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (59, 1, 1, NULL, '2025-01-16 05:07:02', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (60, 1, 1, NULL, '2025-01-16 05:07:29', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (65, 1, 1, NULL, '2025-01-16 19:47:36', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (66, 1, 1, NULL, '2025-01-16 19:57:46', NULL, 'MOMO', 'PENDING');
INSERT INTO `orders` VALUES (67, 1, 1, NULL, '2025-01-16 23:00:56', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (68, 1, 1, NULL, '2025-01-20 18:45:36', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (69, 1, 1, NULL, '2025-04-02 19:07:45', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (71, 1, 1, 11000000, '2025-04-20 16:37:48', NULL, 'MOMO', 'PENDING');
INSERT INTO `orders` VALUES (72, 1, 1, NULL, '2025-04-26 00:22:32', NULL, 'ZALOPAY', 'PENDING');
INSERT INTO `orders` VALUES (73, 1, 1, NULL, '2025-04-26 00:28:13', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (74, 1, 1, 330000000, '2025-04-26 14:41:21', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (75, 1, 1, 1100000, '2025-04-26 15:06:02', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (76, 1, 1, NULL, '2025-04-26 15:06:52', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (77, 1, 1, NULL, '2025-04-26 15:06:58', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (78, 1, 1, NULL, '2025-04-26 15:07:05', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (79, 1, 1, 1100000, '2025-04-26 15:07:35', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (80, 1, 1, 7700000, '2025-04-29 16:31:13', NULL, 'MOMO', 'PENDING');
INSERT INTO `orders` VALUES (81, 1, 1, NULL, '2025-05-09 08:49:58', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (82, 1, 1, 2200000, '2025-05-09 08:50:43', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (83, 1, 1, NULL, '2025-05-09 08:53:25', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (84, 1, 1, NULL, '2025-05-09 08:54:03', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (85, 1, 1, NULL, '2025-05-09 08:54:13', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (86, 1, 1, NULL, '2025-05-09 08:54:15', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (87, 1, 1, NULL, '2025-05-09 09:04:15', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (88, 1, 1, NULL, '2025-05-09 13:47:53', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (89, 1, 1, NULL, '2025-05-09 15:41:26', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (90, 1, 1, NULL, '2025-05-09 15:41:29', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (91, 1, 1, NULL, '2025-05-09 15:41:30', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (92, 1, 1, NULL, '2025-05-09 15:41:31', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (93, 1, 1, NULL, '2025-05-09 15:41:32', NULL, 'CASH', 'PENDING');
INSERT INTO `orders` VALUES (94, 1, 1, NULL, '2025-05-09 15:45:16', NULL, 'CASH', 'PENDING');

-- ----------------------------
-- Table structure for orders_v2
-- ----------------------------
DROP TABLE IF EXISTS `orders_v2`;
CREATE TABLE `orders_v2`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderDate` datetime NULL DEFAULT NULL,
  `paymentMethod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `total` bigint(20) NULL DEFAULT NULL,
  `recipientName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `recipientPhone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shippingAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shippingCompany` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shippingCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `isDelete` tinyint(1) NULL DEFAULT 0,
  `districtId` int(11) NULL DEFAULT NULL,
  `wardCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` enum('PENDING','PROCESSING','COMPLETED','CANCELLED','AWAITING','') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'AWAITING',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_orders_v2_users`(`idUser` ASC) USING BTREE,
  CONSTRAINT `fk_orders_v2_users` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 263 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_v2
-- ----------------------------
INSERT INTO `orders_v2` VALUES (1, 1, '20250317-00001', '2025-03-17 10:46:33', 'COD', 5000000, 'Tan Kiet', '0111222333', 'Khoa CNTT, Trường ĐH.Nông Lâm, Phường Linh Trung, TP.Thủ Đức, Hồ Chí Minh', 'Viettel Post', '112233', 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (2, 2, '20241113-00002', '2024-11-13 13:05:22', 'MOMO', 5000000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (4, 1, '20241227-00004', '2024-12-27 13:24:06', 'COD', 5000000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (6, 2, '20250110-00006', '2025-01-10 13:29:26', 'ZALOPAY', 5000000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (11, 1, '20250114-00011', '2025-01-14 15:59:07', 'ZALOPAY', 6250000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (12, 1, '20250114-00012', '2025-01-14 18:01:56', 'MOMO', 17587000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (13, 1, '20250115-00013', '2025-01-15 01:18:47', 'MOMO', 4300000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (14, 1, '20250115-00014', '2025-01-15 17:05:45', 'ZALOPAY', 3196000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (15, 1, '20250115-00015', '2025-01-15 17:37:13', 'COD', 2600000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (20, 1, '20250115-00020', '2025-01-15 17:55:13', 'COD', 1300000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (27, 1, '20250115-00027', '2025-01-15 23:50:49', 'COD', 1550000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (28, 1, '20250116-00028', '2025-01-16 01:36:26', 'COD', 5000000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (31, 1, '20250116-00031', '2025-01-16 04:02:47', 'COD', 3949000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (32, 1, '20250116-00032', '2025-01-16 04:14:41', 'COD', 1100000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (33, 1, '20250116-00033', '2025-01-16 04:19:24', 'MOMO', 2899000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (34, 1, '20250116-00034', '2025-01-16 04:22:38', 'COD', 1350000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (35, 1, '20250116-00035', '2025-01-16 04:24:42', 'COD', 2700000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (36, 1, '20250116-00036', '2025-01-16 04:26:26', 'COD', 2399000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (37, 1, '20250116-00037', '2025-01-16 04:30:08', 'COD', 4050000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (38, 1, '20250116-00038', '2025-01-16 04:30:32', 'COD', 1100000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (39, 1, '20250116-00039', '2025-01-16 04:30:39', 'MOMO', 1100000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (51, 1, '20250116-00051', '2025-01-16 04:53:43', 'COD', 2599000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (52, 1, '20250116-00052', '2025-01-16 04:54:20', 'COD', 2599000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (53, 1, '20250116-00053', '2025-01-16 04:56:55', 'COD', 1100000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (54, 1, '20250116-00054', '2025-01-16 04:57:33', 'MOMO', 2399000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (55, 1, '20250116-00055', '2025-01-16 04:59:06', 'COD', 1550000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (56, 1, '20250116-00056', '2025-01-16 05:00:49', 'COD', 1550000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (57, 1, '20250116-00057', '2025-01-16 05:04:08', 'COD', 7000000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (59, 1, '20250116-00059', '2025-01-16 05:07:02', 'COD', 8100000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (60, 1, '20250116-00060', '2025-01-16 05:07:29', 'COD', 8100000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (65, 1, '20250116-00065', '2025-01-16 19:47:36', 'COD', 3300000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (66, 1, '20250116-00066', '2025-01-16 19:57:46', 'MOMO', 4794000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (67, 1, '20250116-00067', '2025-01-16 23:00:56', 'COD', 15400000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (68, 1, '20250120-00068', '2025-01-20 18:45:36', 'COD', 4050000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (69, 1, '20250402-00069', '2025-04-02 19:07:45', 'COD', 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (71, 1, '20250420-00071', '2025-04-20 16:37:48', 'MOMO', 110000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (72, 1, '20250426-00072', '2025-04-26 00:22:32', 'ZALOPAY', 1100000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (73, 1, '20250426-00073', '2025-04-26 00:28:13', 'COD', 109890, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (74, 1, '20250426-00074', '2025-04-26 14:41:21', 'COD', 330000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (75, 1, '20250426-00075', '2025-04-26 15:06:02', 'COD', 1100000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (76, 1, '20250426-00076', '2025-04-26 15:06:52', 'COD', 1100000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (77, 2, '20250426-00077', '2025-04-26 15:06:58', 'COD', 1100000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (78, 1, '20250426-00078', '2025-04-26 15:07:05', 'COD', 1100000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (79, 1, '20250426-00079', '2025-04-26 15:07:35', 'COD', 1100000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (80, 1, '20250421-00080', '2025-04-21 08:30:00', 'COD', 1500000, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'Viettel Post', '123456', 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (81, 2, '20250421-00081', '2025-04-21 10:15:00', 'MOMO', 3200000, 'Test User', '1234567890', 'Khoa CNTT, Trường ĐH.Nông Lâm, Phường Linh Trung, TP.Thủ Đức, Hồ Chí Minh', 'Giao Hang Nhanh', '654321', 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (94, 1, '20250425-00094', '2025-04-25 15:45:00', 'ZALOPAY', 4700000, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'Viettel Post', '357951', 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (95, 2, '20250426-00095', '2025-04-26 07:30:00', 'COD', 2000000, 'Test User', '1234567890', 'Khoa CNTT, Trường ĐH.Nông Lâm, Phường Linh Trung, TP.Thủ Đức, Hồ Chí Minh', 'Giao Hang Nhanh', '951753', 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (100, 1, '20250301-00100', '2025-03-01 09:00:00', 'COD', 2500000, 'TEST USER', '0122345678', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'Viettel Post', '123456', 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (101, 2, '20250302-00101', '2025-03-02 10:15:00', 'MOMO', 3800000, 'Test User', '1234567890', '42/2, Long Thạnh Mỹ, Quận 9, Thủ Đức, TP.HCM', 'Giao Hàng Nhanh', '234567', 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (111, 1, '20250312-00111', '2025-03-12 10:30:00', 'ZALOPAY', 3600000, 'TEST USER', '0122345678', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'Giao Hàng Tiết Kiệm', '234568', 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (112, 2, '20250313-00112', '2025-03-13 14:50:00', 'COD', 4300000, 'Test User', '1234567890', '42/2, Long Thạnh Mỹ, Quận 9, Thủ Đức, TP.HCM', 'Viettel Post', '345679', 0, NULL, NULL, 'COMPLETED');
INSERT INTO `orders_v2` VALUES (194, 1, 'ORD123456', '2025-05-09 14:13:43', 'COD', 500000, 'Nguyễn Văn A', '0912345678', '123 Đường Lê Lợi, Quận 1, TP.HCM', 'GHTK', 'GHTK-XYZ-001', 0, 760, '00123', 'COMPLETED');
INSERT INTO `orders_v2` VALUES (195, 1, '123456', '2025-05-09 17:04:29', 'COD', 1120500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'COMPLETED');
INSERT INTO `orders_v2` VALUES (196, 1, '20250509-00001', '2025-05-09 17:16:07', 'COD', 500000, 'Nguyễn Văn A', '0912345678', '123 Đường Lê Lợi, Quận 1, TP.HCM', 'GHTK', 'GHTK-XYZ-001', 0, 760, '00123', 'COMPLETED');
INSERT INTO `orders_v2` VALUES (197, 1, '20250509-00002', '2025-05-09 17:18:13', 'COD', 2220500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'COMPLETED');
INSERT INTO `orders_v2` VALUES (198, 1, '20250509-00003', '2025-05-09 17:20:26', 'COD', 2220500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (199, 1, '20250510-00001', '2025-05-10 03:36:11', 'CASH', 1120500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (200, 1, '20250510-00002', '2025-05-10 03:36:13', 'CASH', 1120500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (214, 1, '20250511-00008', '2025-05-11 13:34:59', 'CASH', 12020500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (215, 1, '20250511-00009', '2025-05-11 13:35:40', 'CASH', 36020500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (216, 1, '20250511-00010', '2025-05-11 13:36:39', 'COD', 1120500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (217, 1, '20250511-00011', '2025-05-11 13:56:34', 'COD', 1120500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (218, 1, '20250511-00012', '2025-05-11 15:25:36', 'COD', 1120500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (219, 1, '20250511-00013', '2025-05-11 15:59:47', 'MOMO', 1570500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (220, 1, '20250511-00014', '2025-05-11 16:01:19', 'COD', 1120500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (221, 1, '20250511-00015', '2025-05-11 16:07:23', 'MOMO', 7020500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (222, 1, '20250511-00016', '2025-05-11 16:22:42', 'COD', 1370500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (223, 1, '20250516-00001', '2025-05-16 01:19:36', 'MOMO', 1120500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (224, 1, '20250517-00001', '2025-05-17 08:08:55', 'ZALOPAY', 1120500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (225, 1, '20250517-00002', '2025-05-17 11:14:44', 'MOMO', 1020500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (226, 1, '20250517-00003', '2025-05-17 11:38:00', 'CASH', 620500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (227, 1, '20250517-00004', '2025-05-17 11:56:14', 'CASH', 1570500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (228, 1, '20250529-00001', '2025-05-29 16:50:32', 'CASH', 6520500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (229, 1, '20250529-00002', '2025-05-29 16:51:31', 'CASH', 6520500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (230, 1, '20250602-00001', '2025-06-02 02:01:44', 'COD', 1120500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (231, 1, '20250602-00002', '2025-06-02 02:22:21', 'MOMO', 1120500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (232, 1, '20250602-00003', '2025-06-02 05:10:39', 'MOMO', 16670500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (233, 1, '20250602-00004', '2025-06-02 05:12:05', 'COD', 16670500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (234, 1, '20250602-00005', '2025-06-02 05:24:39', 'CASH', 870500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (235, 1, '20250602-00006', '2025-06-02 05:45:51', 'CASH', 6315375, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (236, 1, '20250602-00007', '2025-06-02 05:47:21', 'CASH', 1619500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (237, 1, '20250602-00008', '2025-06-02 06:07:24', 'MOMO', 14170500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (238, 1, '20250602-00009', '2025-06-02 06:22:39', 'MOMO', 3320500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (239, 1, '20250602-00010', '2025-06-02 06:23:01', 'COD', 3320500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (240, 1, '20250602-00011', '2025-06-02 06:27:13', 'MOMO', 819500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (241, 1, '20250602-00012', '2025-06-02 06:36:36', 'MOMO', 1120500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (242, 1, '20250602-00013', '2025-06-02 06:45:54', 'COD', 620500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (243, 1, '20250602-00014', '2025-06-02 06:47:29', 'MOMO', 1120500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (244, 1, '20250602-00015', '2025-06-02 06:50:11', 'COD', 2120500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (245, 1, '20250602-00016', '2025-06-02 06:51:17', 'MOMO', 7369500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (246, 1, '20250602-00017', '2025-06-02 08:13:43', 'COD', 620500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (247, 1, '20250602-00018', '2025-06-02 08:15:10', 'MOMO', 1570500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (250, 1, '20250602-00021', '2025-06-02 08:43:42', 'CASH', 9013875, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (251, 1, '20250602-00022', '2025-06-02 08:44:15', 'CASH', 1664625, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (252, 1, '20250602-00023', '2025-06-02 08:44:45', 'CASH', 8563875, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');
INSERT INTO `orders_v2` VALUES (254, 1, '20250602-00025', '2025-06-02 14:14:10', 'COD', 3419500, 'Nguyễn Văn A', '0123456789', 'Số 123, Đường ABC, Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', 'GHN', '123456', 0, 1489, '1A0205', 'AWAITING');

-- ----------------------------
-- Table structure for orders_v2_tracking
-- ----------------------------
DROP TABLE IF EXISTS `orders_v2_tracking`;
CREATE TABLE `orders_v2_tracking`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idOrder` int(11) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updateAt` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idOrder`(`idOrder` ASC) USING BTREE,
  INDEX `status`(`status` ASC) USING BTREE,
  CONSTRAINT `orders_v2_tracking_ibfk_1` FOREIGN KEY (`idOrder`) REFERENCES `orders_v2` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_v2_tracking_ibfk_2` FOREIGN KEY (`status`) REFERENCES `order_status` (`enumValue`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_v2_tracking
-- ----------------------------
INSERT INTO `orders_v2_tracking` VALUES (1, 1, 'pending', 'Cửa hàng Crocodile chi nhánh HCM ', 'Đơn hàng đang chờ xử lý', '2025-03-17 11:14:54');
INSERT INTO `orders_v2_tracking` VALUES (2, 1, 'processing', 'Cửa hàng Crocodile chi nhánh HCM', 'Đơn hàng đang được xử lý', '2025-03-17 11:30:58');
INSERT INTO `orders_v2_tracking` VALUES (3, 1, 'shipped ', 'Cửa hàng Crocodile chi nhánh HCM', 'Đơn hàng đã được giao cho đơn vị vận chuyển Viettel Post', '2025-03-18 11:17:03');
INSERT INTO `orders_v2_tracking` VALUES (4, 1, 'delivering', 'Đang trên đường giao', 'Đơn hàng đang trên đường giao cho khách', '2025-03-18 11:20:27');
INSERT INTO `orders_v2_tracking` VALUES (5, 1, 'success', 'Phường Linh Trung, Thủ Đức', 'Đơn hàng đã được giao thành công ', '2025-03-20 11:21:02');
INSERT INTO `orders_v2_tracking` VALUES (6, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'category_read', 'Category Management', 'Read');
INSERT INTO `permissions` VALUES (2, 'category_create', 'Category Management', 'Create');
INSERT INTO `permissions` VALUES (3, 'category_update', 'Category Management', 'Update');
INSERT INTO `permissions` VALUES (4, 'category_delete', 'Category Management', 'Delete');
INSERT INTO `permissions` VALUES (5, 'product_create', 'Product Management', 'Create');
INSERT INTO `permissions` VALUES (6, 'product_read', 'Product Management', 'Read');
INSERT INTO `permissions` VALUES (7, 'product_update', 'Product Management', 'Update');
INSERT INTO `permissions` VALUES (8, 'product_delete', 'Product Management', 'Delete');
INSERT INTO `permissions` VALUES (9, 'user_create', 'User Management', 'Create');
INSERT INTO `permissions` VALUES (10, 'user_read', 'User Management', 'Read');
INSERT INTO `permissions` VALUES (11, 'user_update', 'User Management', 'Update');
INSERT INTO `permissions` VALUES (12, 'user_delete', 'User Management', 'Delete');
INSERT INTO `permissions` VALUES (13, 'access_admin', 'Admin Page', 'Access');
INSERT INTO `permissions` VALUES (14, 'order_create', 'Order Management', 'Create');
INSERT INTO `permissions` VALUES (15, 'order_read', 'Order Management', 'Read');
INSERT INTO `permissions` VALUES (16, 'order_update', 'Order Management', 'Update');
INSERT INTO `permissions` VALUES (17, 'order_delete', 'Order Management', 'Delete');
INSERT INTO `permissions` VALUES (18, 'log_read', 'Log Management', 'Read');
INSERT INTO `permissions` VALUES (19, 'log_delete', 'Log Management', 'Delete');
INSERT INTO `permissions` VALUES (20, 'warehouse_create', 'Warehouse Management', 'Create');
INSERT INTO `permissions` VALUES (21, 'warehouse_read', 'Warehouse Management', 'Read');
INSERT INTO `permissions` VALUES (22, 'warehouse_update', 'Warehouse Management', 'Update');
INSERT INTO `permissions` VALUES (23, 'warehouse_delete', 'Warehouse Management', 'Delete');
INSERT INTO `permissions` VALUES (24, 'inventory_read', 'Inventory Management', 'Read');
INSERT INTO `permissions` VALUES (25, 'content_read', 'Content Management', 'Read');
INSERT INTO `permissions` VALUES (26, 'content_create', 'Content Management', 'Create');
INSERT INTO `permissions` VALUES (27, 'content_update', 'Content Management', 'Update');
INSERT INTO `permissions` VALUES (28, 'content_delete', 'Content Management', 'Delete');
INSERT INTO `permissions` VALUES (29, 'role_read', 'Role & Permission', 'Read');
INSERT INTO `permissions` VALUES (30, 'role_create', 'Role & Permission', 'Create');
INSERT INTO `permissions` VALUES (31, 'role_update', 'Role & Permission', 'Update');
INSERT INTO `permissions` VALUES (32, 'role_delete', 'Role & Permission', 'Delete');
INSERT INTO `permissions` VALUES (33, 'discount_read', 'Discount Management', 'Read');
INSERT INTO `permissions` VALUES (34, 'discount_create', 'Discount Management', 'Create');
INSERT INTO `permissions` VALUES (35, 'discount_update', 'Discount Management', 'Update');
INSERT INTO `permissions` VALUES (36, 'discount_delete', 'Discount Management', 'Delete');

-- ----------------------------
-- Table structure for product_attributes
-- ----------------------------
DROP TABLE IF EXISTS `product_attributes`;
CREATE TABLE `product_attributes`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProduct` int(10) UNSIGNED NULL DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_details-products`(`idProduct` ASC) USING BTREE,
  CONSTRAINT `fk_product_details-products` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 616 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_attributes
-- ----------------------------
INSERT INTO `product_attributes` VALUES (1, 1, 'Kích thước\r\n', '11 cm (dài) x 9,5 cm (cao)\r\n');
INSERT INTO `product_attributes` VALUES (2, 1, 'Chất liệu\r\n', 'Da cá sấu Thái Lan mặt ngoài, mặt trong da bò Italy\r\n');
INSERT INTO `product_attributes` VALUES (3, 1, 'Cam kết\r\n', 'Cam kết hoàn tiền lại nếu sản phẩm không phải da cá sấu và không giống như hình chụp.\r\n');
INSERT INTO `product_attributes` VALUES (4, 1, 'Thương hiệu\r\n', 'Gento\r\n');
INSERT INTO `product_attributes` VALUES (5, 2, 'Chất liệu', 'Da cá sấu mặt ngoài, mặt trong da bò');
INSERT INTO `product_attributes` VALUES (6, 2, 'Loại đế', 'Đế cao su');
INSERT INTO `product_attributes` VALUES (7, 2, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (8, 2, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (9, 2, 'Cam kết', 'Cam kết hoàn tiền lại nếu sản phẩm không phải da cá sấu và không giống như hình chụp.\r\nCam kết hoàn tiền 100% nếu sản phẩm không phải da cá sấu');
INSERT INTO `product_attributes` VALUES (10, 3, 'Kích thước', '20cm (dài) x 16.5cm (cao) x 12cm (rộng)');
INSERT INTO `product_attributes` VALUES (11, 3, 'Chất liệu', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (12, 3, 'Cam kết', 'Cam kết hoàn tiền lại nếu túi xách không phải là da cá sấu và không giống như hình chụp.');
INSERT INTO `product_attributes` VALUES (13, 3, 'Thương hiệu', 'Gento');
INSERT INTO `product_attributes` VALUES (14, 4, 'Chất liệu', 'Da cá sấu 100%');
INSERT INTO `product_attributes` VALUES (15, 4, 'Thương hiệu', 'Gento');
INSERT INTO `product_attributes` VALUES (16, 4, 'Loại da', 'Da bụng cá sấu');
INSERT INTO `product_attributes` VALUES (17, 4, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (18, 4, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (19, 4, 'Chính sách', 'Cam kết hoàn tiền lại nếu sản phẩm không phải là da thật và không giống như hình chụp');
INSERT INTO `product_attributes` VALUES (20, 5, 'Thương hiệu', 'GENK');
INSERT INTO `product_attributes` VALUES (21, 5, 'Loại da', 'Da bụng cá sấu');
INSERT INTO `product_attributes` VALUES (22, 5, 'Xuất xứ ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (23, 6, 'Thương hiệu ', 'Gento');
INSERT INTO `product_attributes` VALUES (24, 6, 'Xuất xứ ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (25, 6, 'Loại da', 'Da bụng cá sấu');
INSERT INTO `product_attributes` VALUES (26, 6, 'Màu sắc', 'Màu nâu');
INSERT INTO `product_attributes` VALUES (27, 6, 'Thiết kế', '19cm x 10cm x 2,5cm');
INSERT INTO `product_attributes` VALUES (28, 6, 'Mô tả ngắn', 'Ví cầm tay da cá sấu cao cấp GS982 nâu hoàn thiện tốt hơn vai trò công năng sử dụng nhờ sự đáp ứng cao cấp hơn yếu tố phân chia ô ngăn khoa học, thuận theo xu hướng sử dụng ví hiện đại');
INSERT INTO `product_attributes` VALUES (29, 7, 'Mô tả ngắn', 'Ví da nam Gento GS985 được làm từ chất liệu da cá sấu tự nhiên nhập khẩu từ Thái Lan – nơi nổi tiếng với việc chăm sóc và chế biến da cá sấu hàng đầu thế giới. Đây không chỉ là loại da bền bỉ và đẹp mắt...');
INSERT INTO `product_attributes` VALUES (30, 8, 'Mô tả ngắn', 'Ví gập đôi dáng ngang da hông cá sấu. Lớp bên trong làm từ da cá sấu, đảm bảo bền đẹp. Vân da phẳng, dễ dàng đút túi quần, không bị cộm.');
INSERT INTO `product_attributes` VALUES (31, 8, 'Loại da', 'Da bụng cá sấu');
INSERT INTO `product_attributes` VALUES (32, 8, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (33, 8, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (34, 9, 'Loại da', ' Da cá sấu vân bụng (vân trơn)');
INSERT INTO `product_attributes` VALUES (35, 9, 'Thiết kế', 'Ví ngang, 2 bên ngăn đối xứng');
INSERT INTO `product_attributes` VALUES (36, 9, 'Xuất xứ ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (37, 9, 'Màu sắc ', 'Đen');
INSERT INTO `product_attributes` VALUES (38, 10, 'Loại da', 'Da bụng cá sấu (vân trơn)');
INSERT INTO `product_attributes` VALUES (39, 10, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (40, 10, 'Thiết kết', 'Thiết kế sang trọng. Da cá sấu bên ngoài, bên trong ốp da bò');
INSERT INTO `product_attributes` VALUES (41, 10, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (42, 11, 'Màu sắc', 'Cam đất');
INSERT INTO `product_attributes` VALUES (45, 11, 'Thương hiệu', 'Lavatino');
INSERT INTO `product_attributes` VALUES (46, 11, 'Thiết kế', 'Kiểu dáng ngang sang trọng & lịch lãm');
INSERT INTO `product_attributes` VALUES (47, 11, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (48, 11, 'Mô tả ngắn', 'Sản phẩm được lấy cảm hứng từ phong cách sang trọng & lịch lãm của quý ông thành đạt. Chính điều đó đã khơi nguồn cảm hứng để chúng tôi mang tới bạn dòng sản phẩm đậm chất riêng và không có sự trùng lặp.');
INSERT INTO `product_attributes` VALUES (49, 12, 'Mô tả ngắn', 'Mẫu ví ngang cá sấu vân bụng 1 mặt được thiết kế riêng dành tặng phái mạnh sở hữu kiểu dáng gọn gàng với đầy đủ không gian chứa tiện ích bên trong. Sản phẩm được thực hiện chỉn chu từ nguồn nguyên liệu cao cấp');
INSERT INTO `product_attributes` VALUES (50, 13, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (51, 13, 'Loại da', 'Da cá sấu vân chân');
INSERT INTO `product_attributes` VALUES (52, 13, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (53, 14, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (54, 14, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (55, 14, 'Màu sắc', 'Màu đen');
INSERT INTO `product_attributes` VALUES (56, 14, 'Thiết kế', 'Da cá sấu 2 mặt bên trong và bên ngoài, sử dụng vân gù cao cấp');
INSERT INTO `product_attributes` VALUES (57, 14, 'Mô tả ngắn', 'Nét đẹp tinh tế và cuốn hút là những gì có thể mô tả cho dòng ví đứng cá sấu vân gù 2 mặt. Một sản phẩm thuộc dòng sản phẩm ví da cá sấu sở hữu chất lượng cao cấp với kiểu dáng nhỏ gọn, phù hợp với nhu cầu sử dụng...');
INSERT INTO `product_attributes` VALUES (58, 15, 'Mô tả ngắn', 'Mang hơi thở của nét đẹp cổ điển hòa quyện cùng dấu ấn theo thời gian mang đến dòng sản phẩm sở hữu kiểu dáng sang trọng & hiện đại. Noment Zpm một lần nữa khẳng đỉnh chất riêng dành cho phái mạnh.');
INSERT INTO `product_attributes` VALUES (59, 15, 'Thương hiệu', 'Lavatino');
INSERT INTO `product_attributes` VALUES (60, 15, 'Xuất xứ ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (61, 15, 'Loại da', 'Da bụng cá sấu, bên trong ltos da bò');
INSERT INTO `product_attributes` VALUES (62, 17, 'Mô tả ', 'Ví đứng kích thước cơ bản: 9,5*12*1,5 cm\r\nĐựng 8 – 10 ATM, CMND cũ, Giấy tờ xe (loại cũ), 3 Ngăn lớn đựng tiền (1 ngăn khóa), 1 ngăn đựng ảnh.');
INSERT INTO `product_attributes` VALUES (155, 50, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (156, 50, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (157, 50, 'Loại da', 'Da bụng cá sấu');
INSERT INTO `product_attributes` VALUES (158, 50, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (159, 50, 'Thiết kế', 'Thiết kế tinh sảo, sang trọng và quý phái');
INSERT INTO `product_attributes` VALUES (160, 51, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (161, 51, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (162, 51, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (163, 51, 'Nguồn gốc', 'Da cá sấu loại 1 nhập khẩu Thái Lan');
INSERT INTO `product_attributes` VALUES (164, 52, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (165, 52, 'Xuất xứ', 'Nhập khẩu Thái Lan');
INSERT INTO `product_attributes` VALUES (166, 52, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (167, 52, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (168, 52, 'Chính sách', 'Hoàn tiền 100% nếu sản phẩm không giống hình hoặc không phải da cá sấu thật.');
INSERT INTO `product_attributes` VALUES (169, 53, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (170, 53, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (171, 53, 'Loại da', 'Da bụng cá sấu');
INSERT INTO `product_attributes` VALUES (172, 53, 'Nguồn gốc', 'Da cá sấu nhập khẩu Thái Lan');
INSERT INTO `product_attributes` VALUES (173, 54, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (174, 54, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (175, 54, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (176, 54, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (177, 55, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (178, 55, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (179, 55, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (180, 55, 'Nguồn gốc', 'Da cá sấu nhập khẩu Thái Lan');
INSERT INTO `product_attributes` VALUES (181, 56, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (182, 56, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (183, 56, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (184, 56, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (185, 57, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (186, 57, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (187, 57, 'Loại da', 'Da vân bụng cá sấu');
INSERT INTO `product_attributes` VALUES (188, 57, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (189, 58, 'Thương hiệu', 'Gento');
INSERT INTO `product_attributes` VALUES (190, 58, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (191, 58, 'Loại da', 'Da bụng cá sấu');
INSERT INTO `product_attributes` VALUES (192, 58, 'Nguồn gốc', 'Da cá sấu nhập khẩu từ Thái Lan');
INSERT INTO `product_attributes` VALUES (193, 59, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (194, 59, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (195, 59, 'Loại da', 'Da bụng cá sấu');
INSERT INTO `product_attributes` VALUES (196, 59, 'Nguồn gốc', 'Da thật, nhập khẩu từ Thái Lan');
INSERT INTO `product_attributes` VALUES (197, 60, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (198, 60, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (199, 60, 'Loại da', 'Da bụng cá sấu');
INSERT INTO `product_attributes` VALUES (200, 60, 'Nguồn gốc', 'Da cá sấu nhập khẩu từ Thái Lan');
INSERT INTO `product_attributes` VALUES (201, 61, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (202, 61, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (203, 61, 'Loại da', 'Da bụng cá sấu');
INSERT INTO `product_attributes` VALUES (204, 61, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (205, 61, 'Chính sách', 'Hoàn tiền 100% nếu sản phẩm không giống hình.');
INSERT INTO `product_attributes` VALUES (206, 62, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (207, 62, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (208, 62, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (209, 62, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (210, 63, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (211, 63, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (212, 63, 'Loại da', 'Giả da cá sấu');
INSERT INTO `product_attributes` VALUES (213, 63, 'Nguồn gốc', 'Chất liệu giả da cá sấu');
INSERT INTO `product_attributes` VALUES (214, 64, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (215, 64, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (216, 64, 'Loại da', 'Da bụng cá sấu');
INSERT INTO `product_attributes` VALUES (217, 64, 'Nguồn gốc', 'Da cá sấu nhập khẩu Thái Lan');
INSERT INTO `product_attributes` VALUES (290, 83, 'Thương hiệu', 'abc');
INSERT INTO `product_attributes` VALUES (291, 83, 'Xuất xứ', 'abc');
INSERT INTO `product_attributes` VALUES (292, 83, 'Loại da', 'abc');
INSERT INTO `product_attributes` VALUES (293, 83, 'Nguồn gốc', 'abc');
INSERT INTO `product_attributes` VALUES (306, 87, 'Thương hiệu', 'OVENIS');
INSERT INTO `product_attributes` VALUES (307, 87, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (308, 87, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (309, 87, 'Nguồn gốc', 'Da cá sấu nhập khẩu Thái Lan');
INSERT INTO `product_attributes` VALUES (310, 87, 'Thiết kế', 'Kích thước: dài 27cm, ngang 21cm, rộng khoảng 3cm');
INSERT INTO `product_attributes` VALUES (311, 88, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (312, 88, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (313, 88, 'Loại da', 'Da bụng cá sấu');
INSERT INTO `product_attributes` VALUES (314, 88, 'Nguồn gốc', 'Nhập khẩu Thái Lan');
INSERT INTO `product_attributes` VALUES (315, 89, 'Thương hiệu', 'Ovenis');
INSERT INTO `product_attributes` VALUES (316, 89, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (317, 89, 'Loại da', 'Làm từ da bụng cá sấu');
INSERT INTO `product_attributes` VALUES (318, 89, 'Nguồn gốc', 'Da cá sấu Amazon');
INSERT INTO `product_attributes` VALUES (319, 90, 'Thương hiệu', 'Ovenis');
INSERT INTO `product_attributes` VALUES (320, 90, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (321, 90, 'Loại da', 'Da cá sấu chất lượng cao');
INSERT INTO `product_attributes` VALUES (322, 90, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (323, 91, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (324, 91, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (325, 91, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (326, 91, 'Nguồn gốc', 'Da cá sấu Amazon');
INSERT INTO `product_attributes` VALUES (327, 91, 'Thiết kế', 'Siu đẹp, siu bền');
INSERT INTO `product_attributes` VALUES (328, 92, 'Thương hiệu', 'Ovenis');
INSERT INTO `product_attributes` VALUES (329, 92, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (330, 92, 'Loại da', 'Da bụng cá sấu');
INSERT INTO `product_attributes` VALUES (331, 92, 'Nguồn gốc', 'Da nhập khẩu Thái Lan');
INSERT INTO `product_attributes` VALUES (332, 93, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (333, 93, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (334, 93, 'Loại da', 'Da Lưng cá sấu');
INSERT INTO `product_attributes` VALUES (335, 93, 'Nguồn gốc', 'Da cá sấu cao cấp');
INSERT INTO `product_attributes` VALUES (336, 94, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (337, 94, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (338, 94, 'Loại da', 'Làm từ da bụng cá sấu');
INSERT INTO `product_attributes` VALUES (339, 94, 'Nguồn gốc', 'Da cá sấu cao cấp');
INSERT INTO `product_attributes` VALUES (340, 94, 'Thiết kế', 'Siêu siêu đẹp');
INSERT INTO `product_attributes` VALUES (341, 95, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (342, 95, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (343, 95, 'Loại da', 'Da lưng cá sấu');
INSERT INTO `product_attributes` VALUES (344, 95, 'Nguồn gốc', 'Da nhập khẩu thái lan');
INSERT INTO `product_attributes` VALUES (345, 96, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (346, 96, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (347, 96, 'Loại da', 'Da bụng cá sáu');
INSERT INTO `product_attributes` VALUES (348, 96, 'Nguồn gốc', 'Da cá sấu Amazon');
INSERT INTO `product_attributes` VALUES (349, 97, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (350, 97, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (351, 97, 'Loại da', 'Da bụng cá sấu');
INSERT INTO `product_attributes` VALUES (352, 97, 'Nguồn gốc', 'Da cá sấu Amazon');
INSERT INTO `product_attributes` VALUES (353, 98, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (354, 98, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (355, 98, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (356, 98, 'Nguồn gốc', 'Da cá sấu cao cấp');
INSERT INTO `product_attributes` VALUES (357, 99, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (358, 99, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (359, 99, 'Loại da', 'Da bụng cá sấu');
INSERT INTO `product_attributes` VALUES (360, 99, 'Nguồn gốc', 'Da cá sấu cao cấp');
INSERT INTO `product_attributes` VALUES (361, 100, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (362, 100, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (363, 100, 'Loại da', 'Da cá sấu nguyên con');
INSERT INTO `product_attributes` VALUES (364, 100, 'Nguồn gốc', 'Da cá sấu amazon');
INSERT INTO `product_attributes` VALUES (365, 101, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (366, 101, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (367, 101, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (368, 101, 'Nguồn gốc', 'Da cá sấu nhập khẩu Thái Lan');
INSERT INTO `product_attributes` VALUES (369, 102, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (370, 102, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (371, 102, 'Loại da', 'Da cá sấu thật');
INSERT INTO `product_attributes` VALUES (372, 102, 'Nguồn gốc', 'Da cá sấu cao cấp');
INSERT INTO `product_attributes` VALUES (373, 103, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (374, 103, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (375, 103, 'Loại da', 'Da thật 100%');
INSERT INTO `product_attributes` VALUES (376, 103, 'Nguồn gốc', 'Da cá sấu nhập khẩu Thái Lan');
INSERT INTO `product_attributes` VALUES (377, 104, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (378, 104, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (379, 104, 'Loại da', 'Da cá sấu cao cấp');
INSERT INTO `product_attributes` VALUES (380, 104, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (381, 105, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (382, 105, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (383, 105, 'Loại da', 'Da bụng cá sấu');
INSERT INTO `product_attributes` VALUES (384, 105, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (385, 106, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (386, 106, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (387, 106, 'Loại da', 'Da bụng cá sấu');
INSERT INTO `product_attributes` VALUES (388, 106, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (397, 109, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (398, 109, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (399, 109, 'Loại da', 'Giả da cá sấu');
INSERT INTO `product_attributes` VALUES (400, 109, 'Nguồn gốc', 'Da giả');
INSERT INTO `product_attributes` VALUES (401, 110, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (402, 110, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (403, 110, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (404, 110, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (405, 111, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (406, 111, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (407, 111, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (408, 111, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (409, 112, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (410, 112, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (411, 112, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (412, 112, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (413, 113, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (414, 113, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (415, 113, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (416, 113, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (417, 114, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (418, 114, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (419, 114, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (420, 114, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (421, 115, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (422, 115, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (423, 115, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (424, 115, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (425, 116, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (426, 116, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (427, 116, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (428, 116, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (429, 117, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (430, 117, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (431, 117, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (432, 117, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (433, 118, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (434, 118, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (435, 118, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (436, 118, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (437, 119, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (438, 119, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (439, 119, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (440, 119, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (441, 120, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (442, 120, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (443, 120, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (444, 120, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (445, 121, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (446, 121, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (447, 121, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (448, 121, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (449, 122, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (450, 122, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (451, 122, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (452, 122, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (453, 123, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (454, 123, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (455, 123, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (456, 123, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (457, 124, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (458, 124, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (459, 124, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (460, 124, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (461, 125, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (462, 125, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (463, 125, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (464, 125, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (465, 126, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (466, 126, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (467, 126, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (468, 126, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (469, 127, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (470, 127, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (471, 127, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (472, 127, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (473, 128, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (474, 128, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (475, 128, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (476, 128, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (477, 129, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (478, 129, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (479, 129, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (480, 129, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (481, 130, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (482, 130, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (483, 130, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (484, 130, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (485, 131, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (486, 131, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (487, 131, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (488, 131, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (489, 132, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (490, 132, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (491, 132, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (492, 132, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (493, 133, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (494, 133, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (495, 133, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (496, 133, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (497, 134, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (498, 134, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (499, 134, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (500, 134, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (501, 135, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (502, 135, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (503, 135, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (504, 135, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (505, 136, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (506, 136, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (507, 136, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (508, 136, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (509, 137, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (510, 137, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (511, 137, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (512, 137, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (513, 138, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (514, 138, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (515, 138, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (516, 138, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (517, 139, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (518, 139, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (519, 139, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (520, 139, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (521, 140, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (522, 140, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (523, 140, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (524, 140, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (525, 141, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (526, 141, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (527, 141, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (528, 141, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (529, 142, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (530, 142, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (531, 142, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (532, 142, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (533, 143, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (534, 143, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (535, 143, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (536, 143, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (537, 144, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (538, 144, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (539, 144, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (540, 144, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (541, 145, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (542, 145, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (543, 145, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (544, 145, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (545, 146, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (546, 146, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (547, 146, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (548, 146, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (549, 147, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (550, 147, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (551, 147, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (552, 147, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (553, 148, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (554, 148, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (555, 148, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (556, 148, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (557, 149, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (558, 149, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (559, 149, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (560, 149, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (561, 150, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (562, 150, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (563, 150, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (564, 150, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (565, 151, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (566, 151, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (567, 151, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (568, 151, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (569, 152, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (570, 152, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (571, 152, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (572, 152, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (573, 153, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (574, 153, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (575, 153, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (576, 153, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (577, 154, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (578, 154, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (579, 154, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (580, 154, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (581, 155, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (582, 155, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (583, 155, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (584, 155, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (585, 156, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (586, 156, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (587, 156, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (588, 156, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (589, 157, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (590, 157, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (591, 157, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (592, 157, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (593, 158, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (594, 158, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (595, 158, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (596, 158, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (597, 159, 'Thương hiệu', 'Crocodile');
INSERT INTO `product_attributes` VALUES (598, 159, 'Xuất xứ', 'Việt Nam');
INSERT INTO `product_attributes` VALUES (599, 159, 'Loại da', 'Da cá sấu thật 100%');
INSERT INTO `product_attributes` VALUES (600, 159, 'Nguồn gốc', 'Da cá sấu Thái Lan');
INSERT INTO `product_attributes` VALUES (609, 162, 'Thương hiệu', 'Test');
INSERT INTO `product_attributes` VALUES (610, 162, 'Xuất xứ', 'Test');
INSERT INTO `product_attributes` VALUES (611, 162, 'Loại da', 'Test');
INSERT INTO `product_attributes` VALUES (612, 162, 'Nguồn gốc', 'Test');
INSERT INTO `product_attributes` VALUES (613, 162, 'Thiết kế', 'Test');
INSERT INTO `product_attributes` VALUES (614, 162, 'Chính sách', 'Test');
INSERT INTO `product_attributes` VALUES (615, 162, 'Test', 'Test');

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProduct` int(10) UNSIGNED NULL DEFAULT NULL,
  `index` int(11) NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_images-products`(`idProduct` ASC) USING BTREE,
  INDEX `index`(`index` ASC) USING BTREE,
  CONSTRAINT `fk_product_images-products` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 175 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_images
-- ----------------------------
INSERT INTO `product_images` VALUES (1, 1, 0, 'https://www.gento.vn/wp-content/uploads/2024/07/vi-nam-da-ca-sau8.jpg');
INSERT INTO `product_images` VALUES (2, 1, 1, 'https://www.gento.vn/wp-content/uploads/2024/07/vi-nam-da-ca-sau4.jpg');
INSERT INTO `product_images` VALUES (3, 1, 2, 'https://www.gento.vn/wp-content/uploads/2024/07/vi-nam-da-ca-sau3.jpg');
INSERT INTO `product_images` VALUES (4, 1, 3, 'https://www.gento.vn/wp-content/uploads/2024/05/vi-da-ca-sau-nam-3.jpg');
INSERT INTO `product_images` VALUES (5, 2, 1, 'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m34htcbgjimx5b.webp');
INSERT INTO `product_images` VALUES (6, 2, 2, 'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m3gngaydahew02.webp');
INSERT INTO `product_images` VALUES (7, 2, 3, 'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m3gngaydagtxb8.webp');
INSERT INTO `product_images` VALUES (8, 2, 4, 'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m34htcbgkx7d91.webp');
INSERT INTO `product_images` VALUES (9, 3, 1, 'https://www.gento.vn/wp-content/uploads/2024/04/Tui-xach-da-ca-sau-hang-hieu-gento-gs10033.jpg');
INSERT INTO `product_images` VALUES (10, 3, 2, 'https://www.gento.vn/wp-content/uploads/2024/04/Tui-xach-da-ca-sau-hang-hieu-gento-gs10031.jpg');
INSERT INTO `product_images` VALUES (11, 3, 3, 'https://www.gento.vn/wp-content/uploads/2024/04/Tui-xach-da-ca-sau-hang-hieu-gento-gs100312.jpg');
INSERT INTO `product_images` VALUES (12, 4, 1, 'https://www.gento.vn/wp-content/uploads/2024/06/tui-cam-tay-da-bo-dap-van4.jpg');
INSERT INTO `product_images` VALUES (13, 4, 2, 'https://www.gento.vn/wp-content/uploads/2024/06/tui-cam-tay-da-bo-dap-van8.jpg');
INSERT INTO `product_images` VALUES (14, 4, 3, 'https://www.gento.vn/wp-content/uploads/2024/06/tui-cam-tay-da-bo-dap-van6.jpg');
INSERT INTO `product_images` VALUES (15, 4, 0, 'https://www.gento.vn/wp-content/uploads/2024/06/tui-cam-tay-da-bo3.jpg');
INSERT INTO `product_images` VALUES (16, 2, 0, 'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m34htcbgjiqj0d@resize_w450_nl.webp');
INSERT INTO `product_images` VALUES (17, 3, 0, 'https://www.gento.vn/wp-content/uploads/2024/04/Tui-xach-da-ca-sau-hang-hieu-gento-gs1003.jpg');
INSERT INTO `product_images` VALUES (18, 5, 0, 'https://down-vn.img.susercontent.com/file/8f299495a4c4e172fab7ff80d40d5fb4.webp');
INSERT INTO `product_images` VALUES (19, 7, 0, 'https://www.gento.vn/wp-content/uploads/2023/11/vi-da-ca-sau-nam-cao-cap10.jpg');
INSERT INTO `product_images` VALUES (20, 7, 1, 'https://www.gento.vn/wp-content/uploads/2023/11/vi-da-ca-sau-nam-cao-cap1.jpg');
INSERT INTO `product_images` VALUES (21, 7, 2, 'https://www.gento.vn/wp-content/uploads/2023/11/vi-da-ca-sau-nam-cao-cap8.jpg');
INSERT INTO `product_images` VALUES (22, 7, 3, 'https://www.gento.vn/wp-content/uploads/2023/11/vi-da-ca-sau-nam-cao-cap9.jpg');
INSERT INTO `product_images` VALUES (23, 8, 0, 'https://i0.wp.com/tamanh.net/wp-content/uploads/2020/01/vi-da-hong-ca-sau-VTA1500N-H-D-5.jpg?fit=960%2C1200&ssl=1');
INSERT INTO `product_images` VALUES (24, 8, 1, 'https://i0.wp.com/tamanh.net/wp-content/uploads/2020/01/vi-da-hong-ca-sau-VTA1500N-H-D-1.jpg?resize=960%2C1000&ssl=1');
INSERT INTO `product_images` VALUES (25, 8, 2, 'https://i0.wp.com/tamanh.net/wp-content/uploads/2020/01/vi-da-hong-ca-sau-VTA1500N-H-D-2.jpg?resize=960%2C1000&ssl=1');
INSERT INTO `product_images` VALUES (26, 8, 3, 'https://i0.wp.com/tamanh.net/wp-content/uploads/2020/01/vi-da-hong-ca-sau-VTA1500N-H-D-3.jpg?resize=960%2C1000&ssl=1');
INSERT INTO `product_images` VALUES (27, 10, 0, 'https://lavatino.com/wp-content/uploads/2019/10/DSC03475.jpg');
INSERT INTO `product_images` VALUES (28, 10, 1, 'https://lavatino.com/wp-content/uploads/2019/10/6-1.jpg');
INSERT INTO `product_images` VALUES (29, 10, 2, 'https://lavatino.com/wp-content/uploads/2019/10/DSC03478.jpg');
INSERT INTO `product_images` VALUES (30, 10, 3, 'https://lavatino.com/wp-content/uploads/2019/10/5-2.jpg');
INSERT INTO `product_images` VALUES (31, 11, 0, 'https://lavatino.com/wp-content/uploads/2019/10/DSC02914-1000x1000-1.jpg');
INSERT INTO `product_images` VALUES (32, 11, 1, 'https://lavatino.com/wp-content/uploads/2023/04/vi-ngang-ca-sau-van-bung-1-mat-2342-5.jpg');
INSERT INTO `product_images` VALUES (33, 11, 2, 'https://lavatino.com/wp-content/uploads/2019/10/DSC02954.jpg');
INSERT INTO `product_images` VALUES (34, 11, 3, 'https://lavatino.com/wp-content/uploads/2023/04/vi-ngang-ca-sau-van-bung-1-mat-2342-4.jpg');
INSERT INTO `product_images` VALUES (35, 15, 0, 'https://lavatino.com/wp-content/uploads/2023/07/vi-dai-da-ca-sau-chinh-hang-lavatino-37-595x595.jpg');
INSERT INTO `product_images` VALUES (36, 15, 1, 'https://lavatino.com/wp-content/uploads/2023/07/vi-dai-da-ca-sau-chinh-hang-lavatino-38-595x595.jpg');
INSERT INTO `product_images` VALUES (37, 15, 2, 'https://lavatino.com/wp-content/uploads/2023/07/vi-dai-da-ca-sau-chinh-hang-lavatino-40-595x595.jpg');
INSERT INTO `product_images` VALUES (38, 16, 0, 'https://lavatino.com/wp-content/uploads/2023/06/MGL7695-595x595.jpg');
INSERT INTO `product_images` VALUES (39, 16, 1, 'https://lavatino.com/wp-content/uploads/2023/06/MGL7808-595x595.jpg');
INSERT INTO `product_images` VALUES (40, 16, 2, 'https://lavatino.com/wp-content/uploads/2023/06/MGL7796-595x595.jpg');
INSERT INTO `product_images` VALUES (41, 16, 3, 'https://lavatino.com/wp-content/uploads/2023/10/cls24-595x595.jpg');
INSERT INTO `product_images` VALUES (83, 50, 0, 'https://m.media-amazon.com/images/I/71d-u5eLEsL._AC_SY500_.jpg');
INSERT INTO `product_images` VALUES (84, 50, 1, 'https://m.media-amazon.com/images/I/61gvtGm4RRL._AC_SY500_.jpg');
INSERT INTO `product_images` VALUES (85, 50, 2, 'https://m.media-amazon.com/images/I/71T-gh33XAL._AC_SY500_.jpg');
INSERT INTO `product_images` VALUES (86, 51, 0, 'https://product.hstatic.net/1000260559/product/that-lung-da-ca-sau-ban-3-4cm-khoa-tu-dong-den-4409705__1__35b85fb086f24eedae59b4f60e4467ec_master.jpg');
INSERT INTO `product_images` VALUES (87, 51, 1, 'https://product.hstatic.net/1000260559/product/that-lung-da-ca-sau-ban-3-4cm-khoa-tu-dong-den-4409705__3__06fc5cda169143b6a41f350b63029a53_master.jpg');
INSERT INTO `product_images` VALUES (88, 51, 2, 'https://product.hstatic.net/1000260559/product/that-lung-da-ca-sau-ban-3-4cm-khoa-tu-dong-den-4409705__2__75762afce2704bdab78e75ebf608aa0d_master.jpg');
INSERT INTO `product_images` VALUES (89, 52, 0, 'https://product.hstatic.net/1000260559/product/that-lung-khoa-tu-dong-da-ca-sau-lien-khong-noi-3988890__4__9215cfb7954b4b898b96e099fb98321d_master.jpg');
INSERT INTO `product_images` VALUES (90, 53, 0, 'https://product.hstatic.net/1000260559/product/o1cn01oeewq11v7ifncguqb_31065461__1__1499322813aa4128978245709bf087fe_master.jpg');
INSERT INTO `product_images` VALUES (91, 53, 1, 'https://product.hstatic.net/1000260559/product/o1cn01hkyiit1v7ifj2x2hv_31065461__1__eb314672172140208a55a75d83c7e53f_master.jpg');
INSERT INTO `product_images` VALUES (92, 53, 2, 'https://product.hstatic.net/1000260559/product/o1cn01oeewq11v7ifncguqb_31065461__1__1499322813aa4128978245709bf087fe_master.jpg');
INSERT INTO `product_images` VALUES (93, 54, 0, 'https://product.hstatic.net/1000260559/product/that-lung-da-ca-sau-khoa-cai-3334472__1__2b62d52a5d864f7583ceb22370b97b9a_master.jpg');
INSERT INTO `product_images` VALUES (94, 55, 0, 'https://product.hstatic.net/1000260559/product/that-lung-khoa-cai-da-ca-sau-mat-chu-z-3334471__2__266ea1c053614ae09cd9c2f55b1d536e_master.jpg');
INSERT INTO `product_images` VALUES (95, 56, 0, 'https://product.hstatic.net/1000260559/product/15947417404_484342603_2a2fc0ba844b4ef68791262ea491b3f7_master.jpg');
INSERT INTO `product_images` VALUES (96, 57, 0, 'https://product.hstatic.net/1000260559/product/that-lung-ca-sau-khoa-cai-cao-cap-2925664__1__bddcd41a99134f368fcc1bd867e0951f_master.jpg');
INSERT INTO `product_images` VALUES (97, 58, 0, 'https://www.gento.vn/wp-content/uploads/2023/06/vali-da-ca-sau-cao-cap4.jpg');
INSERT INTO `product_images` VALUES (98, 59, 0, 'https://www.oj-exclusive.com/wp-content/uploads/ORANG-CROCODILE-LUGGAGE-FRONT.jpg');
INSERT INTO `product_images` VALUES (99, 59, 1, 'https://www.oj-exclusive.com/wp-content/uploads/ORANG-CROCODILE-LUGGAGE-BACK.jpg');
INSERT INTO `product_images` VALUES (100, 59, 2, 'https://www.oj-exclusive.com/wp-content/uploads/ORANG-CROCODILE-LUGGAGE.jpg');
INSERT INTO `product_images` VALUES (101, 60, 0, 'https://tamma.vn/images/2018/vali-xach-tay-gia-da-ca-sau-khoa-tsa-size-20-den-01.jpg');
INSERT INTO `product_images` VALUES (102, 60, 1, 'https://tamma.vn/images/2018/vali-xach-tay-gia-da-ca-sau-khoa-tsa-size-20-den-02.jpg');
INSERT INTO `product_images` VALUES (103, 61, 0, 'https://tuidacasau.vn/images/2020/12/vali-du-lich-da-ca-sau-cao-cap-aea4-12.jpg');
INSERT INTO `product_images` VALUES (104, 61, 1, 'https://tuidacasau.vn/images/2020/12/vali-du-lich-da-ca-sau-cao-cap-aea4-3.jpg');
INSERT INTO `product_images` VALUES (105, 62, 0, 'https://mia.vn/media/uploads/tin-tuc/vali-da-bo-brucegao-spinner-1713766880.jpg');
INSERT INTO `product_images` VALUES (106, 63, 0, 'https://s.alicdn.com/@sc04/kf/HTB17P1waiMnBKNjSZFoq6zOSFXaK.jpg_720x720q50.jpg');
INSERT INTO `product_images` VALUES (108, 64, 0, 'https://thienanstore.com/wp-content/uploads/2020/10/tui-cong-so-nam-da-bo-van-ca-sau-sang-trong-PL013-2-510x512.jpg');
INSERT INTO `product_images` VALUES (132, 83, 0, 'https://crocodile.nludemo.id.vn/uploads/images/categories/cate-14.png');
INSERT INTO `product_images` VALUES (133, 83, 1, 'https://crocodile.nludemo.id.vn/uploads/images/carousels/carousel1.png');
INSERT INTO `product_images` VALUES (134, 83, 2, 'https://crocodile.nludemo.id.vn/uploads/images/carousels/carousel2.png');
INSERT INTO `product_images` VALUES (138, 87, 0, 'https://bizweb.dktcdn.net/thumb/grande/100/376/377/products/clutch-cam-tay-da-ca-sau-120.jpg?v=1611457255957');
INSERT INTO `product_images` VALUES (139, 87, 1, 'https://bizweb.dktcdn.net/thumb/1024x1024/100/376/377/products/clutch-cam-tay-da-ca-sau-123.jpg?v=1611457255957');
INSERT INTO `product_images` VALUES (140, 87, 2, 'https://bizweb.dktcdn.net/thumb/1024x1024/100/376/377/products/clutch-cam-tay-da-ca-sau-121.jpg?v=1611457255957');
INSERT INTO `product_images` VALUES (142, 88, 0, 'https://thegioibut.com/wp-content/uploads/2024/05/montblanc-meisterstuck-selection-black-long-wallet-12cc-mb126646-3_optimized-683x1024.jpg');
INSERT INTO `product_images` VALUES (143, 89, 0, 'https://bizweb.dktcdn.net/thumb/1024x1024/100/376/377/products/clutch-cam-tay-da-ca-sau-163.jpg?v=1610956796353');
INSERT INTO `product_images` VALUES (144, 90, 0, 'https://down-vn.img.susercontent.com/file/cn-11134207-7r98o-lqd23c3okcol0e.webp');
INSERT INTO `product_images` VALUES (145, 90, 1, 'https://down-vn.img.susercontent.com/file/cn-11134207-7r98o-lqd23c3ozsxhb2.webp');
INSERT INTO `product_images` VALUES (146, 90, 2, 'https://down-vn.img.susercontent.com/file/cn-11134207-7r98o-lqd23c3o4w7s7e.webp');
INSERT INTO `product_images` VALUES (147, 91, 0, 'https://down-vn.img.susercontent.com/file/47a230c652a17d403f9b07da6eca3dab.webp');
INSERT INTO `product_images` VALUES (148, 91, 1, 'https://down-vn.img.susercontent.com/file/dfd4344c54056c51b48cb8f00985ed7a.webp');
INSERT INTO `product_images` VALUES (149, 91, 2, 'https://down-vn.img.susercontent.com/file/7f44ee2468426186f5ecef2c3adaf76f.webp');
INSERT INTO `product_images` VALUES (150, 92, 0, 'https://laforce.vn/wp-content/uploads/2024/02/tui-da-nam-cao-cap-TLA9807-5-CF.jpg');
INSERT INTO `product_images` VALUES (151, 92, 1, 'https://laforce.vn/wp-content/uploads/2024/02/cap-da-chinh-hang-TLA9807-5-CF.jpg');
INSERT INTO `product_images` VALUES (152, 92, 2, 'https://laforce.vn/wp-content/uploads/2024/02/cap-da-cao-cap-TLA9807-5-CF.jpg');
INSERT INTO `product_images` VALUES (153, 93, 0, 'https://www.daydongho.com.vn/wp-content/uploads/2021/07/z2594567829743_8b142c48889fb74dc87b0bb13336d358-510x383.jpg');
INSERT INTO `product_images` VALUES (154, 93, 1, 'https://www.daydongho.com.vn/wp-content/uploads/2021/07/z2594567846278_9301f89ef9c7b3411966333232b06d00-510x383.jpg');
INSERT INTO `product_images` VALUES (155, 94, 0, 'http://dachat.vn/wp-content/uploads/2020/07/20-600x600.jpg');
INSERT INTO `product_images` VALUES (156, 94, 1, 'http://dachat.vn/wp-content/uploads/2020/07/19-600x600.jpg');
INSERT INTO `product_images` VALUES (157, 95, 0, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQQVJHkfiCo-Xnf36puDWUsq72V1kGKj2ZywE7deGG1j3Q7egJojx1s8VqeR_n__jrT7Qf1-WsiwuLuwTL1Key7Mt0T1VwPIcJpXmEvDLHEtUyvIxKUx0x25zM&usqp=CAE');
INSERT INTO `product_images` VALUES (158, 96, 0, 'https://bizweb.dktcdn.net/thumb/1024x1024/100/364/978/products/tui-xach-nam-full-da-ca-alligator-3.jpg?v=1730894462887');
INSERT INTO `product_images` VALUES (159, 97, 0, 'https://phukiengiasicamau.com/wp-content/uploads/2019/09/69212545_1110397735819477_4122638746929594368_n.x20904.jpg');
INSERT INTO `product_images` VALUES (160, 98, 0, 'https://casauphuongdong.com/wp-content/uploads/2023/05/z5819091666916_af64eba3daa9f8890ed51e0cba93207f.jpg');
INSERT INTO `product_images` VALUES (161, 99, 0, 'https://casauphuongdong.com/wp-content/uploads/2023/02/tui-xach-da-ca-sau-ct3300-do-6.jpg');
INSERT INTO `product_images` VALUES (162, 100, 0, 'https://casauphuongdong.com/wp-content/uploads/2019/02/tui-dau-nho.jpg');
INSERT INTO `product_images` VALUES (163, 101, 0, 'https://casauphuongdong.com/wp-content/uploads/2023/09/z4658532209737_1112cba25e4008a3ea3deb32f7d0af2f-1024x1024.jpg');
INSERT INTO `product_images` VALUES (164, 102, 0, 'https://casauphuongdong.com/wp-content/uploads/2021/06/tui-deo-cheo-da-ca-sau-T6545-3-1.jpg');
INSERT INTO `product_images` VALUES (165, 103, 0, 'https://casauphuongdong.com/wp-content/uploads/2024/08/z5775309079745_eb2c83c763dcac93780df7f18ab0a866.jpg');
INSERT INTO `product_images` VALUES (166, 104, 0, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTHzGD2GTP-1OlMkgXepljFNX6Uu2VpdNpZ7okYNLwEYIc3S7QiwFqezb4TuXBWaAC51n6Ubah8nZX528daZkyFIthFvzH4LN0Awb6dodAof3klX5qCBc5PZnpnAnxi-Qyy6MmtYXDScg&usqp=CAc');
INSERT INTO `product_images` VALUES (167, 105, 0, 'https://bizweb.dktcdn.net/thumb/grande/100/376/377/products/tui-cam-tay-nam-da-ca-sau-ovenis-5.jpg?v=1625627214333');
INSERT INTO `product_images` VALUES (168, 106, 0, 'https://daynitcasau.vn/wp-content/uploads/2022/12/daynitcasau.vn-tui-da-ca-sau-hermes-kelly-mini-vang-chanh-1.jpg');
INSERT INTO `product_images` VALUES (174, 162, 0, 'https://crocodile.nludemo.id.vn/uploads/images/categories/cate-1.png');

-- ----------------------------
-- Table structure for product_options
-- ----------------------------
DROP TABLE IF EXISTS `product_options`;
CREATE TABLE `product_options`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProduct` int(10) UNSIGNED NULL DEFAULT NULL,
  `group` int(1) NULL DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `idImage` int(10) UNSIGNED NULL DEFAULT NULL,
  `imageIndex` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_options-produts`(`idProduct` ASC) USING BTREE,
  INDEX `fk_product_options-product_images`(`idImage` ASC) USING BTREE,
  INDEX `fk_product_options-product_images_index`(`imageIndex` ASC) USING BTREE,
  CONSTRAINT `fk_product_options-product_images` FOREIGN KEY (`idImage`) REFERENCES `product_images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_options-produts` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_options
-- ----------------------------
INSERT INTO `product_options` VALUES (1, 1, 1, 'Loại da', 'Da lưng', NULL, 0);
INSERT INTO `product_options` VALUES (2, 1, 1, 'Loại da', 'Da bụng', NULL, 3);
INSERT INTO `product_options` VALUES (4, 2, 1, 'Màu sắc', 'Nâu', NULL, 2);
INSERT INTO `product_options` VALUES (5, 2, 1, 'Màu sắc', 'Đen', NULL, 1);
INSERT INTO `product_options` VALUES (6, 2, 2, 'Size', '40', NULL, NULL);
INSERT INTO `product_options` VALUES (7, 2, 2, 'Size', '41', NULL, NULL);
INSERT INTO `product_options` VALUES (8, 2, 2, 'Size', '42', NULL, NULL);
INSERT INTO `product_options` VALUES (9, 4, 1, 'Màu sắc', 'Nâu', NULL, 2);
INSERT INTO `product_options` VALUES (10, 4, 1, 'Màu sắc', 'Đen', NULL, 1);
INSERT INTO `product_options` VALUES (11, 7, 1, 'Màu', 'Nâu', NULL, 2);
INSERT INTO `product_options` VALUES (12, 7, 1, 'Màu', 'Đen', NULL, 0);
INSERT INTO `product_options` VALUES (13, 10, 1, 'Màu sắc ', 'Nâu đen', NULL, 0);
INSERT INTO `product_options` VALUES (14, 10, 1, 'Màu sắc', 'Cam', NULL, 2);
INSERT INTO `product_options` VALUES (15, 16, 1, 'Màu sắc', 'Xanh đậm', NULL, 0);
INSERT INTO `product_options` VALUES (16, 16, 1, 'Màu sắc', 'Đỏ', NULL, 3);
INSERT INTO `product_options` VALUES (62, 53, 1, 'Màu Sắc', 'Đen', NULL, 1);
INSERT INTO `product_options` VALUES (63, 53, 1, 'Màu Sắc', 'Nâu', NULL, 2);
INSERT INTO `product_options` VALUES (64, 61, 1, 'Màu Sắc', 'Đen', NULL, 0);
INSERT INTO `product_options` VALUES (65, 61, 1, 'Màu Sắc', 'Nâu', NULL, 1);
INSERT INTO `product_options` VALUES (66, 63, 1, 'Kích thước', 'Nhỏ', NULL, 1);
INSERT INTO `product_options` VALUES (67, 63, 1, 'Kích thước', 'Vừa', NULL, 1);
INSERT INTO `product_options` VALUES (68, 63, 1, 'Kích thước', 'Lớn', NULL, 1);
INSERT INTO `product_options` VALUES (79, 83, 1, 'Mau Sac', 'Do', NULL, 1);
INSERT INTO `product_options` VALUES (80, 83, 2, 'Size', '12', NULL, NULL);
INSERT INTO `product_options` VALUES (81, 83, 2, 'Size', '13', NULL, NULL);
INSERT INTO `product_options` VALUES (82, 83, 1, 'Mau Sac', 'Den', NULL, 2);
INSERT INTO `product_options` VALUES (83, 155, 1, 'Size', '40', NULL, NULL);
INSERT INTO `product_options` VALUES (84, 155, 1, 'Size', '41', NULL, NULL);
INSERT INTO `product_options` VALUES (85, 155, 1, 'Size', '42', NULL, NULL);
INSERT INTO `product_options` VALUES (86, 156, 1, 'Size', '44', NULL, NULL);
INSERT INTO `product_options` VALUES (87, 156, 1, 'Size', '45', NULL, NULL);
INSERT INTO `product_options` VALUES (88, 156, 1, 'Size', '46', NULL, NULL);
INSERT INTO `product_options` VALUES (89, 157, 1, 'Size', '43', NULL, NULL);
INSERT INTO `product_options` VALUES (90, 157, 2, 'Màu', 'Đen', NULL, NULL);
INSERT INTO `product_options` VALUES (91, 157, 1, 'Size', '44', NULL, NULL);
INSERT INTO `product_options` VALUES (92, 158, 1, 'Size', '43', NULL, NULL);
INSERT INTO `product_options` VALUES (93, 158, 1, 'Size', '44', NULL, NULL);
INSERT INTO `product_options` VALUES (94, 159, 1, 'Size', '43', NULL, NULL);
INSERT INTO `product_options` VALUES (95, 159, 1, 'Size', '44', NULL, NULL);
INSERT INTO `product_options` VALUES (96, 159, 1, 'Size', '45', NULL, NULL);

-- ----------------------------
-- Table structure for product_review_likes
-- ----------------------------
DROP TABLE IF EXISTS `product_review_likes`;
CREATE TABLE `product_review_likes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `reviewId`(`reviewId` ASC, `userId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_review_likes
-- ----------------------------

-- ----------------------------
-- Table structure for product_reviews
-- ----------------------------
DROP TABLE IF EXISTS `product_reviews`;
CREATE TABLE `product_reviews`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProduct` int(10) UNSIGNED NOT NULL,
  `idVariant` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `rating` int(11) NULL DEFAULT NULL CHECK (`rating` between 1 and 5),
  `reviewText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `productQuality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `matchDescription` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createdAt` datetime NULL DEFAULT current_timestamp(),
  `isShowUsername` int(11) NULL DEFAULT NULL,
  `sellerReply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `replyTime` datetime NULL DEFAULT NULL,
  `likeCount` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user`(`idUser` ASC) USING BTREE,
  INDEX `fk_review_product`(`idProduct` ASC) USING BTREE,
  CONSTRAINT `fk_review_product` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_user` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_reviews
-- ----------------------------
INSERT INTO `product_reviews` VALUES (2, 1, 2, 1, 5, 'Sản phẩm đẹp đúng với mô tả', 'tốt', 'đúng, đẹp', '2025-05-14 14:02:14', 0, NULL, NULL, 5);
INSERT INTO `product_reviews` VALUES (9, 5, 11, 1, 5, '', 'tốt', 'đúng', '2025-06-02 04:18:10', 1, NULL, NULL, 0);
INSERT INTO `product_reviews` VALUES (10, 57, 81, 1, 4, '', 'test', 'đúng', '2025-06-02 04:18:43', 1, NULL, NULL, 0);
INSERT INTO `product_reviews` VALUES (11, 130, 165, 1, 5, '', 'tốt', 'đúng', '2025-06-02 04:20:02', 1, NULL, NULL, 0);
INSERT INTO `product_reviews` VALUES (14, 83, 115, 1, 4, 'hẹ hẹ hẹ', 'test', 'test', '2025-06-02 09:40:16', 0, NULL, NULL, 0);
INSERT INTO `product_reviews` VALUES (15, 83, 115, 1, 5, 'hẹ hẹ hẹ', 'test', 'đúng', '2025-06-02 09:48:04', 0, NULL, NULL, 0);
INSERT INTO `product_reviews` VALUES (16, 1, 1, 1, 5, '', 'test', 'đúng', '2025-06-02 10:12:06', 1, NULL, NULL, 0);
INSERT INTO `product_reviews` VALUES (17, 1, 2, 1, 5, 'Very good', 'Good', 'Good', '2025-06-02 10:12:42', 1, NULL, NULL, 1);

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
  `idSupplier` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_variants-products`(`idProduct` ASC) USING BTREE,
  INDEX `fk_product_variants-product_options_1`(`idOption1` ASC) USING BTREE,
  INDEX `fk_product_variants-product_options_2`(`idOption2` ASC) USING BTREE,
  INDEX `idSupplier`(`idSupplier` ASC) USING BTREE,
  CONSTRAINT `fk_product_variants-product_options_1` FOREIGN KEY (`idOption1`) REFERENCES `product_options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_variants-product_options_2` FOREIGN KEY (`idOption2`) REFERENCES `product_options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_variants-products` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_variants_ibfk_1` FOREIGN KEY (`idSupplier`) REFERENCES `suppliers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 211 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_variants
-- ----------------------------
INSERT INTO `product_variants` VALUES (1, 1, 'VN-V706-DaBung-Den', 2, NULL, 737, 1);
INSERT INTO `product_variants` VALUES (2, 1, 'VN-V706_DaLung-Den', 1, NULL, 1731, 3);
INSERT INTO `product_variants` VALUES (3, 2, 'SKU-Den-40', 5, 6, 1525, 2);
INSERT INTO `product_variants` VALUES (4, 2, 'SKU-Den-41', 5, 7, 2525, 8);
INSERT INTO `product_variants` VALUES (5, 2, 'SKU-Den-42', 5, 8, 1699, 2);
INSERT INTO `product_variants` VALUES (6, 2, 'SKU-Nau-40', 4, 6, 496, 4);
INSERT INTO `product_variants` VALUES (7, 2, 'SKU-Nau-41', 4, 7, 548, 5);
INSERT INTO `product_variants` VALUES (8, 2, 'SKU-Nau-42', 4, 8, 425, NULL);
INSERT INTO `product_variants` VALUES (9, 4, 'SKU-Nau', 9, NULL, 37, NULL);
INSERT INTO `product_variants` VALUES (10, 4, 'SKU-Den', 10, NULL, 52, NULL);
INSERT INTO `product_variants` VALUES (11, 5, NULL, NULL, NULL, 93, NULL);
INSERT INTO `product_variants` VALUES (12, 3, NULL, NULL, NULL, 77, NULL);
INSERT INTO `product_variants` VALUES (13, 6, NULL, NULL, NULL, 76, NULL);
INSERT INTO `product_variants` VALUES (14, 7, 'SKU-Den', 11, NULL, 32, NULL);
INSERT INTO `product_variants` VALUES (15, 7, 'SKU-Nau', 12, NULL, 33, NULL);
INSERT INTO `product_variants` VALUES (16, 8, NULL, NULL, NULL, 199, NULL);
INSERT INTO `product_variants` VALUES (17, 9, NULL, NULL, NULL, 222, NULL);
INSERT INTO `product_variants` VALUES (18, 10, 'sku-nauden', 13, NULL, 122, NULL);
INSERT INTO `product_variants` VALUES (19, 10, 'sku-cam', 14, NULL, 98, NULL);
INSERT INTO `product_variants` VALUES (20, 11, NULL, NULL, NULL, 326, NULL);
INSERT INTO `product_variants` VALUES (21, 12, NULL, NULL, NULL, 211, NULL);
INSERT INTO `product_variants` VALUES (22, 13, NULL, NULL, NULL, 131, NULL);
INSERT INTO `product_variants` VALUES (23, 14, NULL, NULL, NULL, 147, NULL);
INSERT INTO `product_variants` VALUES (24, 15, NULL, NULL, NULL, 286, NULL);
INSERT INTO `product_variants` VALUES (25, 16, 'sku-xanhdam', 15, NULL, 144, NULL);
INSERT INTO `product_variants` VALUES (26, 16, 'sku-do', 16, NULL, 156, NULL);
INSERT INTO `product_variants` VALUES (27, 17, NULL, NULL, NULL, 426, NULL);
INSERT INTO `product_variants` VALUES (28, 18, NULL, NULL, NULL, 29, NULL);
INSERT INTO `product_variants` VALUES (73, 50, '', NULL, NULL, 54, NULL);
INSERT INTO `product_variants` VALUES (74, 51, '', NULL, NULL, 21, NULL);
INSERT INTO `product_variants` VALUES (75, 52, '', NULL, NULL, 63, NULL);
INSERT INTO `product_variants` VALUES (76, 53, '', 62, NULL, 22, NULL);
INSERT INTO `product_variants` VALUES (77, 53, '', 63, NULL, 25, NULL);
INSERT INTO `product_variants` VALUES (78, 54, '', NULL, NULL, 32, NULL);
INSERT INTO `product_variants` VALUES (79, 55, '', NULL, NULL, 76, NULL);
INSERT INTO `product_variants` VALUES (80, 56, '', NULL, NULL, 14, NULL);
INSERT INTO `product_variants` VALUES (81, 57, '', NULL, NULL, 27, NULL);
INSERT INTO `product_variants` VALUES (82, 58, '', NULL, NULL, 74, NULL);
INSERT INTO `product_variants` VALUES (83, 59, '', NULL, NULL, 33, NULL);
INSERT INTO `product_variants` VALUES (84, 60, '', NULL, NULL, 25, NULL);
INSERT INTO `product_variants` VALUES (85, 61, '', 64, NULL, 23, NULL);
INSERT INTO `product_variants` VALUES (86, 61, '', 65, NULL, 21, NULL);
INSERT INTO `product_variants` VALUES (87, 62, '', NULL, NULL, 11, NULL);
INSERT INTO `product_variants` VALUES (88, 63, '', 66, NULL, 22, NULL);
INSERT INTO `product_variants` VALUES (89, 63, '', 67, NULL, 23, NULL);
INSERT INTO `product_variants` VALUES (90, 63, '', 68, NULL, 25, NULL);
INSERT INTO `product_variants` VALUES (91, 64, '', NULL, NULL, 179, NULL);
INSERT INTO `product_variants` VALUES (115, 83, '', 79, 80, 111, NULL);
INSERT INTO `product_variants` VALUES (116, 83, '', 79, 81, 122, NULL);
INSERT INTO `product_variants` VALUES (117, 83, '', 82, 80, 33, NULL);
INSERT INTO `product_variants` VALUES (118, 83, '', 82, 81, 44, NULL);
INSERT INTO `product_variants` VALUES (122, 87, 'CLD1D', NULL, NULL, 92, NULL);
INSERT INTO `product_variants` VALUES (123, 88, '', NULL, NULL, 322, NULL);
INSERT INTO `product_variants` VALUES (124, 89, '', NULL, NULL, 8, NULL);
INSERT INTO `product_variants` VALUES (125, 90, '', NULL, NULL, 117, NULL);
INSERT INTO `product_variants` VALUES (126, 91, '', NULL, NULL, 42, NULL);
INSERT INTO `product_variants` VALUES (127, 92, '', NULL, NULL, 98, NULL);
INSERT INTO `product_variants` VALUES (128, 93, '', NULL, NULL, 123, NULL);
INSERT INTO `product_variants` VALUES (129, 94, '', NULL, NULL, 32, NULL);
INSERT INTO `product_variants` VALUES (130, 95, '', NULL, NULL, 123, NULL);
INSERT INTO `product_variants` VALUES (131, 96, '', NULL, NULL, 53, NULL);
INSERT INTO `product_variants` VALUES (132, 97, '', NULL, NULL, 12, NULL);
INSERT INTO `product_variants` VALUES (133, 98, '', NULL, NULL, 96, NULL);
INSERT INTO `product_variants` VALUES (134, 99, '', NULL, NULL, 32, NULL);
INSERT INTO `product_variants` VALUES (135, 100, '', NULL, NULL, 22, NULL);
INSERT INTO `product_variants` VALUES (136, 101, '', NULL, NULL, 23, NULL);
INSERT INTO `product_variants` VALUES (137, 102, '', NULL, NULL, 23, NULL);
INSERT INTO `product_variants` VALUES (138, 103, '', NULL, NULL, 22, NULL);
INSERT INTO `product_variants` VALUES (139, 104, '', NULL, NULL, 321, NULL);
INSERT INTO `product_variants` VALUES (140, 105, '', NULL, NULL, 123, NULL);
INSERT INTO `product_variants` VALUES (141, 106, '', NULL, NULL, 35, NULL);
INSERT INTO `product_variants` VALUES (144, 109, '', NULL, NULL, 32, NULL);
INSERT INTO `product_variants` VALUES (145, 110, '', NULL, NULL, 333, NULL);
INSERT INTO `product_variants` VALUES (146, 111, '', NULL, NULL, 321, NULL);
INSERT INTO `product_variants` VALUES (147, 112, '', NULL, NULL, 64, NULL);
INSERT INTO `product_variants` VALUES (148, 113, '', NULL, NULL, 123, NULL);
INSERT INTO `product_variants` VALUES (149, 114, '', NULL, NULL, 32, NULL);
INSERT INTO `product_variants` VALUES (150, 115, '', NULL, NULL, 25, NULL);
INSERT INTO `product_variants` VALUES (151, 116, '', NULL, NULL, 123, NULL);
INSERT INTO `product_variants` VALUES (152, 117, '', NULL, NULL, 33, NULL);
INSERT INTO `product_variants` VALUES (153, 118, '', NULL, NULL, 76, NULL);
INSERT INTO `product_variants` VALUES (154, 119, '', NULL, NULL, 23, NULL);
INSERT INTO `product_variants` VALUES (155, 120, '', NULL, NULL, 22, NULL);
INSERT INTO `product_variants` VALUES (156, 121, '', NULL, NULL, 65, NULL);
INSERT INTO `product_variants` VALUES (157, 122, '', NULL, NULL, 332, NULL);
INSERT INTO `product_variants` VALUES (158, 123, '', NULL, NULL, 232, NULL);
INSERT INTO `product_variants` VALUES (159, 124, '', NULL, NULL, 421, NULL);
INSERT INTO `product_variants` VALUES (160, 125, '', NULL, NULL, 398, NULL);
INSERT INTO `product_variants` VALUES (161, 126, '', NULL, NULL, 222, NULL);
INSERT INTO `product_variants` VALUES (162, 127, '', NULL, NULL, 321, NULL);
INSERT INTO `product_variants` VALUES (163, 128, '', NULL, NULL, 321, NULL);
INSERT INTO `product_variants` VALUES (164, 129, '', NULL, NULL, 389, NULL);
INSERT INTO `product_variants` VALUES (165, 130, '', NULL, NULL, 187, NULL);
INSERT INTO `product_variants` VALUES (166, 131, '', NULL, NULL, 323, NULL);
INSERT INTO `product_variants` VALUES (167, 132, '', NULL, NULL, 33, NULL);
INSERT INTO `product_variants` VALUES (168, 133, '', NULL, NULL, 237, NULL);
INSERT INTO `product_variants` VALUES (169, 134, '', NULL, NULL, 319, NULL);
INSERT INTO `product_variants` VALUES (170, 135, '', NULL, NULL, 239, NULL);
INSERT INTO `product_variants` VALUES (171, 136, '', NULL, NULL, 57, NULL);
INSERT INTO `product_variants` VALUES (172, 137, '', NULL, NULL, 95, NULL);
INSERT INTO `product_variants` VALUES (173, 138, '', NULL, NULL, 99, NULL);
INSERT INTO `product_variants` VALUES (174, 139, '', NULL, NULL, 0, NULL);
INSERT INTO `product_variants` VALUES (175, 140, '', NULL, NULL, 0, NULL);
INSERT INTO `product_variants` VALUES (176, 141, '', NULL, NULL, 761, NULL);
INSERT INTO `product_variants` VALUES (177, 142, '', NULL, NULL, 971, NULL);
INSERT INTO `product_variants` VALUES (178, 143, '', NULL, NULL, 345, NULL);
INSERT INTO `product_variants` VALUES (179, 144, '', NULL, NULL, 0, NULL);
INSERT INTO `product_variants` VALUES (180, 145, '', NULL, NULL, 185, NULL);
INSERT INTO `product_variants` VALUES (181, 146, '', NULL, NULL, 734, NULL);
INSERT INTO `product_variants` VALUES (182, 147, '', NULL, NULL, 522, NULL);
INSERT INTO `product_variants` VALUES (183, 148, '', NULL, NULL, 452, NULL);
INSERT INTO `product_variants` VALUES (184, 149, '', NULL, NULL, 783, NULL);
INSERT INTO `product_variants` VALUES (185, 150, '', NULL, NULL, 481, NULL);
INSERT INTO `product_variants` VALUES (186, 151, '', NULL, NULL, 321, NULL);
INSERT INTO `product_variants` VALUES (187, 152, '', NULL, NULL, 5667, NULL);
INSERT INTO `product_variants` VALUES (188, 153, '', NULL, NULL, 789, NULL);
INSERT INTO `product_variants` VALUES (189, 154, '', NULL, NULL, 764, NULL);
INSERT INTO `product_variants` VALUES (190, 155, '', 83, NULL, 111, NULL);
INSERT INTO `product_variants` VALUES (191, 155, '', 84, NULL, 222, NULL);
INSERT INTO `product_variants` VALUES (192, 155, '', 85, NULL, 333, NULL);
INSERT INTO `product_variants` VALUES (193, 156, '', 86, NULL, 234, NULL);
INSERT INTO `product_variants` VALUES (194, 156, '', 87, NULL, 512, NULL);
INSERT INTO `product_variants` VALUES (195, 156, '', 88, NULL, 251, NULL);
INSERT INTO `product_variants` VALUES (196, 157, '', 89, 90, 566, NULL);
INSERT INTO `product_variants` VALUES (197, 157, '', 91, 90, 734, NULL);
INSERT INTO `product_variants` VALUES (198, 157, '', 90, 90, 123, NULL);
INSERT INTO `product_variants` VALUES (199, 158, '', 92, NULL, 313, NULL);
INSERT INTO `product_variants` VALUES (200, 158, '', 93, NULL, 421, NULL);
INSERT INTO `product_variants` VALUES (201, 159, '', 94, NULL, 122, NULL);
INSERT INTO `product_variants` VALUES (202, 159, '', 95, NULL, 419, NULL);
INSERT INTO `product_variants` VALUES (203, 159, '', 96, NULL, 221, NULL);
INSERT INTO `product_variants` VALUES (210, 162, '123', NULL, NULL, 123, NULL);

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
  `createDate` date NULL DEFAULT curdate(),
  `active` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_products-categories`(`idCategory` ASC) USING BTREE,
  CONSTRAINT `fk_products-categories` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 163 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 1, 'Ví gấp nam da cá sấu V7068', 'https://www.gento.vn/wp-content/uploads/2024/07/vi-nam-da-ca-sau8.jpg', 1100000, '<h2>V&iacute; Nam Da C&aacute; Sấu Cao Cấp V7038</h2>\r\n\r\n<p>V&iacute; nam l&agrave; một phụ kiện bất ly th&acirc;n của mỗi ch&agrave;ng trai khi đi ra ngo&agrave;i. N&oacute; kh&ocirc;ng chỉ gi&uacute;p tổ chức tiền bạc, thẻ t&iacute;n dụng, v&agrave; giấy tờ c&aacute; nh&acirc;n m&agrave; c&ograve;n thể hiện phong c&aacute;ch v&agrave; đẳng cấp của người sử dụng. Một chiếc v&iacute; da c&aacute; sấu cao cấp kh&ocirc;ng chỉ đ&aacute;p ứng đầy đủ c&aacute;c y&ecirc;u cầu về t&iacute;nh năng m&agrave; c&ograve;n mang lại sự sang trọng v&agrave; bền bỉ. &lt;/div&gt;</p>\r\n\r\n<h2>Thiết Kế Gọn G&agrave;ng, Vừa T&uacute;i Quần</h2>\r\n\r\n<p>Chiếc v&iacute; nam da c&aacute; sấu n&agrave;y được thiết kế với kiểu d&aacute;ng gọn g&agrave;ng, vừa vặn với t&uacute;i quần, mang lại sự tiện lợi v&agrave; thoải m&aacute;i<br />\r\nkhi mang theo. K&iacute;ch thước l&yacute; tưởng gi&uacute;p v&iacute; kh&ocirc;ng qu&aacute; cồng kềnh, dễ d&agrave;ng cầm nắm v&agrave; sử dụng.</p>\r\n\r\n<h2>Chất Liệu Da C&aacute; Sấu Cao Cấp</h2>\r\n\r\n<p>V&iacute; được l&agrave;m từ chất liệu da c&aacute; sấu cao cấp, nổi tiếng với độ bền bỉ v&agrave; sang trọng. Bề mặt da c&oacute; kết cấu độc đ&aacute;o, mang<br />\r\nlại vẻ ngo&agrave;i tinh tế v&agrave; kh&aacute;c biệt. Đặc biệt, mặt trong của v&iacute; được l&oacute;t da b&ograve; Italy, tăng cường độ mềm mại v&agrave; bền đẹp,<br />\r\nđảm bảo sự h&agrave;i l&ograve;ng cho người sử dụng.</p>\r\n\r\n<h2>Ngăn Chứa Tiện Lợi</h2>\r\n\r\n<p>V&iacute; được thiết kế với 8 ngăn đựng thẻ v&agrave; 2 ngăn đựng tiền mặt, gi&uacute;p bạn dễ d&agrave;ng sắp xếp v&agrave; truy cập c&aacute;c loại thẻ v&agrave; tiền<br />\r\nmặt. Sự ph&acirc;n chia ngăn chứa khoa học gi&uacute;p v&iacute; lu&ocirc;n gọn g&agrave;ng v&agrave; ngăn nắp, đồng thời bảo vệ c&aacute;c vật dụng b&ecirc;n trong kh&ocirc;ng bị hư hại.</p>\r\n\r\n<p>V&iacute; nam da c&aacute; sấu cao cấp l&agrave; một phụ kiện ho&agrave;n hảo, vừa đảm bảo t&iacute;nh năng tiện dụng vừa mang lại vẻ ngo&agrave;i đẳng cấp v&agrave;<br />\r\nsang trọng. Đ&acirc;y l&agrave; sự lựa chọn l&yacute; tưởng cho những ch&agrave;ng trai muốn thể hiện phong c&aacute;ch v&agrave; đẳng cấp trong mỗi lần ra ngo&agrave;i.</p>\r\n\r\n<p><br />\r\n<img alt=\"\" src=\"https://www.gento.vn/wp-content/uploads/2024/07/vi-nam-da-ca-sau8.jpg\" style=\"height:800px; width:800px\" /></p>\r\n', '2024-12-18', 1);
INSERT INTO `products` VALUES (2, 10, 'Giày mọi mặt dập vân cá sấu', 'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m34htcbgjiqj0d@resize_w450_nl.webp', 1550000, NULL, '2024-12-17', 1);
INSERT INTO `products` VALUES (3, 4, 'Túi xách da cá sấu hàng hiệu Gento GS1003', 'https://www.gento.vn/wp-content/uploads/2024/04/Tui-xach-da-ca-sau-hang-hieu-gento-gs1003.jpg', 7000000, NULL, '2024-12-10', 1);
INSERT INTO `products` VALUES (4, 1, 'Ví cầm tay nam da cá sấu V7065', 'https://www.gento.vn/wp-content/uploads/2024/06/tui-cam-tay-da-bo3.jpg', 1350000, NULL, '2024-12-10', 1);
INSERT INTO `products` VALUES (5, 1, 'Ví Da Nam Cá Sấu Cao Cấp Thương Hiệu Genk - GBCS02', 'https://down-vn.img.susercontent.com/file/8f299495a4c4e172fab7ff80d40d5fb4.webp', 799000, NULL, '2024-10-16', 1);
INSERT INTO `products` VALUES (6, 1, 'Ví cầm tay da cá sấu cao cấp GS982 Nâu', 'https://www.gento.vn/wp-content/uploads/2021/10/vi-cam-tay-da-ca-sau-gs9821.jpeg', 1300000, NULL, '2024-12-10', 1);
INSERT INTO `products` VALUES (7, 1, 'Ví cầm tay nam da cá sấu cao cấp Gento GS985', 'https://www.gento.vn/wp-content/uploads/2023/11/vi-da-ca-sau-nam-cao-cap10.jpg', 1950000, NULL, '2023-02-13', 1);
INSERT INTO `products` VALUES (8, 1, 'Ví da cá sấu 2 mặt dáng ngang da hông cao cấp VTA1500N-H-D', 'https://i0.wp.com/tamanh.net/wp-content/uploads/2020/01/vi-da-hong-ca-sau-VTA1500N-H-D-5.jpg?fit=960%2C1200&ssl=1', 1225000, NULL, '2024-08-23', 1);
INSERT INTO `products` VALUES (9, 1, 'Bóp da cá sấu nam 2 mặt da bụng VN70HM', 'https://casauhoanglong.com/wp-content/uploads/2024/01/Bop-da-ca-sau-nam-2-mat-da-bung-VN70HM.jpeg', 1119000, NULL, '2022-07-13', 1);
INSERT INTO `products` VALUES (10, 1, 'Ví Dài Cá Sấu Vân Bụng 1 Mặt', 'https://lavatino.com/wp-content/uploads/2019/10/DSC03475.jpg', 2100000, NULL, '2021-09-22', 1);
INSERT INTO `products` VALUES (11, 1, 'Ví ngang cá sấu WSO vân bụng', 'https://lavatino.com/wp-content/uploads/2019/10/DSC02914-1000x1000-1.jpg', 1249000, NULL, '2022-09-27', 1);
INSERT INTO `products` VALUES (12, 1, 'Ví ngang cá sấu WSO vân bụng [Màu đen]', 'https://lavatino.com/wp-content/uploads/2019/10/DSC02916-300x300.jpg', 1249000, NULL, '2022-09-27', 1);
INSERT INTO `products` VALUES (13, 1, 'Ví ngang cá sấu WST vân chân', 'https://lavatino.com/wp-content/uploads/2022/01/KEYL3389-copy-1000x1000-1.jpg', 1225000, NULL, '2024-08-23', 1);
INSERT INTO `products` VALUES (14, 1, 'Ví đứng cá sấu WST vân gù', 'https://lavatino.com/wp-content/uploads/2022/01/KEYL3431-copy-1000x1000-1.jpg', 1550000, NULL, '2024-08-23', 1);
INSERT INTO `products` VALUES (15, 1, 'Ví dài NOMENT ZPM da cá sấu vân bụng', 'https://lavatino.com/wp-content/uploads/2023/07/vi-dai-da-ca-sau-chinh-hang-lavatino-37-595x595.jpg', 1800000, NULL, '2024-08-23', 1);
INSERT INTO `products` VALUES (16, 1, 'Ví nam cầm tay CLUTCH VICTOR da cá sấu chính hãng Lavatino [CLS24]', 'https://lavatino.com/wp-content/uploads/2023/06/MGL7695-595x595.jpg', 1975000, NULL, '2024-08-23', 1);
INSERT INTO `products` VALUES (17, 1, 'Ví đứng cá sấu WSO vân chân', 'https://lavatino.com/wp-content/uploads/2022/01/KEYL3453-1000x1000-1.jpg', 1775000, NULL, '2024-08-25', 1);
INSERT INTO `products` VALUES (18, 1, 'Ví da cá sấu 1 mặt dáng ngang da đuôi lịch lãm VTA790N-D-ND', 'https://i0.wp.com/tamanh.net/wp-content/uploads/2015/11/vi-da-duoi-ca-sau-VTA790N-D-ND-1.jpg?fit=960%2C1200&ssl=1', 1895000, NULL, '2022-07-13', 1);
INSERT INTO `products` VALUES (50, 4, 'Túi Xách Nữ Cao Cấp Họa Tiết Vân Cá Sấu XYZ', 'https://m.media-amazon.com/images/I/71d-u5eLEsL._AC_SY500_.jpg', 2200000, NULL, '2025-01-14', 1);
INSERT INTO `products` VALUES (51, 8, 'Thắt lưng da Cá sấu bản 3,4cm khóa tự động - Đen 4409705', 'https://product.hstatic.net/1000260559/product/that-lung-da-ca-sau-ban-3-4cm-khoa-tu-dong-den-4409705__1__35b85fb086f24eedae59b4f60e4467ec_master.jpg', 1100000, NULL, '2025-01-14', 1);
INSERT INTO `products` VALUES (52, 8, 'Thắt lưng khóa tự động da Cá Sấu liền, không nối - 3988890', 'https://product.hstatic.net/1000260559/product/that-lung-khoa-tu-dong-da-ca-sau-lien-khong-noi-3988890__4__9215cfb7954b4b898b96e099fb98321d_master.jpg', 1225000, NULL, '2025-01-14', 1);
INSERT INTO `products` VALUES (53, 8, 'Thắt lưng cá sấu da liền cao cấp - 3477719', 'https://product.hstatic.net/1000260559/product/o1cn01oeewq11v7ifncguqb_31065461__1__1499322813aa4128978245709bf087fe_master.jpg', 999000, NULL, '2025-01-14', 1);
INSERT INTO `products` VALUES (54, 8, 'Thắt lưng da cá sấu khóa cài - 3334472', 'https://product.hstatic.net/1000260559/product/that-lung-da-ca-sau-khoa-cai-3334472__1__2b62d52a5d864f7583ceb22370b97b9a_master.jpg', 1200000, NULL, '2025-01-14', 1);
INSERT INTO `products` VALUES (55, 8, 'Thắt lưng khóa cài da cá sấu mặt chữ Z - 3334471', 'https://product.hstatic.net/1000260559/product/that-lung-khoa-cai-da-ca-sau-mat-chu-z-3334471__2__266ea1c053614ae09cd9c2f55b1d536e_master.jpg', 1200000, NULL, '2025-01-14', 1);
INSERT INTO `products` VALUES (56, 8, 'Thắt lưng da Cá Sấu cao cấp khóa tự động - 2925658', 'https://product.hstatic.net/1000260559/product/15947417404_484342603_2a2fc0ba844b4ef68791262ea491b3f7_master.jpg', 1200000, NULL, '2025-01-14', 1);
INSERT INTO `products` VALUES (57, 8, 'Thắt lưng Cá Sấu khóa cài cao cấp bản 3.8 - 2925664', 'https://product.hstatic.net/1000260559/product/that-lung-ca-sau-khoa-cai-cao-cap-2925664__1__bddcd41a99134f368fcc1bd867e0951f_master.jpg', 1100000, NULL, '2025-01-14', 1);
INSERT INTO `products` VALUES (58, 7, 'Vali da cá sấu hàng hiệu cao cấp Gento D519', 'https://www.gento.vn/wp-content/uploads/2023/06/vali-da-ca-sau-cao-cap4.jpg', 1250000, NULL, '2025-01-14', 1);
INSERT INTO `products` VALUES (59, 7, 'Vali Da cá sấu thật Cao Cấp Cá Sấu Tím', 'https://www.oj-exclusive.com/wp-content/uploads/ORANG-CROCODILE-LUGGAGE-FRONT.jpg', 2250000, NULL, '2025-01-14', 1);
INSERT INTO `products` VALUES (60, 7, 'Vali xách tay giả da cá sấu thời trang đẹp size 18 màu đen TM206', 'https://tamma.vn/images/2018/vali-xach-tay-gia-da-ca-sau-khoa-tsa-size-20-den-01.jpg', 299000, NULL, '2025-01-14', 1);
INSERT INTO `products` VALUES (61, 7, 'VaLi Du Lịch Da Cá Sấu Cao Cấp AEA4', 'https://tuidacasau.vn/images/2020/12/vali-du-lich-da-ca-sau-cao-cap-aea4-12.jpg', 1499000, NULL, '2025-01-14', 1);
INSERT INTO `products` VALUES (62, 7, 'Vali Brucegao Spinner da cá sấu thật', 'https://mia.vn/media/uploads/tin-tuc/vali-da-bo-brucegao-spinner-1713766880.jpg', 3200000, NULL, '2025-01-14', 1);
INSERT INTO `products` VALUES (63, 7, 'Bộ vali da cá sấu màu tím có bánh xe quay ', 'https://s.alicdn.com/@sc04/kf/HTB17P1waiMnBKNjSZFoq6zOSFXaK.jpg_720x720q50.jpg', 500000, NULL, '2025-01-14', 1);
INSERT INTO `products` VALUES (64, 3, 'Túi Công Sở Nam Da Bò Dập Vân Cá Sấu Sang Trọng PL013', 'https://thienanstore.com/wp-content/uploads/2020/10/tui-cong-so-nam-da-bo-van-ca-sau-sang-trong-PL013-2-510x512.jpg', 1990000, NULL, '2025-01-14', 1);
INSERT INTO `products` VALUES (83, 22, 'Test', '/uploads/images/categories/cate-14.png', 123, '<h1>Lorem Ipsum</h1>\n\n<p>&quot;Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...&quot;</p>\n\n<p>&quot;There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...&quot;</p>\n\n<hr />\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<h2>What is Lorem Ipsum?</h2>\n\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n\n<h2>Why do we use it?</h2>\n\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n', '2025-01-15', 1);
INSERT INTO `products` VALUES (87, 3, 'Túi nam cầm tay da cá sấu màu đen đẹp lịch lãm', 'https://bizweb.dktcdn.net/thumb/grande/100/376/377/products/clutch-cam-tay-da-ca-sau-120.jpg?v=1611457255957', 2800000, '<h2><strong>T&uacute;i Nam Cầm Tay Da C&aacute; Sấu M&agrave;u Đen &ndash; Đẳng Cấp v&agrave; Lịch L&atilde;m</strong></h2>\n\n<p>T&uacute;i nam cầm tay da c&aacute; sấu m&agrave;u đen l&agrave; sự kết hợp ho&agrave;n hảo giữa sự sang trọng, tinh tế v&agrave; t&iacute;nh năng tiện dụng. Được chế t&aacute;c từ chất liệu da c&aacute; sấu cao cấp, t&uacute;i mang đến vẻ ngo&agrave;i mạnh mẽ, bền bỉ c&ugrave;ng vẻ đẹp tự nhi&ecirc;n với những v&acirc;n da độc đ&aacute;o. M&agrave;u đen cổ điển gi&uacute;p sản phẩm dễ d&agrave;ng phối hợp với mọi phong c&aacute;ch thời trang, từ c&ocirc;ng sở đến những buổi tiệc tối.</p>\n\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li><strong>Chất liệu cao cấp</strong>: Da c&aacute; sấu thật 100%, đảm bảo độ bền cao v&agrave; sự mềm mại, mang lại cảm gi&aacute;c thoải m&aacute;i khi sử dụng.</li>\n	<li><strong>Thiết kế tinh tế</strong>: Kiểu d&aacute;ng gọn g&agrave;ng, thanh lịch với c&aacute;c chi tiết gia c&ocirc;ng tỉ mỉ, mang đến vẻ đẹp sang trọng cho người sử dụng.</li>\n	<li><strong>Tiện &iacute;ch</strong>: Kh&ocirc;ng gian b&ecirc;n trong rộng r&atilde;i với ngăn đựng th&ocirc;ng minh, gi&uacute;p bạn dễ d&agrave;ng sắp xếp c&aacute;c vật dụng c&aacute; nh&acirc;n như v&iacute; tiền, điện thoại, ch&igrave;a kh&oacute;a, thẻ t&iacute;n dụng.</li>\n	<li><strong>M&agrave;u sắc thanh lịch</strong>: M&agrave;u đen dễ d&agrave;ng kết hợp với nhiều bộ trang phục, ph&ugrave; hợp với nhiều dịp kh&aacute;c nhau từ c&ocirc;ng sở đến c&aacute;c sự kiện quan trọng.</li>\n</ul>\n\n<p>T&uacute;i cầm tay da c&aacute; sấu đen l&agrave; m&oacute;n phụ kiện l&yacute; tưởng cho những qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch sự tinh tế, mạnh mẽ v&agrave; đầy phong c&aacute;ch. Sản phẩm l&agrave; lựa chọn ho&agrave;n hảo để thể hiện đẳng cấp v&agrave; gu thẩm mỹ ri&ecirc;ng biệt của bạn.</p>\n', '2025-01-15', 1);
INSERT INTO `products` VALUES (88, 1, 'Ví cầm tay Montblanc Meisterstuck Selection Black Long Wallet 12cc MB126646', 'https://thegioibut.com/wp-content/uploads/2024/05/montblanc-meisterstuck-selection-black-long-wallet-12cc-mb126646-3_optimized-683x1024.jpg', 2568000, '<h1><strong>V&iacute; Cầm Tay Montblanc Meisterstuck Selection Black Long Wallet 12cc MB126646 &ndash; Tinh Hoa Đẳng Cấp Ch&acirc;u &Acirc;u</strong></h1>\n\n<p>V&iacute; cầm tay Montblanc Meisterstuck Selection Black Long Wallet 12cc MB126646 l&agrave; một sản phẩm cao cấp, kết hợp giữa sự sang trọng v&agrave; tiện &iacute;ch tuyệt vời. Được chế t&aacute;c từ chất liệu da cao cấp, thiết kế thanh lịch của chiếc v&iacute; n&agrave;y l&agrave; lựa chọn ho&agrave;n hảo cho những qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch sự tinh tế v&agrave; đẳng cấp.</p>\n\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li><strong>Chất liệu da cao cấp</strong>: Da bovine (b&ograve;) được xử l&yacute; tinh xảo, mang đến cảm gi&aacute;c mềm mại, bền bỉ v&agrave; c&oacute; độ b&oacute;ng tự nhi&ecirc;n. Chất liệu n&agrave;y cũng chống trầy xước v&agrave; giữ v&iacute; lu&ocirc;n mới mẻ theo thời gian.</li>\n	<li><strong>Thiết kế d&agrave;i tiện dụng</strong>: Với k&iacute;ch thước d&agrave;i, v&iacute; c&oacute; thể đựng vừa c&aacute;c loại thẻ t&iacute;n dụng, giấy tờ quan trọng v&agrave; tiền mặt một c&aacute;ch gọn g&agrave;ng, ngăn nắp.</li>\n	<li><strong>Kh&ocirc;ng gian lưu trữ th&ocirc;ng minh</strong>: V&iacute; được trang bị 12 ngăn thẻ t&iacute;n dụng, 2 ngăn tiền mặt v&agrave; 1 ngăn lớn đựng giấy tờ, mang đến sự tiện lợi cho người d&ugrave;ng trong việc quản l&yacute; t&agrave;i ch&iacute;nh c&aacute; nh&acirc;n.</li>\n	<li><strong>Logo Montblanc sang trọng</strong>: Logo Montblanc nổi bật được khắc tr&ecirc;n mặt ngo&agrave;i của v&iacute;, thể hiện đẳng cấp v&agrave; sự tinh tế của thương hiệu nổi tiếng.</li>\n	<li><strong>M&agrave;u sắc trang nh&atilde;</strong>: M&agrave;u đen cổ điển dễ d&agrave;ng kết hợp với mọi trang phục, mang lại vẻ ngo&agrave;i lịch l&atilde;m, ph&ugrave; hợp cho c&aacute;c sự kiện trang trọng v&agrave; c&ocirc;ng sở.</li>\n</ul>\n\n<p>V&iacute; cầm tay Montblanc Meisterstuck Selection Black Long Wallet 12cc MB126646 l&agrave; m&oacute;n phụ kiện kh&ocirc;ng thể thiếu d&agrave;nh cho những người y&ecirc;u th&iacute;ch sự ho&agrave;n hảo v&agrave; đẳng cấp. Đ&acirc;y l&agrave; lựa chọn l&yacute; tưởng để n&acirc;ng tầm phong c&aacute;ch của bạn, đồng thời thể hiện sự chuy&ecirc;n nghiệp v&agrave; gu thẩm mỹ tinh tế.</p>', '2025-01-16', 1);
INSERT INTO `products` VALUES (89, 1, 'Clutch cầm tay da cá sấu cao cấp cho nam/nữ', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/376/377/products/clutch-cam-tay-da-ca-sau-163.jpg?v=1610956796353', 1200000, '<h2>Clutch Cầm Tay Da C&aacute; Sấu Cao Cấp &ndash; Phong C&aacute;ch Tinh Tế Cho Nam/Nữ</h2>\n\n<p>Tạo n&ecirc;n vẻ ngo&agrave;i ấn tượng với chiếc <strong>clutch cầm tay da c&aacute; sấu cao cấp</strong> &ndash; sự lựa chọn ho&agrave;n hảo cho những ai y&ecirc;u th&iacute;ch sự sang trọng v&agrave; tinh tế. Được chế t&aacute;c từ da c&aacute; sấu thật 100%, mỗi chiếc clutch l&agrave; một t&aacute;c phẩm nghệ thuật độc đ&aacute;o với c&aacute;c v&acirc;n da tự nhi&ecirc;n, bền bỉ v&agrave; đẹp mắt, mang đến vẻ đẹp mạnh mẽ nhưng kh&ocirc;ng k&eacute;m phần thanh lịch.</p>\n\n<p><strong>Đặc Điểm Nổi Bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất Liệu Da C&aacute; Sấu Cao Cấp</strong><br />\n	Sử dụng da c&aacute; sấu tự nhi&ecirc;n, mỗi sản phẩm đều c&oacute; một cấu tr&uacute;c v&agrave; hoa văn ri&ecirc;ng biệt, tạo n&ecirc;n sự độc đ&aacute;o v&agrave; sang trọng. Chất liệu n&agrave;y kh&ocirc;ng chỉ bền bỉ m&agrave; c&ograve;n mang đến cảm gi&aacute;c mềm mại v&agrave; dễ chịu khi cầm nắm.</p>\n	</li>\n	<li>\n	<p><strong>Thiết Kế Thanh Lịch, Tinh Tế</strong><br />\n	Clutch c&oacute; thiết kế nhỏ gọn, dễ d&agrave;ng mang theo trong c&aacute;c sự kiện quan trọng như tiệc t&ugrave;ng, dạ hội, hay c&aacute;c cuộc họp quan trọng. Mặt ngo&agrave;i của clutch được gia c&ocirc;ng tỉ mỉ, tạo n&ecirc;n một vẻ đẹp vừa mạnh mẽ, vừa thời thượng.</p>\n	</li>\n	<li>\n	<p><strong>Kh&ocirc;ng Gian Lưu Trữ Th&ocirc;ng Minh</strong><br />\n	D&ugrave; c&oacute; k&iacute;ch thước nhỏ gọn, clutch vẫn cung cấp đủ kh&ocirc;ng gian để bạn đựng c&aacute;c vật dụng thiết yếu như tiền mặt, thẻ t&iacute;n dụng, điện thoại hay ch&igrave;a kh&oacute;a &ndash; rất ph&ugrave; hợp cho những ai y&ecirc;u th&iacute;ch sự tiện lợi v&agrave; ngăn nắp.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u Sắc Tinh Tế, Dễ D&agrave;ng Phối Đồ</strong><br />\n	M&agrave;u sắc của clutch thường l&agrave; c&aacute;c t&ocirc;ng m&agrave;u trung t&iacute;nh như đen, n&acirc;u, tạo sự dễ d&agrave;ng phối hợp với mọi trang phục, từ c&ocirc;ng sở đến c&aacute;c sự kiện cao cấp.</p>\n	</li>\n	<li>\n	<p><strong>D&agrave;nh Cho Cả Nam v&agrave; Nữ</strong><br />\n	Với thiết kế tinh tế v&agrave; chất liệu cao cấp, clutch n&agrave;y l&agrave; phụ kiện l&yacute; tưởng d&agrave;nh cho cả nam v&agrave; nữ, mang đến vẻ ngo&agrave;i sang trọng, lịch l&atilde;m cho bất kỳ ai sử dụng.</p>\n	</li>\n</ul>\n\n<p><strong>L&yacute; Do Bạn N&ecirc;n Chọn Clutch Cầm Tay Da C&aacute; Sấu Cao Cấp:</strong></p>\n\n<ul>\n	<li>Ph&ugrave; hợp với nhiều dịp v&agrave; phong c&aacute;ch kh&aacute;c nhau.</li>\n	<li>Tạo điểm nhấn đặc biệt trong bộ sưu tập phụ kiện của bạn.</li>\n	<li>Sản phẩm cao cấp, bền đẹp theo thời gian.</li>\n</ul>\n\n<p>Clutch cầm tay da c&aacute; sấu cao cấp kh&ocirc;ng chỉ l&agrave; một m&oacute;n đồ thời trang, m&agrave; c&ograve;n l&agrave; biểu tượng của sự đẳng cấp v&agrave; phong c&aacute;ch c&aacute; nh&acirc;n. H&atilde;y chọn ngay cho m&igrave;nh một chiếc để th&ecirc;m phần ấn tượng v&agrave; sang trọng!</p>\n\n<p><strong>Clutch Cầm Tay Da C&aacute; Sấu Cao Cấp &ndash; Phong C&aacute;ch Tinh Tế Cho Nam/Nữ</strong></p>\n\n<p>Tạo n&ecirc;n vẻ ngo&agrave;i ấn tượng với chiếc <strong>clutch cầm tay da c&aacute; sấu cao cấp</strong> &ndash; sự lựa chọn ho&agrave;n hảo cho những ai y&ecirc;u th&iacute;ch sự sang trọng v&agrave; tinh tế. Được chế t&aacute;c từ da c&aacute; sấu thật 100%, mỗi chiếc clutch l&agrave; một t&aacute;c phẩm nghệ thuật độc đ&aacute;o với c&aacute;c v&acirc;n da tự nhi&ecirc;n, bền bỉ v&agrave; đẹp mắt, mang đến vẻ đẹp mạnh mẽ nhưng kh&ocirc;ng k&eacute;m phần thanh lịch.</p>\n\n<p><strong>Đặc Điểm Nổi Bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất Liệu Da C&aacute; Sấu Cao Cấp</strong><br />\n	Sử dụng da c&aacute; sấu tự nhi&ecirc;n, mỗi sản phẩm đều c&oacute; một cấu tr&uacute;c v&agrave; hoa văn ri&ecirc;ng biệt, tạo n&ecirc;n sự độc đ&aacute;o v&agrave; sang trọng. Chất liệu n&agrave;y kh&ocirc;ng chỉ bền bỉ m&agrave; c&ograve;n mang đến cảm gi&aacute;c mềm mại v&agrave; dễ chịu khi cầm nắm.</p>\n	</li>\n	<li>\n	<p><strong>Thiết Kế Thanh Lịch, Tinh Tế</strong><br />\n	Clutch c&oacute; thiết kế nhỏ gọn, dễ d&agrave;ng mang theo trong c&aacute;c sự kiện quan trọng như tiệc t&ugrave;ng, dạ hội, hay c&aacute;c cuộc họp quan trọng. Mặt ngo&agrave;i của clutch được gia c&ocirc;ng tỉ mỉ, tạo n&ecirc;n một vẻ đẹp vừa mạnh mẽ, vừa thời thượng.</p>\n	</li>\n	<li>\n	<p><strong>Kh&ocirc;ng Gian Lưu Trữ Th&ocirc;ng Minh</strong><br />\n	D&ugrave; c&oacute; k&iacute;ch thước nhỏ gọn, clutch vẫn cung cấp đủ kh&ocirc;ng gian để bạn đựng c&aacute;c vật dụng thiết yếu như tiền mặt, thẻ t&iacute;n dụng, điện thoại hay ch&igrave;a kh&oacute;a &ndash; rất ph&ugrave; hợp cho những ai y&ecirc;u th&iacute;ch sự tiện lợi v&agrave; ngăn nắp.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u Sắc Tinh Tế, Dễ D&agrave;ng Phối Đồ</strong><br />\n	M&agrave;u sắc của clutch thường l&agrave; c&aacute;c t&ocirc;ng m&agrave;u trung t&iacute;nh như đen, n&acirc;u, tạo sự dễ d&agrave;ng phối hợp với mọi trang phục, từ c&ocirc;ng sở đến c&aacute;c sự kiện cao cấp.</p>\n	</li>\n	<li>\n	<p><strong>D&agrave;nh Cho Cả Nam v&agrave; Nữ</strong><br />\n	Với thiết kế tinh tế v&agrave; chất liệu cao cấp, clutch n&agrave;y l&agrave; phụ kiện l&yacute; tưởng d&agrave;nh cho cả nam v&agrave; nữ, mang đến vẻ ngo&agrave;i sang trọng, lịch l&atilde;m cho bất kỳ ai sử dụng.</p>\n	</li>\n</ul>\n\n<p><strong>L&yacute; Do Bạn N&ecirc;n Chọn Clutch Cầm Tay Da C&aacute; Sấu Cao Cấp:</strong></p>\n\n<ul>\n	<li>Ph&ugrave; hợp với nhiều dịp v&agrave; phong c&aacute;ch kh&aacute;c nhau.</li>\n	<li>Tạo điểm nhấn đặc biệt trong bộ sưu tập phụ kiện của bạn.</li>\n	<li>Sản phẩm cao cấp, bền đẹp theo thời gian.</li>\n</ul>\n\n<p>Clutch cầm tay da c&aacute; sấu cao cấp kh&ocirc;ng chỉ l&agrave; một m&oacute;n đồ thời trang, m&agrave; c&ograve;n l&agrave; biểu tượng của sự đẳng cấp v&agrave; phong c&aacute;ch c&aacute; nh&acirc;n. H&atilde;y chọn ngay cho m&igrave;nh một chiếc để th&ecirc;m phần ấn tượng v&agrave; sang trọng!</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (90, 5, 'Túi Da Đeo Chéo Vân Da Cá Sấu Chất Lượng Cao Cho Nam', 'https://down-vn.img.susercontent.com/file/cn-11134207-7r98o-lqd23c3okcol0e.webp', 12000000, '<h3>T&uacute;i Da Đeo Ch&eacute;o V&acirc;n Da C&aacute; Sấu Chất Lượng Cao Cho Nam &ndash; Phong C&aacute;ch Mạnh Mẽ v&agrave; Lịch L&atilde;m</h3>\n\n<p>Khẳng định đẳng cấp v&agrave; phong c&aacute;ch c&aacute; nh&acirc;n với chiếc <strong>t&uacute;i da đeo ch&eacute;o v&acirc;n da c&aacute; sấu</strong> chất lượng cao. Được l&agrave;m từ da c&aacute; sấu tự nhi&ecirc;n, t&uacute;i mang đến sự kết hợp ho&agrave;n hảo giữa vẻ đẹp mạnh mẽ, bền bỉ v&agrave; sự sang trọng, l&agrave; phụ kiện l&yacute; tưởng cho c&aacute;c qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch sự tinh tế v&agrave; thời thượng.</p>\n\n<p><strong>Đặc Điểm Nổi Bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất Liệu Da C&aacute; Sấu Cao Cấp</strong><br />\n	Được chế t&aacute;c từ da c&aacute; sấu thật, mỗi chiếc t&uacute;i đều c&oacute; v&acirc;n da độc đ&aacute;o v&agrave; đẹp mắt, tạo n&ecirc;n vẻ đẹp tự nhi&ecirc;n v&agrave; sang trọng. Da c&aacute; sấu bền bỉ, chống xước v&agrave; c&oacute; độ b&oacute;ng tự nhi&ecirc;n, gi&uacute;p t&uacute;i giữ được vẻ đẹp l&acirc;u d&agrave;i theo thời gian.</p>\n	</li>\n	<li>\n	<p><strong>Thiết Kế Đeo Ch&eacute;o Thoải M&aacute;i</strong><br />\n	Với d&acirc;y đeo ch&eacute;o điều chỉnh được, t&uacute;i mang đến sự tiện dụng v&agrave; thoải m&aacute;i khi di chuyển. Bạn c&oacute; thể đeo t&uacute;i qua vai hoặc ch&eacute;o người, ph&ugrave; hợp với mọi ho&agrave;n cảnh v&agrave; phong c&aacute;ch.</p>\n	</li>\n	<li>\n	<p><strong>Kh&ocirc;ng Gian Lưu Trữ Hợp L&yacute;</strong><br />\n	T&uacute;i được thiết kế với kh&ocirc;ng gian rộng r&atilde;i v&agrave; c&aacute;c ngăn nhỏ tiện lợi, gi&uacute;p bạn dễ d&agrave;ng đựng c&aacute;c vật dụng c&aacute; nh&acirc;n như điện thoại, v&iacute; tiền, ch&igrave;a kh&oacute;a, thẻ t&iacute;n dụng, hay c&aacute;c vật dụng cần thiết kh&aacute;c.</p>\n	</li>\n	<li>\n	<p><strong>Vẻ Ngo&agrave;i Sang Trọng, Phong C&aacute;ch</strong><br />\n	V&acirc;n da c&aacute; sấu tinh tế c&ugrave;ng thiết kế đơn giản nhưng đầy ấn tượng, t&uacute;i đeo ch&eacute;o n&agrave;y ph&ugrave; hợp với nhiều phong c&aacute;ch thời trang, từ c&ocirc;ng sở đến c&aacute;c buổi đi chơi, du lịch hay gặp gỡ bạn b&egrave;.</p>\n	</li>\n	<li>\n	<p><strong>Sự Lựa Chọn Ho&agrave;n Hảo Cho Qu&yacute; &Ocirc;ng</strong><br />\n	Với sự kết hợp giữa chất liệu cao cấp v&agrave; thiết kế tiện dụng, chiếc t&uacute;i n&agrave;y l&agrave; phụ kiện kh&ocirc;ng thể thiếu cho những qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch sự lịch l&atilde;m, mạnh mẽ nhưng cũng đầy tinh tế.</p>\n	</li>\n</ul>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (91, 5, 'Túi Đeo Chéo Nam Da Pu Dập Vân Da Cá Sấu Sử Dụng Đeo Chéo Đeo Trước Ngực Thể Thao Tiện Lợi', 'https://down-vn.img.susercontent.com/file/47a230c652a17d403f9b07da6eca3dab.webp', 1229999, '', '2025-01-16', 1);
INSERT INTO `products` VALUES (92, 3, 'Cặp da nam công sở vân da cá sấu TLA9807-5-CF', 'https://laforce.vn/wp-content/uploads/2024/02/tui-da-nam-cao-cap-TLA9807-5-CF.jpg', 2359000, '<h3>Cặp Da Nam C&ocirc;ng Sở V&acirc;n Da C&aacute; Sấu TLA9807-5-CF &ndash; Đẳng Cấp v&agrave; Sang Trọng</h3>\n\n<p>Cặp da nam c&ocirc;ng sở v&acirc;n da c&aacute; sấu <strong>TLA9807-5-CF</strong> l&agrave; sự kết hợp ho&agrave;n hảo giữa sự sang trọng v&agrave; t&iacute;nh năng tiện dụng, gi&uacute;p qu&yacute; &ocirc;ng thể hiện phong c&aacute;ch lịch l&atilde;m, chuy&ecirc;n nghiệp ngay trong c&ocirc;ng sở. Chất liệu da c&aacute; sấu cao cấp c&ugrave;ng thiết kế tinh tế sẽ l&agrave; m&oacute;n phụ kiện kh&ocirc;ng thể thiếu cho những ai y&ecirc;u th&iacute;ch sự ho&agrave;n hảo trong từng chi tiết.</p>\n\n<p><strong>Đặc Điểm Nổi Bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất Liệu Da C&aacute; Sấu Cao Cấp</strong><br />\n	Cặp được chế t&aacute;c từ da c&aacute; sấu thật, c&oacute; v&acirc;n tự nhi&ecirc;n độc đ&aacute;o, gi&uacute;p tạo n&ecirc;n vẻ ngo&agrave;i sang trọng v&agrave; kh&aacute;c biệt. Da c&aacute; sấu mang đến độ bền cao, chịu được va đập v&agrave; trầy xước, đồng thời c&oacute; khả năng chống thấm nước, gi&uacute;p bảo vệ c&aacute;c vật dụng b&ecirc;n trong cặp.</p>\n	</li>\n	<li>\n	<p><strong>Thiết Kế Lịch L&atilde;m, Thời Trang</strong><br />\n	Với kiểu d&aacute;ng cặp x&aacute;ch thời thượng, cặp da TLA9807-5-CF kh&ocirc;ng chỉ l&agrave; c&ocirc;ng cụ lưu trữ đồ d&ugrave;ng m&agrave; c&ograve;n l&agrave; biểu tượng của phong c&aacute;ch chuy&ecirc;n nghiệp. Được gia c&ocirc;ng tỉ mỉ với c&aacute;c đường chỉ chắc chắn, tạo n&ecirc;n vẻ ngo&agrave;i vừa mạnh mẽ, vừa tinh tế.</p>\n	</li>\n	<li>\n	<p><strong>Kh&ocirc;ng Gian Lưu Trữ Rộng R&atilde;i v&agrave; Tiện Dụng</strong><br />\n	Cặp c&oacute; ngăn ch&iacute;nh rộng r&atilde;i, c&ugrave;ng c&aacute;c ngăn phụ th&ocirc;ng minh gi&uacute;p bạn dễ d&agrave;ng sắp xếp t&agrave;i liệu, laptop, điện thoại, b&uacute;t, thẻ t&iacute;n dụng v&agrave; c&aacute;c vật dụng c&aacute; nh&acirc;n một c&aacute;ch gọn g&agrave;ng v&agrave; ngăn nắp. C&aacute;c ngăn được thiết kế với độ s&acirc;u hợp l&yacute;, đảm bảo sự tiện dụng tối đa.</p>\n	</li>\n</ul>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (93, 1, 'Ví cầm tay 2 ngăn vân bụng da cá sấu', 'https://www.daydongho.com.vn/wp-content/uploads/2021/07/z2594567829743_8b142c48889fb74dc87b0bb13336d358-510x383.jpg', 2499000, '<p>Cặp da nam c&ocirc;ng sở v&acirc;n da c&aacute; sấu <strong>TLA9807-5-CF</strong> l&agrave; sự kết hợp ho&agrave;n hảo giữa sự sang trọng v&agrave; t&iacute;nh năng tiện dụng, gi&uacute;p qu&yacute; &ocirc;ng thể hiện phong c&aacute;ch lịch l&atilde;m, chuy&ecirc;n nghiệp ngay trong c&ocirc;ng sở. Chất liệu da c&aacute; sấu cao cấp c&ugrave;ng thiết kế tinh tế sẽ l&agrave; m&oacute;n phụ kiện kh&ocirc;ng thể thiếu cho những ai y&ecirc;u th&iacute;ch sự ho&agrave;n hảo trong từng chi tiết.</p>\n\n<p><strong>Đặc Điểm Nổi Bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất Liệu Da C&aacute; Sấu Cao Cấp</strong><br />\n	Cặp được chế t&aacute;c từ da c&aacute; sấu thật, c&oacute; v&acirc;n tự nhi&ecirc;n độc đ&aacute;o, gi&uacute;p tạo n&ecirc;n vẻ ngo&agrave;i sang trọng v&agrave; kh&aacute;c biệt. Da c&aacute; sấu mang đến độ bền cao, chịu được va đập v&agrave; trầy xước, đồng thời c&oacute; khả năng chống thấm nước, gi&uacute;p bảo vệ c&aacute;c vật dụng b&ecirc;n trong cặp.</p>\n	</li>\n	<li>\n	<p><strong>Thiết Kế Lịch L&atilde;m, Thời Trang</strong><br />\n	Với kiểu d&aacute;ng cặp x&aacute;ch thời thượng, cặp da TLA9807-5-CF kh&ocirc;ng chỉ l&agrave; c&ocirc;ng cụ lưu trữ đồ d&ugrave;ng m&agrave; c&ograve;n l&agrave; biểu tượng của phong c&aacute;ch chuy&ecirc;n nghiệp. Được gia c&ocirc;ng tỉ mỉ với c&aacute;c đường chỉ chắc chắn, tạo n&ecirc;n vẻ ngo&agrave;i vừa mạnh mẽ, vừa tinh tế.</p>\n	</li>\n	<li>\n	<p><strong>Kh&ocirc;ng Gian Lưu Trữ Rộng R&atilde;i v&agrave; Tiện Dụng</strong><br />\n	Cặp c&oacute; ngăn ch&iacute;nh rộng r&atilde;i, c&ugrave;ng c&aacute;c ngăn phụ th&ocirc;ng minh gi&uacute;p bạn dễ d&agrave;ng sắp xếp t&agrave;i liệu, laptop, điện thoại, b&uacute;t, thẻ t&iacute;n dụng v&agrave; c&aacute;c vật dụng c&aacute; nh&acirc;n một c&aacute;ch gọn g&agrave;ng v&agrave; ngăn nắp. C&aacute;c ngăn được thiết kế với độ s&acirc;u hợp l&yacute;, đảm bảo sự tiện dụng tối đa.</p>\n	</li>\n</ul>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (94, 5, 'Túi bao tử nam MARRANT DC9080 Da bò dập nổi vân da cá sấu.', 'http://dachat.vn/wp-content/uploads/2020/07/20-600x600.jpg', 1299000, '<h3>T&uacute;i Bao Tử Nam MARRANT DC9080 &ndash; Da B&ograve; Dập Nổi V&acirc;n Da C&aacute; Sấu, Phong C&aacute;ch Nam T&iacute;nh v&agrave; Tiện Lợi</h3>\n\n<p>T&uacute;i bao tử nam <strong>MARRANT DC9080</strong> l&agrave; sự lựa chọn l&yacute; tưởng cho những qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch phong c&aacute;ch năng động, c&aacute; t&iacute;nh nhưng kh&ocirc;ng k&eacute;m phần sang trọng. Được chế t&aacute;c từ chất liệu <strong>da b&ograve; dập nổi v&acirc;n da c&aacute; sấu</strong>, t&uacute;i mang đến vẻ ngo&agrave;i mạnh mẽ, hiện đại v&agrave; đầy tinh tế. Sản phẩm kh&ocirc;ng chỉ đ&aacute;p ứng nhu cầu sử dụng m&agrave; c&ograve;n thể hiện đẳng cấp v&agrave; phong c&aacute;ch c&aacute; nh&acirc;n.</p>\n\n<p><strong>Đặc Điểm Nổi Bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất Liệu Da B&ograve; Cao Cấp Dập Nổi V&acirc;n C&aacute; Sấu</strong><br />\n	T&uacute;i được l&agrave;m từ da b&ograve; cao cấp, với lớp dập nổi v&acirc;n c&aacute; sấu tinh tế, tạo n&ecirc;n vẻ ngo&agrave;i độc đ&aacute;o, mạnh mẽ v&agrave; sang trọng. Chất liệu da b&ograve; bền bỉ, chống thấm nước v&agrave; dễ bảo quản, gi&uacute;p t&uacute;i lu&ocirc;n giữ được h&igrave;nh d&aacute;ng v&agrave; m&agrave;u sắc l&acirc;u d&agrave;i.</p>\n	</li>\n	<li>\n	<p><strong>Thiết Kế Bao Tử Năng Động</strong><br />\n	Với kiểu d&aacute;ng bao tử hiện đại, t&uacute;i MARRANT DC9080 mang đến sự tiện lợi v&agrave; thoải m&aacute;i khi di chuyển. D&acirc;y đeo c&oacute; thể điều chỉnh linh hoạt gi&uacute;p bạn dễ d&agrave;ng đeo t&uacute;i quanh eo hoặc ch&eacute;o người, ph&ugrave; hợp cho c&aacute;c hoạt động thể thao, du lịch, hoặc đi dạo phố.</p>\n	</li>\n	<li>\n	<p><strong>Kh&ocirc;ng Gian Lưu Trữ Tiện Dụng</strong><br />\n	T&uacute;i được thiết kế với c&aacute;c ngăn rộng r&atilde;i, bao gồm ngăn ch&iacute;nh v&agrave; c&aacute;c ngăn phụ gi&uacute;p bạn dễ d&agrave;ng lưu trữ điện thoại, v&iacute; tiền, ch&igrave;a kh&oacute;a, thẻ t&iacute;n dụng v&agrave; c&aacute;c vật dụng c&aacute; nh&acirc;n kh&aacute;c một c&aacute;ch ngăn nắp v&agrave; tiện lợi.</p>\n	</li>\n</ul>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (95, 5, 'Túi Đeo Chéo Nam Đầu Cá Sấu Daily15', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQQVJHkfiCo-Xnf36puDWUsq72V1kGKj2ZywE7deGG1j3Q7egJojx1s8VqeR_n__jrT7Qf1-WsiwuLuwTL1Key7Mt0T1VwPIcJpXmEvDLHEtUyvIxKUx0x25zM&usqp=CAE', 2399000, '<p><strong>M&ocirc; tả sản phẩm: T&uacute;i Đeo Ch&eacute;o Nam Đầu C&aacute; Sấu Daily15</strong></p>\n\n<p>Mang đến phong c&aacute;ch mạnh mẽ v&agrave; đẳng cấp, <strong>T&uacute;i Đeo Ch&eacute;o Nam Đầu C&aacute; Sấu Daily15</strong> l&agrave; sự lựa chọn ho&agrave;n hảo cho những qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch sự tinh tế v&agrave; tiện dụng.</p>\n\n<h3><strong>Đặc điểm nổi bật:</strong></h3>\n\n<ul>\n	<li><strong>Thiết kế độc đ&aacute;o:</strong> Điểm nhấn l&agrave; phần đầu c&aacute; sấu được chế t&aacute;c tinh xảo, mang lại vẻ ngo&agrave;i ấn tượng v&agrave; thu h&uacute;t.</li>\n	<li><strong>Chất liệu cao cấp:</strong> Sử dụng da thật 100%, mềm mại, bền bỉ với thời gian, đảm bảo kh&ocirc;ng bị bong tr&oacute;c hay nứt g&atilde;y khi sử dụng l&acirc;u d&agrave;i.</li>\n	<li><strong>K&iacute;ch thước tiện dụng:</strong> Với thiết kế vừa vặn, t&uacute;i c&oacute; thể chứa điện thoại, v&iacute;, ch&igrave;a kh&oacute;a, v&agrave; c&aacute;c vật dụng c&aacute; nh&acirc;n cần thiết khi ra ngo&agrave;i.</li>\n	<li><strong>Ngăn chứa th&ocirc;ng minh:</strong> Bố tr&iacute; ngăn ch&iacute;nh rộng r&atilde;i v&agrave; c&aacute;c ngăn phụ gi&uacute;p bạn sắp xếp đồ d&ugrave;ng một c&aacute;ch ngăn nắp.</li>\n	<li><strong>D&acirc;y đeo chắc chắn:</strong> C&oacute; thể điều chỉnh độ d&agrave;i linh hoạt, ph&ugrave; hợp với nhiều d&aacute;ng người v&agrave; phong c&aacute;ch sử dụng.</li>\n</ul>\n\n<h3><strong>Phong c&aacute;ch v&agrave; ứng dụng:</strong></h3>\n\n<p>T&uacute;i Đeo Ch&eacute;o Nam Daily15 kh&ocirc;ng chỉ l&agrave; một phụ kiện thời trang m&agrave; c&ograve;n l&agrave; người bạn đồng h&agrave;nh l&yacute; tưởng cho c&aacute;c hoạt động h&agrave;ng ng&agrave;y như đi l&agrave;m, dạo phố, hay du lịch. Thiết kế sang trọng kết hợp với sự tiện lợi gi&uacute;p bạn lu&ocirc;n nổi bật v&agrave; tự tin trong mọi ho&agrave;n cảnh.</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (96, 3, 'Túi xách nam full da cá Alligator', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/364/978/products/tui-xach-nam-full-da-ca-alligator-3.jpg?v=1730894462887', 1299000, '<p><strong>M&ocirc; tả sản phẩm: T&uacute;i X&aacute;ch Nam Full Da C&aacute; Sấu Alligator</strong></p>\n\n<p><strong>T&uacute;i X&aacute;ch Nam Full Da C&aacute; Sấu Alligator</strong> l&agrave; một biểu tượng của sự sang trọng v&agrave; đẳng cấp, được thiết kế d&agrave;nh ri&ecirc;ng cho những qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch phong c&aacute;ch lịch l&atilde;m v&agrave; đẳng cấp. Với chất liệu da c&aacute; sấu tự nhi&ecirc;n cao cấp, sản phẩm kh&ocirc;ng chỉ mang lại vẻ ngo&agrave;i nổi bật m&agrave; c&ograve;n đảm bảo độ bền vượt trội theo thời gian.</p>\n\n<h3><strong>Đặc điểm nổi bật:</strong></h3>\n\n<ul>\n	<li><strong>Chất liệu da c&aacute; sấu tự nhi&ecirc;n:</strong><br />\n	To&agrave;n bộ t&uacute;i được l&agrave;m từ da c&aacute; sấu thật 100%, nổi bật với c&aacute;c v&acirc;n da độc đ&aacute;o, tự nhi&ecirc;n v&agrave; kh&ocirc;ng bao giờ tr&ugrave;ng lặp. Chất liệu n&agrave;y kh&ocirc;ng chỉ bền bỉ m&agrave; c&ograve;n mang lại cảm gi&aacute;c mềm mại v&agrave; cao cấp.</li>\n	<li><strong>Thiết kế tinh tế:</strong><br />\n	T&uacute;i được chế t&aacute;c tỉ mỉ với c&aacute;c đường may chắc chắn, kiểu d&aacute;ng hiện đại ph&ugrave; hợp với mọi phong c&aacute;ch, từ c&ocirc;ng sở đến dạo phố hay gặp gỡ đối t&aacute;c.</li>\n	<li><strong>Ngăn chứa tiện lợi:</strong><br />\n	B&ecirc;n trong t&uacute;i c&oacute; nhiều ngăn rộng r&atilde;i, được l&oacute;t bằng lớp da mịn hoặc vải cao cấp, gi&uacute;p bạn sắp xếp laptop, t&agrave;i liệu, v&iacute; tiền v&agrave; c&aacute;c vật dụng c&aacute; nh&acirc;n một c&aacute;ch ngăn nắp.</li>\n	<li><strong>Kh&oacute;a k&eacute;o v&agrave; phụ kiện cao cấp:</strong><br />\n	C&aacute;c chi tiết như kh&oacute;a k&eacute;o, m&oacute;c nối được l&agrave;m từ kim loại chống gỉ, s&aacute;ng b&oacute;ng, tăng th&ecirc;m vẻ sang trọng v&agrave; độ bền cho sản phẩm.</li>\n	<li><strong>Tay cầm v&agrave; d&acirc;y đeo linh hoạt:</strong><br />\n	Tay cầm chắc chắn, vừa vặn với tay cầm nam giới. D&acirc;y đeo vai c&oacute; thể th&aacute;o rời v&agrave; điều chỉnh độ d&agrave;i, mang lại sự thoải m&aacute;i khi sử dụng.</li>\n</ul>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (97, 5, 'Túi đeo chéo nam da cá sấu', 'https://phukiengiasicamau.com/wp-content/uploads/2019/09/69212545_1110397735819477_4122638746929594368_n.x20904.jpg', 1180000, '<p><strong>T&uacute;i Đeo Ch&eacute;o Nam Da C&aacute; Sấu - Phong C&aacute;ch Đẳng Cấp v&agrave; Sang Trọng</strong></p>\n\n<p>Mang đậm dấu ấn thời thượng, t&uacute;i đeo ch&eacute;o nam da c&aacute; sấu l&agrave; lựa chọn ho&agrave;n hảo cho qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch sự tinh tế v&agrave; kh&aacute;c biệt. Được chế t&aacute;c từ da c&aacute; sấu thật 100%, sản phẩm kh&ocirc;ng chỉ bền bỉ m&agrave; c&ograve;n sở hữu vẻ ngo&agrave;i độc đ&aacute;o với c&aacute;c v&acirc;n da tự nhi&ecirc;n, sắc n&eacute;t, kh&ocirc;ng mẫu n&agrave;o giống mẫu n&agrave;o.</p>\n\n<h3><strong>Đặc điểm nổi bật:</strong></h3>\n\n<ul>\n	<li><strong>Chất liệu cao cấp:</strong> Da c&aacute; sấu thật với độ bền vượt trội, chống trầy xước v&agrave; giữ được vẻ đẹp theo thời gian.</li>\n	<li><strong>Thiết kế tiện dụng:</strong> T&uacute;i đeo ch&eacute;o với nhiều ngăn rộng r&atilde;i, ph&ugrave; hợp để đựng điện thoại, v&iacute;, sổ tay, v&agrave; c&aacute;c vật dụng c&aacute; nh&acirc;n.</li>\n	<li><strong>Kiểu d&aacute;ng thời trang:</strong> Phong c&aacute;ch hiện đại, mạnh mẽ, dễ d&agrave;ng phối hợp với nhiều trang phục, từ c&ocirc;ng sở đến dạo phố.</li>\n	<li><strong>Phụ kiện cao cấp:</strong> Kh&oacute;a k&eacute;o v&agrave; d&acirc;y đeo chắc chắn, được gia c&ocirc;ng tỉ mỉ, mang lại sự an t&acirc;m khi sử dụng.</li>\n</ul>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (98, 5, 'Túi Đeo Chéo Da Cá Sấu – T5200', 'https://casauphuongdong.com/wp-content/uploads/2023/05/z5819091666916_af64eba3daa9f8890ed51e0cba93207f.jpg', 2299000, '<p><strong>T&uacute;i Đeo Ch&eacute;o Da C&aacute; Sấu &ndash; T5200: Đẳng Cấp v&agrave; Phong C&aacute;ch</strong></p>\n\n<p>T&uacute;i đeo ch&eacute;o da c&aacute; sấu T5200 l&agrave; sự kết hợp ho&agrave;n hảo giữa thiết kế hiện đại v&agrave; chất liệu cao cấp, mang lại sự tiện lợi v&agrave; đẳng cấp cho qu&yacute; &ocirc;ng. Với vẻ ngo&agrave;i sang trọng, được chế t&aacute;c từ da c&aacute; sấu thật 100%, sản phẩm l&agrave; biểu tượng của phong c&aacute;ch v&agrave; gu thẩm mỹ tinh tế.</p>\n\n<h3><strong>Đặc điểm nổi bật:</strong></h3>\n\n<ul>\n	<li><strong>Chất liệu da c&aacute; sấu thật:</strong> V&acirc;n da tự nhi&ecirc;n độc đ&aacute;o, bền bỉ, kh&ocirc;ng bị phai m&agrave;u hay bong tr&oacute;c theo thời gian.</li>\n	<li><strong>Thiết kế tinh tế:</strong> T&uacute;i T5200 sở hữu kiểu d&aacute;ng thời trang, nhỏ gọn nhưng vẫn đủ kh&ocirc;ng gian cho c&aacute;c vật dụng cần thiết như điện thoại, v&iacute;, ch&igrave;a kh&oacute;a, v&agrave; c&aacute;c phụ kiện kh&aacute;c.</li>\n	<li><strong>Ngăn chứa tiện lợi:</strong> Bố tr&iacute; nhiều ngăn nhỏ v&agrave; ngăn ch&iacute;nh rộng r&atilde;i, gi&uacute;p bạn dễ d&agrave;ng sắp xếp đồ đạc một c&aacute;ch khoa học.</li>\n	<li><strong>Phụ kiện chất lượng cao:</strong> Kh&oacute;a k&eacute;o, d&acirc;y đeo v&agrave; c&aacute;c chi tiết kim loại được gia c&ocirc;ng tỉ mỉ, đảm bảo độ bền v&agrave; sự an to&agrave;n khi sử dụng.</li>\n	<li><strong>Kiểu d&aacute;ng thời thượng:</strong> Ph&ugrave; hợp cho nhiều dịp kh&aacute;c nhau như đi l&agrave;m, đi chơi, hay gặp gỡ đối t&aacute;c.</li>\n</ul>\n\n<h3>&nbsp;</h3>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (99, 4, 'Túi Xách Da Cá Sấu – T3300 – Màu Đỏ', 'https://casauphuongdong.com/wp-content/uploads/2023/02/tui-xach-da-ca-sau-ct3300-do-6.jpg', 1120000, '<h3><strong>T&uacute;i X&aacute;ch Da C&aacute; Sấu &ndash; T3300 &ndash; M&agrave;u Đỏ: Sự Sang Trọng Tỏa S&aacute;ng</strong></h3>\n\n<p>T&uacute;i x&aacute;ch da c&aacute; sấu T3300 m&agrave;u đỏ l&agrave; một kiệt t&aacute;c thời trang d&agrave;nh cho những ai y&ecirc;u th&iacute;ch sự đẳng cấp v&agrave; phong c&aacute;ch nổi bật. Được chế t&aacute;c từ da c&aacute; sấu thật 100%, sản phẩm mang đến vẻ đẹp tự nhi&ecirc;n từ những v&acirc;n da độc đ&aacute;o, kết hợp c&ugrave;ng m&agrave;u đỏ rực rỡ, gi&uacute;p bạn thu h&uacute;t mọi &aacute;nh nh&igrave;n.</p>\n\n<hr />\n<h3><strong>Đặc điểm nổi bật:</strong></h3>\n\n<ul>\n	<li><strong>Chất liệu cao cấp:</strong> Da c&aacute; sấu thật với độ bền vượt trội, giữ được n&eacute;t đẹp tự nhi&ecirc;n v&agrave; sự mềm mại qua thời gian.</li>\n	<li><strong>M&agrave;u sắc sang trọng:</strong> M&agrave;u đỏ qu&yacute; ph&aacute;i, l&agrave; biểu tượng của sự may mắn v&agrave; năng lượng, dễ d&agrave;ng kết hợp với nhiều trang phục kh&aacute;c nhau.</li>\n	<li><strong>Thiết kế thời thượng:</strong> Kiểu d&aacute;ng t&uacute;i x&aacute;ch hiện đại, gọn g&agrave;ng nhưng vẫn đủ sức chứa cho c&aacute;c vật dụng c&aacute; nh&acirc;n quan trọng.</li>\n	<li><strong>Ngăn chứa tiện dụng:</strong> Bố tr&iacute; hợp l&yacute; với ngăn ch&iacute;nh rộng r&atilde;i v&agrave; c&aacute;c ngăn phụ nhỏ, gi&uacute;p bạn sắp xếp đồ d&ugrave;ng một c&aacute;ch gọn g&agrave;ng v&agrave; dễ t&igrave;m.</li>\n	<li><strong>Phụ kiện cao cấp:</strong> Kh&oacute;a k&eacute;o, tay cầm, v&agrave; d&acirc;y đeo được thiết kế tinh xảo, đảm bảo độ bền v&agrave; sự an to&agrave;n khi sử dụng.</li>\n</ul>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (100, 5, 'Túi Đeo Chéo Da Cá Sấu Nguyên Con Nhỏ', 'https://casauphuongdong.com/wp-content/uploads/2019/02/tui-dau-nho.jpg', 12000000, '<h3><strong>T&uacute;i Đeo Ch&eacute;o Da C&aacute; Sấu Nguy&ecirc;n Con Nhỏ &ndash; Tinh Tế v&agrave; Đẳng Cấp</strong></h3>\n\n<p>T&uacute;i đeo ch&eacute;o da c&aacute; sấu nguy&ecirc;n con nhỏ l&agrave; sản phẩm độc đ&aacute;o, được chế t&aacute;c từ da c&aacute; sấu thật nguy&ecirc;n con, mang đến vẻ đẹp tự nhi&ecirc;n v&agrave; đậm chất c&aacute; t&iacute;nh. Với thiết kế nhỏ gọn, tiện lợi nhưng kh&ocirc;ng k&eacute;m phần sang trọng, đ&acirc;y l&agrave; lựa chọn ho&agrave;n hảo cho những ai y&ecirc;u th&iacute;ch sự kh&aacute;c biệt v&agrave; phong c&aacute;ch.</p>\n\n<hr />\n<h3><strong>Đặc điểm nổi bật:</strong></h3>\n\n<ul>\n	<li><strong>Chất liệu cao cấp:</strong> L&agrave;m từ da c&aacute; sấu thật nguy&ecirc;n con, từng chi tiết v&acirc;n da đều giữ được sự tự nhi&ecirc;n, tạo n&ecirc;n vẻ đẹp độc đ&aacute;o, kh&ocirc;ng tr&ugrave;ng lặp.</li>\n	<li><strong>Thiết kế nhỏ gọn:</strong> K&iacute;ch thước tối ưu để đựng c&aacute;c vật dụng c&aacute; nh&acirc;n như điện thoại, v&iacute;, ch&igrave;a kh&oacute;a, v&agrave; c&aacute;c phụ kiện nhỏ kh&aacute;c.</li>\n	<li><strong>Phong c&aacute;ch độc đ&aacute;o:</strong> Với phần đầu, lưng, v&agrave; đu&ocirc;i c&aacute; sấu được giữ nguy&ecirc;n vẹn, sản phẩm mang lại vẻ đẹp mạnh mẽ v&agrave; đậm chất nghệ thuật.</li>\n	<li><strong>Ngăn chứa tiện lợi:</strong> Bố tr&iacute; một ngăn ch&iacute;nh rộng r&atilde;i v&agrave; một v&agrave;i ngăn phụ nhỏ, gi&uacute;p bạn sắp xếp đồ d&ugrave;ng gọn g&agrave;ng.</li>\n	<li><strong>D&acirc;y đeo điều chỉnh:</strong> D&acirc;y đeo chắc chắn, c&oacute; thể điều chỉnh độ d&agrave;i để ph&ugrave; hợp với nhiều d&aacute;ng người v&agrave; phong c&aacute;ch kh&aacute;c nhau.</li>\n</ul>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (101, 5, 'Túi Đeo Chéo Da Cá Sấu – T5000', 'https://casauphuongdong.com/wp-content/uploads/2023/09/z4658532209737_1112cba25e4008a3ea3deb32f7d0af2f-1024x1024.jpg', 1230000, '<h3><strong>T&uacute;i Đeo Ch&eacute;o Da C&aacute; Sấu &ndash; T5000: Đẳng Cấp v&agrave; Sang Trọng</strong></h3>\n\n<p>T&uacute;i đeo ch&eacute;o da c&aacute; sấu T5000 l&agrave; biểu tượng của phong c&aacute;ch hiện đại v&agrave; sự đẳng cấp. Được chế t&aacute;c từ da c&aacute; sấu thật 100%, sản phẩm kh&ocirc;ng chỉ bền bỉ m&agrave; c&ograve;n sở hữu vẻ đẹp độc đ&aacute;o với c&aacute;c v&acirc;n da tự nhi&ecirc;n, mang lại sự kh&aacute;c biệt v&agrave; cuốn h&uacute;t cho người sử dụng.</p>\n\n<hr />\n<h3><strong>Đặc điểm nổi bật:</strong></h3>\n\n<ul>\n	<li><strong>Chất liệu cao cấp:</strong> Da c&aacute; sấu thật với c&aacute;c v&acirc;n da sắc n&eacute;t, độc đ&aacute;o, kh&ocirc;ng chiếc t&uacute;i n&agrave;o giống nhau, tạo n&ecirc;n gi&aacute; trị ri&ecirc;ng biệt.</li>\n	<li><strong>Thiết kế tiện dụng:</strong> T&uacute;i T5000 c&oacute; kiểu d&aacute;ng đeo ch&eacute;o nhỏ gọn, dễ d&agrave;ng mang theo, ph&ugrave; hợp với phong c&aacute;ch sống năng động.</li>\n	<li><strong>Ngăn chứa th&ocirc;ng minh:</strong> Ngăn ch&iacute;nh rộng r&atilde;i, kết hợp với c&aacute;c ngăn phụ được bố tr&iacute; khoa học, gi&uacute;p bạn dễ d&agrave;ng sắp xếp c&aacute;c vật dụng như điện thoại, v&iacute;, ch&igrave;a kh&oacute;a v&agrave; phụ kiện nhỏ.</li>\n	<li><strong>Phụ kiện chất lượng cao:</strong> Kh&oacute;a k&eacute;o v&agrave; d&acirc;y đeo chắc chắn, được gia c&ocirc;ng tỉ mỉ để đảm bảo độ bền v&agrave; sự thoải m&aacute;i khi sử dụng.</li>\n	<li><strong>Kiểu d&aacute;ng thời thượng:</strong> Ph&ugrave; hợp cho cả c&ocirc;ng việc, dạo phố hoặc những buổi gặp gỡ bạn b&egrave;, đối t&aacute;c.</li>\n</ul>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (102, 5, 'Túi Da Cá Sấu Nguyên Con – T6545', 'https://casauphuongdong.com/wp-content/uploads/2021/06/tui-deo-cheo-da-ca-sau-T6545-3-1.jpg', 2100000, '<h3><strong>T&uacute;i Da C&aacute; Sấu Nguy&ecirc;n Con &ndash; T6545</strong></h3>\n\n<p>T&uacute;i T6545 được chế t&aacute;c từ da c&aacute; sấu thật nguy&ecirc;n con, giữ trọn vẻ đẹp tự nhi&ecirc;n với phần đầu, lưng v&agrave; đu&ocirc;i c&aacute; sấu. Thiết kế sang trọng, độc đ&aacute;o, c&ugrave;ng ngăn chứa rộng r&atilde;i, ph&ugrave; hợp để đựng c&aacute;c vật dụng c&aacute; nh&acirc;n.</p>\n\n<ul>\n	<li><strong>Chất liệu cao cấp:</strong> Da c&aacute; sấu thật 100%, bền bỉ, c&agrave;ng d&ugrave;ng c&agrave;ng đẹp.</li>\n	<li><strong>Thiết kế độc đ&aacute;o:</strong> Tinh tế, đẳng cấp, tạo điểm nhấn kh&aacute;c biệt.</li>\n	<li><strong>Ngăn chứa tiện dụng:</strong> Đủ kh&ocirc;ng gian cho điện thoại, v&iacute;, ch&igrave;a kh&oacute;a v&agrave; phụ kiện nhỏ.</li>\n	<li><strong>M&agrave;u sắc:</strong> Đen, n&acirc;u, hoặc m&agrave;u tự nhi&ecirc;n.</li>\n</ul>\n\n<p>T6545 l&agrave; lựa chọn ho&agrave;n hảo để thể hiện phong c&aacute;ch v&agrave; sự đẳng cấp của bạn!</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (103, 5, 'Túi Đeo Chéo Da Cá Sấu – T3700', 'https://casauphuongdong.com/wp-content/uploads/2024/08/z5775309079745_eb2c83c763dcac93780df7f18ab0a866.jpg', 999000, '<h3><strong>T&uacute;i Đeo Ch&eacute;o Da C&aacute; Sấu &ndash; T3700: Phong C&aacute;ch Tinh Tế v&agrave; Đẳng Cấp</strong></h3>\n\n<p>T&uacute;i đeo ch&eacute;o <strong>T3700</strong> được chế t&aacute;c từ <strong>da c&aacute; sấu thật 100%</strong>, mang đến vẻ đẹp tự nhi&ecirc;n với những v&acirc;n da độc đ&aacute;o, sắc n&eacute;t. Sản phẩm kh&ocirc;ng chỉ nổi bật nhờ chất liệu cao cấp m&agrave; c&ograve;n bởi thiết kế tinh tế, nhỏ gọn nhưng v&ocirc; c&ugrave;ng tiện dụng. Đ&acirc;y l&agrave; phụ kiện l&yacute; tưởng cho những qu&yacute; &ocirc;ng, qu&yacute; b&agrave; y&ecirc;u th&iacute;ch sự sang trọng, kh&aacute;c biệt v&agrave; phong c&aacute;ch mạnh mẽ.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu cao cấp:</strong><br />\n	Da c&aacute; sấu thật, bền bỉ v&agrave; c&agrave;ng sử dụng c&agrave;ng đẹp, giữ được vẻ ngo&agrave;i sang trọng theo thời gian.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế thời thượng:</strong><br />\n	Kiểu d&aacute;ng nhỏ gọn, dễ d&agrave;ng mang theo, ph&ugrave; hợp với nhiều ho&agrave;n cảnh từ c&ocirc;ng sở, dạo phố đến c&aacute;c buổi gặp gỡ bạn b&egrave; hay đối t&aacute;c.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa tiện lợi:</strong><br />\n	T&uacute;i được thiết kế với ngăn ch&iacute;nh rộng r&atilde;i v&agrave; c&aacute;c ngăn phụ nhỏ, gi&uacute;p bạn sắp xếp đồ đạc một c&aacute;ch khoa học, gọn g&agrave;ng v&agrave; dễ d&agrave;ng t&igrave;m kiếm.</p>\n	</li>\n</ul>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (104, 5, 'Túi Đeo Chéo Nam Da Cá Sấu Daily474', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTHzGD2GTP-1OlMkgXepljFNX6Uu2VpdNpZ7okYNLwEYIc3S7QiwFqezb4TuXBWaAC51n6Ubah8nZX528daZkyFIthFvzH4LN0Awb6dodAof3klX5qCBc5PZnpnAnxi-Qyy6MmtYXDScg&usqp=CAc', 2100000, '<h3><strong>&uacute;i Đeo Ch&eacute;o Nam Da C&aacute; Sấu &ndash; Daily474: Phong C&aacute;ch Lịch L&atilde;m v&agrave; Tiện Dụng</strong></h3>\n\n<p>T&uacute;i đeo ch&eacute;o <strong>Daily474</strong> được chế t&aacute;c từ <strong>da c&aacute; sấu thật 100%</strong>, mang đến sự sang trọng v&agrave; đẳng cấp với c&aacute;c v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o. Với thiết kế nhỏ gọn, tinh tế nhưng v&ocirc; c&ugrave;ng tiện dụng, sản phẩm n&agrave;y l&agrave; lựa chọn ho&agrave;n hảo cho những qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch sự kh&aacute;c biệt v&agrave; phong c&aacute;ch mạnh mẽ.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu cao cấp:</strong><br />\n	Da c&aacute; sấu thật, bền bỉ v&agrave; giữ được vẻ đẹp theo thời gian, tạo n&ecirc;n sự kh&aacute;c biệt cho người sử dụng.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế tiện dụng:</strong><br />\n	T&uacute;i c&oacute; kiểu d&aacute;ng nhỏ gọn, dễ d&agrave;ng đeo ch&eacute;o, ph&ugrave; hợp với nhiều ho&agrave;n cảnh từ c&ocirc;ng sở, dạo phố đến c&aacute;c buổi gặp gỡ bạn b&egrave; hay đối t&aacute;c.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa th&ocirc;ng minh:</strong><br />\n	Với ngăn ch&iacute;nh rộng r&atilde;i v&agrave; c&aacute;c ngăn phụ tiện lợi, bạn c&oacute; thể sắp xếp đồ đạc gọn g&agrave;ng, dễ d&agrave;ng t&igrave;m kiếm những vật dụng cần thiết như điện thoại, v&iacute;, ch&igrave;a kh&oacute;a, v&agrave; c&aacute;c phụ kiện kh&aacute;c.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc:</strong><br />\n	Đen, n&acirc;u, n&acirc;u đỏ (t&ugrave;y chọn theo sở th&iacute;ch c&aacute; nh&acirc;n).</p>\n	</li>\n</ul>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (105, 3, 'Cặp nam da cá sấu KHÓA SỐ CẦM TAY LỊCH LÃM!', 'https://bizweb.dktcdn.net/thumb/grande/100/376/377/products/tui-cam-tay-nam-da-ca-sau-ovenis-5.jpg?v=1625627214333', 1231000, '<h3><strong>Cặp Nam Da C&aacute; Sấu &ndash; Kh&oacute;a Số Cầm Tay Lịch L&atilde;m</strong></h3>\n\n<p>Cặp nam da c&aacute; sấu với kh&oacute;a số cầm tay l&agrave; sự kết hợp ho&agrave;n hảo giữa phong c&aacute;ch lịch l&atilde;m v&agrave; t&iacute;nh năng bảo mật cao. Được chế t&aacute;c từ <strong>da c&aacute; sấu thật</strong>, sản phẩm mang đến vẻ đẹp tự nhi&ecirc;n, sang trọng v&agrave; đẳng cấp. Thiết kế kh&oacute;a số an to&agrave;n gi&uacute;p bảo vệ t&agrave;i sản c&aacute; nh&acirc;n, đồng thời tăng th&ecirc;m sự tinh tế v&agrave; phong c&aacute;ch cho người sử dụng.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu cao cấp:</strong><br />\n	Da c&aacute; sấu thật, bền bỉ v&agrave; mang lại vẻ đẹp độc đ&aacute;o, kh&ocirc;ng giống bất kỳ chiếc cặp n&agrave;o kh&aacute;c. V&acirc;n da tự nhi&ecirc;n của c&aacute; sấu c&agrave;ng sử dụng c&agrave;ng đẹp, tạo n&ecirc;n sự kh&aacute;c biệt cho người sở hữu.</p>\n	</li>\n	<li>\n	<p><strong>Kh&oacute;a số an to&agrave;n:</strong><br />\n	Được trang bị kh&oacute;a số bảo mật, gi&uacute;p bạn y&ecirc;n t&acirc;m bảo vệ t&agrave;i sản c&aacute; nh&acirc;n khi di chuyển hoặc c&ocirc;ng t&aacute;c.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế lịch l&atilde;m:</strong><br />\n	Kiểu d&aacute;ng cặp cầm tay sang trọng, ph&ugrave; hợp với c&aacute;c qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch sự lịch l&atilde;m, tinh tế. Cặp kh&ocirc;ng chỉ l&agrave; phụ kiện m&agrave; c&ograve;n l&agrave; biểu tượng của sự th&agrave;nh đạt.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa th&ocirc;ng minh:</strong><br />\n	Cặp được thiết kế với ngăn ch&iacute;nh rộng r&atilde;i, ngăn phụ tiện lợi để đựng c&aacute;c vật dụng như laptop, t&agrave;i liệu, v&iacute;, b&uacute;t v&agrave; c&aacute;c phụ kiện kh&aacute;c</p>\n	</li>\n</ul>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (106, 4, 'Túi Da Cá Sấu Hermes Kelly Mini Vàng Chanh', 'https://daynitcasau.vn/wp-content/uploads/2022/12/daynitcasau.vn-tui-da-ca-sau-hermes-kelly-mini-vang-chanh-1.jpg', 1220000, '<h3><strong>T&uacute;i Da C&aacute; Sấu Hermes Kelly Mini &ndash; V&agrave;ng Chanh: Biểu Tượng Của Sự Sang Trọng</strong></h3>\n\n<p>T&uacute;i <strong>Hermes Kelly Mini</strong> m&agrave;u <strong>V&agrave;ng Chanh</strong> l&agrave; sự kết hợp ho&agrave;n hảo giữa thiết kế cổ điển v&agrave; chất liệu da c&aacute; sấu cao cấp, mang đến vẻ đẹp tinh tế v&agrave; đẳng cấp. Với k&iacute;ch thước mini, chiếc t&uacute;i n&agrave;y kh&ocirc;ng chỉ l&agrave; phụ kiện thời trang m&agrave; c&ograve;n l&agrave; biểu tượng của sự sang trọng v&agrave; phong c&aacute;ch c&aacute; nh&acirc;n.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu thật:</strong><br />\n	Được chế t&aacute;c từ da c&aacute; sấu thật, mỗi chiếc t&uacute;i đều c&oacute; v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o, tạo n&ecirc;n sự kh&aacute;c biệt v&agrave; gi&aacute; trị vượt trội.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc v&agrave;ng chanh nổi bật:</strong><br />\n	M&agrave;u v&agrave;ng chanh tươi s&aacute;ng, mang lại sự trẻ trung v&agrave; năng động nhưng vẫn giữ được sự sang trọng, dễ d&agrave;ng phối hợp với nhiều phong c&aacute;ch v&agrave; trang phục.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế mini thanh lịch:</strong><br />\n	Kiểu d&aacute;ng nhỏ gọn, vừa vặn để đựng c&aacute;c vật dụng c&aacute; nh&acirc;n như điện thoại, v&iacute;, ch&igrave;a kh&oacute;a, mang đến sự tiện lợi m&agrave; vẫn rất thời thượng.</p>\n	</li>\n	<li>\n	<p><strong>Kh&oacute;a c&agrave;i đặc trưng của Hermes:</strong><br />\n	Kh&oacute;a c&agrave;i tinh tế với thiết kế đặc trưng của Hermes, kh&ocirc;ng chỉ gi&uacute;p bảo vệ đồ đạc m&agrave; c&ograve;n tạo điểm nhấn sang trọng cho chiếc t&uacute;i.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa th&ocirc;ng minh:</strong><br />\n	Ngăn ch&iacute;nh rộng r&atilde;i v&agrave; c&aacute;c ngăn phụ nhỏ gi&uacute;p bạn dễ d&agrave;ng sắp xếp đồ đạc gọn g&agrave;ng, tiện lợi khi sử dụng.</p>\n	</li>\n</ul>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (109, 5, 'Túi Đeo Chéo Giả Da Cá Sấu Thời Trang Nữ', 'https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-lov1ye60gkem8e@resize_w450_nl.webp', 2121000, '', '2025-01-16', 1);
INSERT INTO `products` VALUES (110, 5, 'Túi đeo nữ da cá sấu Huy Hoàng màu nâu đỏ HP6256', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/376/377/products/tui-xach-nu-da-ca-sau-ovenis-237.jpg?v=1668497839017', 3333000, '<h3><strong>T&uacute;i Đeo Nữ Da C&aacute; Sấu Huy Ho&agrave;ng M&agrave;u N&acirc;u Đỏ &ndash; HP6256: Sự Kết Hợp Ho&agrave;n Hảo Giữa Sang Trọng v&agrave; Phong C&aacute;ch</strong></h3>\n\n<p>T&uacute;i đeo nữ <strong>da c&aacute; sấu Huy Ho&agrave;ng</strong> m&agrave;u <strong>n&acirc;u đỏ HP6256</strong> l&agrave; một lựa chọn tuyệt vời cho những c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự tinh tế v&agrave; đẳng cấp. Được chế t&aacute;c từ <strong>da c&aacute; sấu thật</strong>, t&uacute;i mang đến vẻ đẹp tự nhi&ecirc;n với c&aacute;c v&acirc;n da độc đ&aacute;o, c&ugrave;ng m&agrave;u sắc n&acirc;u đỏ sang trọng, ph&ugrave; hợp với nhiều phong c&aacute;ch v&agrave; dịp kh&aacute;c nhau.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu cao cấp:</strong><br />\n	Được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, chiếc t&uacute;i n&agrave;y c&oacute; độ bền vượt trội v&agrave; vẻ đẹp tự nhi&ecirc;n, mỗi chiếc t&uacute;i đều mang những v&acirc;n da độc đ&aacute;o, kh&ocirc;ng giống nhau.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc sang trọng:</strong><br />\n	M&agrave;u <strong>n&acirc;u đỏ</strong> vừa cổ điển, vừa hiện đại, dễ d&agrave;ng kết hợp với nhiều trang phục, mang lại vẻ đẹp thanh lịch v&agrave; cuốn h&uacute;t.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế tinh tế:</strong><br />\n	Kiểu d&aacute;ng nhỏ gọn, dễ d&agrave;ng mang theo, t&uacute;i c&oacute; thể đeo ch&eacute;o hoặc x&aacute;ch tay, ph&ugrave; hợp cho c&aacute;c buổi tiệc, dạo phố, hay c&ocirc;ng sở.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa tiện dụng:</strong><br />\n	Ngăn ch&iacute;nh rộng r&atilde;i, gi&uacute;p bạn dễ d&agrave;ng sắp xếp đồ đạc c&aacute; nh&acirc;n như điện thoại, v&iacute;, ch&igrave;a kh&oacute;a, son m&ocirc;i, v&agrave; c&aacute;c vật dụng nhỏ kh&aacute;c.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo điều chỉnh:</strong><br />\n	D&acirc;y đeo c&oacute; thể điều chỉnh độ d&agrave;i, gi&uacute;p bạn dễ d&agrave;ng thay đổi kiểu d&aacute;ng v&agrave; ph&ugrave; hợp với từng ho&agrave;n cảnh.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>T&uacute;i Đeo Nữ Da C&aacute; Sấu Huy Ho&agrave;ng M&agrave;u N&acirc;u Đỏ &ndash; HP6256</strong> l&agrave; lựa chọn l&yacute; tưởng cho những c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự sang trọng, tinh tế v&agrave; độc đ&aacute;o. Với chất liệu cao cấp v&agrave; thiết kế đẳng cấp, chiếc t&uacute;i n&agrave;y sẽ l&agrave; m&oacute;n phụ kiện ho&agrave;n hảo để t&ocirc;n l&ecirc;n phong c&aacute;ch v&agrave; c&aacute; t&iacute;nh của bạn.</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (111, 5, 'Túi nữ da cá sấu Size lớn 28cm. Bản màu Trắng tro đặc biệt cao cấp! ', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/027/341/products/tui-xach-nu-ca-sau-25a.jpg?v=1705482591220', 4650000, '<h3><strong>T&uacute;i Nữ Da C&aacute; Sấu Size Lớn 28cm &ndash; M&agrave;u Trắng Tro Cao Cấp</strong></h3>\n\n<p>T&uacute;i nữ <strong>da c&aacute; sấu size lớn 28cm</strong> m&agrave;u <strong>Trắng Tro</strong> l&agrave; sự kết hợp ho&agrave;n hảo giữa vẻ đẹp sang trọng v&agrave; sự tiện dụng. Được chế t&aacute;c từ <strong>da c&aacute; sấu thật</strong>, chiếc t&uacute;i n&agrave;y kh&ocirc;ng chỉ nổi bật với chất liệu cao cấp m&agrave; c&ograve;n c&oacute; thiết kế thời thượng, ph&ugrave; hợp với những c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự kh&aacute;c biệt v&agrave; đẳng cấp.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu thật:</strong><br />\n	Được l&agrave;m từ <strong>da c&aacute; sấu thật</strong> cao cấp, t&uacute;i mang đến vẻ đẹp tự nhi&ecirc;n v&agrave; bền bỉ, với c&aacute;c v&acirc;n da độc đ&aacute;o, kh&ocirc;ng chiếc n&agrave;o giống chiếc n&agrave;o.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc trắng tro tinh tế:</strong><br />\n	M&agrave;u <strong>Trắng Tro</strong> đặc biệt mang lại vẻ đẹp thanh lịch, dễ d&agrave;ng phối hợp với nhiều loại trang phục v&agrave; phong c&aacute;ch kh&aacute;c nhau, từ c&ocirc;ng sở đến dạo phố.</p>\n	</li>\n	<li>\n	<p><strong>K&iacute;ch thước lớn tiện dụng:</strong><br />\n	Với k&iacute;ch thước <strong>28cm</strong>, t&uacute;i c&oacute; kh&ocirc;ng gian rộng r&atilde;i để đựng c&aacute;c vật dụng c&aacute; nh&acirc;n như điện thoại, v&iacute;, mỹ phẩm, v&agrave; c&aacute;c phụ kiện kh&aacute;c, rất ph&ugrave; hợp cho những c&ocirc; n&agrave;ng cần một chiếc t&uacute;i vừa thời trang vừa tiện lợi.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế sang trọng:</strong><br />\n	Kiểu d&aacute;ng hiện đại, tinh tế với c&aacute;c chi tiết được chăm ch&uacute;t kỹ lưỡng, chiếc t&uacute;i n&agrave;y chắc chắn sẽ l&agrave; điểm nhấn ho&agrave;n hảo cho phong c&aacute;ch của bạn.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo linh hoạt:</strong><br />\n	D&acirc;y đeo c&oacute; thể điều chỉnh để mang t&uacute;i theo nhiều c&aacute;ch kh&aacute;c nhau, từ đeo ch&eacute;o đến x&aacute;ch tay, mang lại sự thoải m&aacute;i v&agrave; linh hoạt khi sử dụng.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>T&uacute;i Nữ Da C&aacute; Sấu Size Lớn 28cm &ndash; M&agrave;u Trắng Tro Cao Cấp</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự sang trọng, tinh tế v&agrave; đẳng cấp. Với thiết kế đặc biệt v&agrave; chất liệu cao cấp, chiếc t&uacute;i n&agrave;y sẽ l&agrave; m&oacute;n phụ kiện ho&agrave;n hảo để t&ocirc;n l&ecirc;n vẻ đẹp v&agrave; phong c&aacute;ch của bạn.</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (112, 4, 'Túi nữ Da cá sấu xám tro siêu dễ thương. Dây đeo kim loại sang chảnh!', 'https://product.hstatic.net/200000507751/product/upload_261e8418e73248d49e1787a97b8ae4c7_medium.jpg', 2650000, '<h3><strong>T&uacute;i Nữ Da C&aacute; Sấu X&aacute;m Tro Si&ecirc;u Dễ Thương &ndash; D&acirc;y Đeo Kim Loại Sang Chảnh</strong></h3>\n\n<p>T&uacute;i nữ <strong>da c&aacute; sấu x&aacute;m tro</strong> mang đến vẻ đẹp nhẹ nh&agrave;ng nhưng v&ocirc; c&ugrave;ng tinh tế, ph&ugrave; hợp với những c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự sang trọng v&agrave; dễ thương. Chất liệu da c&aacute; sấu cao cấp kết hợp với d&acirc;y đeo kim loại sang trọng tạo n&ecirc;n một phụ kiện kh&ocirc;ng thể thiếu trong bộ sưu tập thời trang của bạn.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	T&uacute;i được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, với c&aacute;c v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o, bền bỉ v&agrave; c&agrave;ng sử dụng c&agrave;ng đẹp, mang đến vẻ đẹp sang trọng v&agrave; kh&aacute;c biệt.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc x&aacute;m tro tinh tế:</strong><br />\n	M&agrave;u <strong>x&aacute;m tro</strong> nhẹ nh&agrave;ng, thanh lịch, dễ d&agrave;ng phối hợp với nhiều phong c&aacute;ch v&agrave; trang phục kh&aacute;c nhau, từ c&ocirc;ng sở đến dạo phố.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế dễ thương v&agrave; thời thượng:</strong><br />\n	Với kiểu d&aacute;ng nhỏ gọn, t&uacute;i n&agrave;y vừa dễ thương vừa mang lại vẻ ngo&agrave;i thanh lịch. Đ&acirc;y l&agrave; lựa chọn ho&agrave;n hảo cho những c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự trẻ trung, tươi mới nhưng vẫn sang trọng.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo kim loại sang chảnh:</strong><br />\n	D&acirc;y đeo kim loại kh&ocirc;ng chỉ tăng th&ecirc;m sự sang trọng m&agrave; c&ograve;n gi&uacute;p bạn dễ d&agrave;ng mang t&uacute;i theo nhiều c&aacute;ch, từ đeo ch&eacute;o đến x&aacute;ch tay, ph&ugrave; hợp với nhiều ho&agrave;n cảnh.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa tiện dụng:</strong><br />\n	Ngăn ch&iacute;nh rộng r&atilde;i, gi&uacute;p bạn sắp xếp đồ đạc c&aacute; nh&acirc;n như điện thoại, v&iacute;, ch&igrave;a kh&oacute;a v&agrave; c&aacute;c phụ kiện nhỏ kh&aacute;c một c&aacute;ch gọn g&agrave;ng v&agrave; dễ d&agrave;ng.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>T&uacute;i Nữ Da C&aacute; Sấu X&aacute;m Tro Si&ecirc;u Dễ Thương &ndash; D&acirc;y Đeo Kim Loại Sang Chảnh</strong> l&agrave; lựa chọn l&yacute; tưởng cho những c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự tinh tế, dễ thương v&agrave; đẳng cấp. Với thiết kế đẹp mắt v&agrave; chất liệu cao cấp, chiếc t&uacute;i n&agrave;y chắc chắn sẽ l&agrave; điểm nhấn ho&agrave;n hảo cho phong c&aacute;ch của bạn.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (113, 4, 'Túi nữ da cá sấu gập 2 nhỏ gọn NHIỀU NGĂN TIỆN LỢI!', 'https://cbu01.alicdn.com/img/ibank/O1CN01kL9fo81da0Jn5UP1Z_!!2207644123751-0-cib.jpg', 1233000, '<h3><strong>T&uacute;i Nữ Da C&aacute; Sấu Gập 2 Nhỏ Gọn &ndash; Nhiều Ngăn Tiện Lợi</strong></h3>\n\n<p>T&uacute;i nữ <strong>da c&aacute; sấu gập 2 nhỏ gọn</strong> l&agrave; sự kết hợp ho&agrave;n hảo giữa t&iacute;nh tiện dụng v&agrave; phong c&aacute;ch sang trọng. Với thiết kế gập 2 hiện đại v&agrave; nhiều ngăn chứa tiện lợi, chiếc t&uacute;i n&agrave;y kh&ocirc;ng chỉ gi&uacute;p bạn dễ d&agrave;ng sắp xếp đồ đạc m&agrave; c&ograve;n l&agrave; phụ kiện thời trang gi&uacute;p t&ocirc;n l&ecirc;n vẻ đẹp thanh lịch v&agrave; tinh tế.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	Được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, chiếc t&uacute;i mang đến vẻ đẹp tự nhi&ecirc;n với c&aacute;c v&acirc;n da độc đ&aacute;o, bền bỉ v&agrave; c&agrave;ng sử dụng c&agrave;ng đẹp.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế gập 2 nhỏ gọn:</strong><br />\n	Kiểu d&aacute;ng nhỏ gọn, tiện lợi, dễ d&agrave;ng mang theo mọi l&uacute;c mọi nơi. Đ&acirc;y l&agrave; lựa chọn l&yacute; tưởng cho những c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự tiện dụng nhưng vẫn muốn giữ được phong c&aacute;ch thời trang.</p>\n	</li>\n	<li>\n	<p><strong>Nhiều ngăn tiện lợi:</strong><br />\n	T&uacute;i được thiết kế với nhiều ngăn chứa, gi&uacute;p bạn dễ d&agrave;ng sắp xếp c&aacute;c vật dụng c&aacute; nh&acirc;n như điện thoại, v&iacute;, ch&igrave;a kh&oacute;a, son m&ocirc;i, v&agrave; c&aacute;c phụ kiện nhỏ kh&aacute;c.</p>\n	</li>\n	<li>\n	<p><strong>Dễ d&agrave;ng phối đồ:</strong><br />\n	M&agrave;u sắc trung t&iacute;nh v&agrave; thiết kế tối giản gi&uacute;p t&uacute;i dễ d&agrave;ng kết hợp với nhiều trang phục kh&aacute;c nhau, từ c&ocirc;ng sở đến dạo phố.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo linh hoạt:</strong><br />\n	D&acirc;y đeo c&oacute; thể điều chỉnh để bạn dễ d&agrave;ng thay đổi c&aacute;ch mang t&uacute;i, từ đeo ch&eacute;o đến x&aacute;ch tay, mang lại sự thoải m&aacute;i v&agrave; linh hoạt.</p>\n	</li>\n</ul>\n\n<hr />\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (114, 4, 'Túi nữ da cá sấu Màu đen quý phái. Size 22 dự tiệc!', 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcToNs3-rb5Y-WWcdiqXO6dWSHfcszKuVnz2DG9F3leladSJfe5zqnELEiGPTsI4CqDZqGVwAmpafWj-e0Zg501toV6eRDXc-EMQN46TgAWNGRdmZHKuvANOl48b&usqp=CAc', 1212000, '<h3><strong>T&uacute;i Nữ Da C&aacute; Sấu M&agrave;u Đen Qu&yacute; Ph&aacute;i &ndash; Size 22 Dự Tiệc</strong></h3>\n\n<p>T&uacute;i nữ <strong>da c&aacute; sấu m&agrave;u đen</strong> l&agrave; lựa chọn ho&agrave;n hảo cho những dịp tiệc t&ugrave;ng, sự kiện quan trọng, mang đến vẻ đẹp sang trọng v&agrave; qu&yacute; ph&aacute;i. Với k&iacute;ch thước <strong>22cm</strong>, chiếc t&uacute;i n&agrave;y vừa đủ để đựng những vật dụng cần thiết như điện thoại, v&iacute;, son m&ocirc;i, v&agrave; ch&igrave;a kh&oacute;a, đồng thời vẫn giữ được sự thanh lịch, tinh tế.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	T&uacute;i được chế t&aacute;c từ <strong>da c&aacute; sấu thật</strong>, bền bỉ v&agrave; c&oacute; c&aacute;c v&acirc;n da độc đ&aacute;o, mang đến vẻ đẹp tự nhi&ecirc;n v&agrave; sang trọng cho người sử dụng.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc đen qu&yacute; ph&aacute;i:</strong><br />\n	M&agrave;u <strong>đen</strong> l&agrave; lựa chọn kinh điển, dễ d&agrave;ng phối hợp với nhiều trang phục kh&aacute;c nhau, từ đầm dạ hội đến trang phục tiệc tối, tạo n&ecirc;n vẻ đẹp thanh lịch v&agrave; thời thượng.</p>\n	</li>\n	<li>\n	<p><strong>K&iacute;ch thước 22cm l&yacute; tưởng:</strong><br />\n	K&iacute;ch thước nhỏ gọn, vừa vặn, gi&uacute;p bạn dễ d&agrave;ng mang theo c&aacute;c vật dụng cần thiết m&agrave; kh&ocirc;ng l&agrave;m mất đi sự thanh tho&aacute;t, nhẹ nh&agrave;ng.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế sang trọng:</strong><br />\n	Kiểu d&aacute;ng t&uacute;i được chăm ch&uacute;t tỉ mỉ với c&aacute;c chi tiết sang trọng, ph&ugrave; hợp với những dịp đặc biệt như tiệc cưới, gala, hay c&aacute;c buổi tiệc đ&ecirc;m.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo linh hoạt:</strong><br />\n	D&acirc;y đeo c&oacute; thể điều chỉnh, gi&uacute;p bạn dễ d&agrave;ng mang t&uacute;i theo nhiều c&aacute;ch kh&aacute;c nhau, từ đeo ch&eacute;o đến x&aacute;ch tay, tạo sự thoải m&aacute;i v&agrave; tiện dụng.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>T&uacute;i Nữ Da C&aacute; Sấu M&agrave;u Đen Qu&yacute; Ph&aacute;i &ndash; Size 22 Dự Tiệc</strong> l&agrave; m&oacute;n phụ kiện kh&ocirc;ng thể thiếu trong bộ sưu tập của những c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự sang trọng v&agrave; tinh tế. Chiếc t&uacute;i n&agrave;y sẽ l&agrave; điểm nhấn ho&agrave;n hảo, gi&uacute;p bạn tỏa s&aacute;ng trong mọi sự kiện v&agrave; tiệc t&ugrave;ng.</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (115, 4, 'Túi nữ Da cá sấu. Màu đỏ đô lịch lãm!', 'https://tuidacasau.vn/images/2022/11/tui-xach-nu-da-ca-sau-mau-moi-2022-ms04-do.jpg', 4699000, '<h3><strong>T&uacute;i Nữ Da C&aacute; Sấu M&agrave;u Đỏ Đ&ocirc; Lịch L&atilde;m</strong></h3>\n\n<p>T&uacute;i nữ <strong>da c&aacute; sấu m&agrave;u đỏ đ&ocirc;</strong> l&agrave; lựa chọn ho&agrave;n hảo cho những c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự sang trọng v&agrave; lịch l&atilde;m. Với chất liệu da c&aacute; sấu cao cấp, chiếc t&uacute;i n&agrave;y kh&ocirc;ng chỉ mang lại vẻ đẹp tự nhi&ecirc;n v&agrave; bền bỉ m&agrave; c&ograve;n t&ocirc;n l&ecirc;n phong c&aacute;ch qu&yacute; ph&aacute;i, cuốn h&uacute;t. M&agrave;u đỏ đ&ocirc; nổi bật nhưng vẫn rất thanh lịch, ph&ugrave; hợp với nhiều dịp kh&aacute;c nhau, từ c&ocirc;ng sở đến c&aacute;c buổi tiệc, sự kiện đặc biệt.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	T&uacute;i được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, với c&aacute;c v&acirc;n da độc đ&aacute;o v&agrave; tự nhi&ecirc;n, mang lại vẻ đẹp sang trọng v&agrave; độ bền vượt trội.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc đỏ đ&ocirc; quyến rũ:</strong><br />\n	M&agrave;u <strong>đỏ đ&ocirc;</strong> mạnh mẽ v&agrave; quyến rũ, dễ d&agrave;ng kết hợp với nhiều trang phục kh&aacute;c nhau, tạo điểm nhấn nổi bật m&agrave; vẫn giữ được sự thanh tho&aacute;t v&agrave; lịch sự.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế tinh tế:</strong><br />\n	Kiểu d&aacute;ng t&uacute;i được thiết kế nhỏ gọn nhưng tinh tế, gi&uacute;p bạn dễ d&agrave;ng mang theo c&aacute;c vật dụng c&aacute; nh&acirc;n cần thiết như điện thoại, v&iacute;, ch&igrave;a kh&oacute;a, son m&ocirc;i.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo linh hoạt:</strong><br />\n	D&acirc;y đeo c&oacute; thể điều chỉnh để bạn dễ d&agrave;ng thay đổi c&aacute;ch mang t&uacute;i, từ đeo ch&eacute;o đến x&aacute;ch tay, mang lại sự thoải m&aacute;i v&agrave; tiện dụng.</p>\n	</li>\n	<li>\n	<p><strong>Đa dụng v&agrave; sang trọng:</strong><br />\n	T&uacute;i ph&ugrave; hợp với nhiều dịp kh&aacute;c nhau, từ c&ocirc;ng sở đến c&aacute;c buổi tiệc, sự kiện đặc biệt, gi&uacute;p bạn thể hiện phong c&aacute;ch v&agrave; sự tự tin.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>T&uacute;i Nữ Da C&aacute; Sấu M&agrave;u Đỏ Đ&ocirc; Lịch L&atilde;m</strong> l&agrave; lựa chọn ho&agrave;n hảo cho những c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự sang trọng, tinh tế v&agrave; kh&aacute;c biệt. Với thiết kế đẹp mắt v&agrave; chất liệu cao cấp, chiếc t&uacute;i n&agrave;y chắc chắn sẽ l&agrave; m&oacute;n phụ kiện nổi bật, gi&uacute;p bạn tỏa s&aacute;ng trong mọi ho&agrave;n cảnh.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (116, 4, 'Túi xách nữ da cá sấu TCS-302', 'https://bizweb.dktcdn.net/thumb/compact/100/027/341/products/tui-xach-nu-ca-sau-chu-b-2a.jpg?v=1695695083953', 3269000, '<h3><strong>T&uacute;i X&aacute;ch Nữ Da C&aacute; Sấu TCS-302: Sang Trọng v&agrave; Tinh Tế</strong></h3>\n\n<p>T&uacute;i x&aacute;ch nữ <strong>da c&aacute; sấu TCS-302</strong> l&agrave; sự kết hợp ho&agrave;n hảo giữa chất liệu cao cấp v&agrave; thiết kế tinh tế, mang đến vẻ đẹp sang trọng v&agrave; đẳng cấp cho người sử dụng. Được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, t&uacute;i c&oacute; độ bền vượt trội v&agrave; c&aacute;c v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o, ph&ugrave; hợp với những c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự kh&aacute;c biệt v&agrave; phong c&aacute;ch thời trang cao cấp.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	T&uacute;i được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, mang lại vẻ đẹp tự nhi&ecirc;n v&agrave; độ bền vượt trội. C&aacute;c v&acirc;n da độc đ&aacute;o tạo n&ecirc;n sự kh&aacute;c biệt v&agrave; gi&uacute;p chiếc t&uacute;i trở th&agrave;nh m&oacute;n phụ kiện đẳng cấp.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế thanh lịch:</strong><br />\n	Với kiểu d&aacute;ng tinh tế, chiếc t&uacute;i x&aacute;ch n&agrave;y c&oacute; thể sử dụng trong nhiều dịp, từ c&ocirc;ng sở, dạo phố đến c&aacute;c buổi tiệc sang trọng. Kiểu d&aacute;ng vừa vặn, kh&ocirc;ng qu&aacute; lớn nhưng đủ để đựng c&aacute;c vật dụng c&aacute; nh&acirc;n cần thiết.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc đa dạng:</strong><br />\n	T&uacute;i x&aacute;ch TCS-302 c&oacute; thể c&oacute; nhiều m&agrave;u sắc kh&aacute;c nhau, từ những t&ocirc;ng m&agrave;u cổ điển như đen, n&acirc;u đến những m&agrave;u sắc nổi bật hơn, gi&uacute;p bạn dễ d&agrave;ng lựa chọn ph&ugrave; hợp với phong c&aacute;ch v&agrave; sở th&iacute;ch c&aacute; nh&acirc;n.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa tiện dụng:</strong><br />\n	Với c&aacute;c ngăn ch&iacute;nh v&agrave; ngăn phụ, t&uacute;i gi&uacute;p bạn dễ d&agrave;ng sắp xếp đồ đạc một c&aacute;ch gọn g&agrave;ng, từ điện thoại, v&iacute; tiền đến c&aacute;c vật dụng c&aacute; nh&acirc;n nhỏ kh&aacute;c.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo chắc chắn:</strong><br />\n	D&acirc;y đeo c&oacute; thể điều chỉnh độ d&agrave;i, gi&uacute;p bạn dễ d&agrave;ng mang t&uacute;i theo nhiều c&aacute;ch kh&aacute;c nhau, từ x&aacute;ch tay đến đeo ch&eacute;o, tạo sự thoải m&aacute;i v&agrave; linh hoạt khi sử dụng.</p>\n	</li>\n</ul>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (117, 4, 'Túi xách nữ da cá sấu cao cấp TLCS03', 'https://giaytamlam.vn/wp-content/uploads/2023/10/tui-xach-nu-da-ca-sau-tlcs03-1-768x768.jpg.webp', 7212000, '<h3><strong>T&uacute;i X&aacute;ch Nữ Da C&aacute; Sấu Cao Cấp TLCS03: Đẳng Cấp v&agrave; Tinh Tế</strong></h3>\n\n<p>T&uacute;i x&aacute;ch nữ <strong>da c&aacute; sấu cao cấp TLCS03</strong> mang đến sự kết hợp ho&agrave;n hảo giữa chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế sang trọng, tạo n&ecirc;n một phụ kiện thời trang kh&ocirc;ng thể thiếu trong bộ sưu tập của những c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự tinh tế v&agrave; đẳng cấp. Với c&aacute;c chi tiết được chăm ch&uacute;t tỉ mỉ, chiếc t&uacute;i n&agrave;y sẽ l&agrave; điểm nhấn nổi bật cho mọi bộ trang phục của bạn.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	T&uacute;i được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, mang đến vẻ đẹp tự nhi&ecirc;n, độc đ&aacute;o v&agrave; bền bỉ. C&aacute;c v&acirc;n da c&aacute; sấu tinh xảo tạo n&ecirc;n sự kh&aacute;c biệt, gi&uacute;p chiếc t&uacute;i trở th&agrave;nh m&oacute;n phụ kiện đẳng cấp.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế sang trọng v&agrave; tinh tế:</strong><br />\n	Với kiểu d&aacute;ng thanh lịch v&agrave; hiện đại, t&uacute;i x&aacute;ch TLCS03 ph&ugrave; hợp với nhiều dịp kh&aacute;c nhau, từ c&ocirc;ng sở, dạo phố đến c&aacute;c buổi tiệc sang trọng. Thiết kế nhỏ gọn nhưng đủ rộng r&atilde;i để đựng c&aacute;c vật dụng cần thiết như v&iacute;, điện thoại, ch&igrave;a kh&oacute;a v&agrave; mỹ phẩm.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc đa dạng:</strong><br />\n	T&uacute;i x&aacute;ch TLCS03 c&oacute; thể c&oacute; nhiều m&agrave;u sắc thanh lịch v&agrave; dễ phối đồ như đen, n&acirc;u, đỏ đ&ocirc;, gi&uacute;p bạn dễ d&agrave;ng lựa chọn theo sở th&iacute;ch v&agrave; phong c&aacute;ch c&aacute; nh&acirc;n.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa tiện dụng:</strong><br />\n	T&uacute;i c&oacute; c&aacute;c ngăn ch&iacute;nh rộng r&atilde;i c&ugrave;ng c&aacute;c ngăn phụ nhỏ gọn, gi&uacute;p bạn dễ d&agrave;ng sắp xếp đồ đạc một c&aacute;ch ngăn nắp v&agrave; tiện lợi.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo chắc chắn v&agrave; linh hoạt:</strong><br />\n	D&acirc;y đeo c&oacute; thể điều chỉnh độ d&agrave;i để bạn c&oacute; thể mang t&uacute;i theo nhiều c&aacute;ch kh&aacute;c nhau, từ x&aacute;ch tay đến đeo ch&eacute;o, tạo sự thoải m&aacute;i v&agrave; linh hoạt khi sử dụng.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>T&uacute;i X&aacute;ch Nữ Da C&aacute; Sấu Cao Cấp TLCS03</strong> l&agrave; sự lựa chọn ho&agrave;n hảo cho những ai y&ecirc;u th&iacute;ch sự sang trọng, đẳng cấp v&agrave; tiện dụng. Với chất liệu cao cấp v&agrave; thiết kế tinh tế, chiếc t&uacute;i n&agrave;y chắc chắn sẽ l&agrave;m nổi bật phong c&aacute;ch v&agrave; c&aacute; t&iacute;nh của bạn trong mọi ho&agrave;n cảnh.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (118, 4, 'Túi đeo chéo nữ da cá sấu TDNS05', 'https://www.casaumiennam.com/wp-content/uploads/2019/11/tui-deo-cheo-nu-s203.jpg', 6521000, '<h3><strong>T&uacute;i Đeo Ch&eacute;o Nữ Da C&aacute; Sấu TDNS05: Sang Trọng v&agrave; Tiện Dụng</strong></h3>\n\n<p>T&uacute;i đeo ch&eacute;o nữ <strong>da c&aacute; sấu TDNS05</strong> l&agrave; sự lựa chọn ho&agrave;n hảo cho những c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự sang trọng, tinh tế v&agrave; tiện dụng. Được l&agrave;m từ <strong>da c&aacute; sấu cao cấp</strong>, t&uacute;i mang đến vẻ đẹp tự nhi&ecirc;n v&agrave; bền bỉ, kết hợp với thiết kế đeo ch&eacute;o hiện đại, gi&uacute;p bạn dễ d&agrave;ng phối hợp với nhiều phong c&aacute;ch thời trang kh&aacute;c nhau.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	T&uacute;i được chế t&aacute;c từ <strong>da c&aacute; sấu thật</strong>, với c&aacute;c v&acirc;n da độc đ&aacute;o, mang đến vẻ đẹp tự nhi&ecirc;n v&agrave; sự bền bỉ theo thời gian. Da c&aacute; sấu gi&uacute;p t&uacute;i kh&ocirc;ng chỉ đẹp m&agrave; c&ograve;n c&oacute; độ bền vượt trội.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế đeo ch&eacute;o thời trang:</strong><br />\n	Kiểu d&aacute;ng t&uacute;i đeo ch&eacute;o hiện đại v&agrave; thanh lịch, gi&uacute;p bạn dễ d&agrave;ng mang theo mọi l&uacute;c mọi nơi, từ c&ocirc;ng sở, dạo phố đến c&aacute;c buổi tiệc. Thiết kế nhỏ gọn nhưng đủ để chứa những vật dụng cần thiết như điện thoại, v&iacute;, ch&igrave;a kh&oacute;a, son m&ocirc;i, v.v.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc đa dạng:</strong><br />\n	T&uacute;i c&oacute; thể c&oacute; c&aacute;c m&agrave;u sắc tinh tế như đen, n&acirc;u, đỏ, dễ d&agrave;ng kết hợp với nhiều trang phục v&agrave; phong c&aacute;ch kh&aacute;c nhau.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo linh hoạt:</strong><br />\n	D&acirc;y đeo c&oacute; thể điều chỉnh để bạn dễ d&agrave;ng thay đổi kiểu mang t&uacute;i, từ đeo ch&eacute;o đến đeo vai, mang lại sự thoải m&aacute;i v&agrave; tiện lợi.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa tiện dụng:</strong><br />\n	T&uacute;i được thiết kế với ngăn ch&iacute;nh rộng r&atilde;i v&agrave; c&aacute;c ngăn phụ nhỏ gọn, gi&uacute;p bạn dễ d&agrave;ng sắp xếp đồ đạc một c&aacute;ch ngăn nắp v&agrave; dễ d&agrave;ng t&igrave;m kiếm.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>T&uacute;i Đeo Ch&eacute;o Nữ Da C&aacute; Sấu TDNS05</strong> l&agrave; m&oacute;n phụ kiện l&yacute; tưởng cho những c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự sang trọng, tiện dụng v&agrave; phong c&aacute;ch. Với chất liệu cao cấp v&agrave; thiết kế đẳng cấp, chiếc t&uacute;i n&agrave;y chắc chắn sẽ l&agrave; điểm nhấn ho&agrave;n hảo cho phong c&aacute;ch thời trang của bạn.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (119, 4, 'Túi nữ da cá sấu cao cấp TV02', 'https://hoicasau.com/thumbs/570x600x2/upload/product/z4258695769640d020ea6b8ab7408c1ad3b19570457667-3596.jpg', 2120000, '<h3><strong>T&uacute;i Nữ Da C&aacute; Sấu Cao Cấp TV02: Sang Trọng v&agrave; Tinh Tế</strong></h3>\n\n<p>T&uacute;i nữ <strong>da c&aacute; sấu cao cấp TV02</strong> mang đến vẻ đẹp tự nhi&ecirc;n v&agrave; sang trọng, l&agrave; lựa chọn ho&agrave;n hảo cho những c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự đẳng cấp v&agrave; tinh tế. Được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, chiếc t&uacute;i n&agrave;y kh&ocirc;ng chỉ nổi bật với chất liệu cao cấp m&agrave; c&ograve;n c&oacute; thiết kế thời trang, ph&ugrave; hợp với nhiều dịp kh&aacute;c nhau, từ c&ocirc;ng sở đến c&aacute;c buổi tiệc, sự kiện.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	T&uacute;i được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, mang lại vẻ đẹp tự nhi&ecirc;n v&agrave; bền bỉ. C&aacute;c v&acirc;n da c&aacute; sấu độc đ&aacute;o tạo n&ecirc;n sự kh&aacute;c biệt, gi&uacute;p t&uacute;i trở th&agrave;nh m&oacute;n phụ kiện đẳng cấp v&agrave; sang trọng.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế thanh lịch:</strong><br />\n	Kiểu d&aacute;ng tinh tế v&agrave; thanh tho&aacute;t, t&uacute;i TV02 c&oacute; thể sử dụng trong nhiều dịp, từ đi l&agrave;m, đi chơi đến c&aacute;c sự kiện đặc biệt. K&iacute;ch thước vừa phải gi&uacute;p bạn dễ d&agrave;ng mang theo c&aacute;c vật dụng c&aacute; nh&acirc;n như v&iacute;, điện thoại, mỹ phẩm, v.v.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc sang trọng:</strong><br />\n	T&uacute;i c&oacute; thể c&oacute; c&aacute;c m&agrave;u sắc thanh lịch như đen, n&acirc;u, đỏ, gi&uacute;p bạn dễ d&agrave;ng phối đồ v&agrave; tạo phong c&aacute;ch ri&ecirc;ng biệt. M&agrave;u sắc n&agrave;y cũng rất dễ d&agrave;ng kết hợp với nhiều loại trang phục.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa tiện dụng:</strong><br />\n	T&uacute;i được thiết kế với c&aacute;c ngăn ch&iacute;nh rộng r&atilde;i v&agrave; c&aacute;c ngăn phụ nhỏ gọn, gi&uacute;p bạn dễ d&agrave;ng sắp xếp đồ đạc một c&aacute;ch ngăn nắp v&agrave; tiện lợi.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo chắc chắn v&agrave; linh hoạt:</strong><br />\n	D&acirc;y đeo c&oacute; thể điều chỉnh, gi&uacute;p bạn mang t&uacute;i theo nhiều c&aacute;ch kh&aacute;c nhau, từ x&aacute;ch tay đến đeo ch&eacute;o, tạo sự thoải m&aacute;i v&agrave; linh hoạt.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>T&uacute;i Nữ Da C&aacute; Sấu Cao Cấp TV02</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự sang trọng v&agrave; tinh tế. Với chất liệu cao cấp v&agrave; thiết kế thời trang, chiếc t&uacute;i n&agrave;y sẽ l&agrave; điểm nhấn ho&agrave;n hảo cho phong c&aacute;ch của bạn, gi&uacute;p bạn tỏa s&aacute;ng trong mọi ho&agrave;n cảnh.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (120, 4, 'Túi đeo chéo nữ da cá sấu TDNS03', 'https://www.casaumiennam.com/wp-content/uploads/2019/11/tui-deo-cheo-nu-s201c.jpg', 2222000, '<h3><strong>T&uacute;i Đeo Ch&eacute;o Nữ Da C&aacute; Sấu TDNS03: Sang Trọng v&agrave; Tiện Lợi</strong></h3>\n\n<p>T&uacute;i đeo ch&eacute;o nữ <strong>da c&aacute; sấu TDNS03</strong> mang đến sự kết hợp ho&agrave;n hảo giữa chất liệu cao cấp v&agrave; thiết kế thời trang, tạo n&ecirc;n một phụ kiện vừa sang trọng vừa tiện dụng. Với chất liệu <strong>da c&aacute; sấu thật</strong> v&agrave; kiểu d&aacute;ng nhỏ gọn, chiếc t&uacute;i n&agrave;y sẽ l&agrave; lựa chọn l&yacute; tưởng cho những c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự thanh lịch v&agrave; phong c&aacute;ch hiện đại.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	T&uacute;i được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o, mang đến vẻ đẹp sang trọng v&agrave; bền bỉ theo thời gian.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế đeo ch&eacute;o tiện dụng:</strong><br />\n	Kiểu d&aacute;ng nhỏ gọn v&agrave; thiết kế đeo ch&eacute;o gi&uacute;p bạn dễ d&agrave;ng mang theo mọi l&uacute;c mọi nơi, từ c&ocirc;ng sở, dạo phố đến c&aacute;c buổi tiệc. T&uacute;i c&oacute; thể chứa những vật dụng cần thiết như điện thoại, v&iacute;, son m&ocirc;i, v&agrave; ch&igrave;a kh&oacute;a.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc thanh lịch:</strong><br />\n	T&uacute;i c&oacute; thể c&oacute; nhiều m&agrave;u sắc tinh tế như đen, n&acirc;u, đỏ, dễ d&agrave;ng kết hợp với nhiều phong c&aacute;ch v&agrave; trang phục kh&aacute;c nhau, từ trang phục c&ocirc;ng sở đến dạo phố hay c&aacute;c buổi tiệc.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo linh hoạt:</strong><br />\n	D&acirc;y đeo c&oacute; thể điều chỉnh độ d&agrave;i, gi&uacute;p bạn dễ d&agrave;ng thay đổi c&aacute;ch mang t&uacute;i, từ đeo ch&eacute;o đến đeo vai, tạo sự thoải m&aacute;i v&agrave; tiện lợi.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa tiện dụng:</strong><br />\n	T&uacute;i được thiết kế với c&aacute;c ngăn ch&iacute;nh rộng r&atilde;i v&agrave; c&aacute;c ngăn phụ nhỏ gọn, gi&uacute;p bạn dễ d&agrave;ng sắp xếp đồ đạc một c&aacute;ch ngăn nắp v&agrave; tiện lợi.</p>\n	</li>\n</ul>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (121, 4, 'Túi xách da cá sấu nữ màu đỏ đô quyến rũ – TX53', 'https://casauhoanglong.com/wp-content/uploads/2024/04/san-pham-tui-da-ca-sau-TX53-mau-do-quyen-ru-600x820.jpeg', 5341000, '<h3><strong>T&uacute;i X&aacute;ch Da C&aacute; Sấu Nữ M&agrave;u Đỏ Đ&ocirc; Quyến Rũ &ndash; TX53</strong></h3>\n\n<p>T&uacute;i x&aacute;ch nữ <strong>da c&aacute; sấu m&agrave;u đỏ đ&ocirc; TX53</strong> l&agrave; sự kết hợp ho&agrave;n hảo giữa chất liệu cao cấp v&agrave; m&agrave;u sắc quyến rũ, mang đến vẻ đẹp sang trọng v&agrave; đầy cuốn h&uacute;t. Với thiết kế tinh tế v&agrave; chất liệu <strong>da c&aacute; sấu thật</strong>, chiếc t&uacute;i n&agrave;y kh&ocirc;ng chỉ l&agrave; phụ kiện thời trang m&agrave; c&ograve;n l&agrave; điểm nhấn đẳng cấp cho phong c&aacute;ch của bạn trong mọi dịp.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	T&uacute;i được chế t&aacute;c từ <strong>da c&aacute; sấu thật</strong>, với c&aacute;c v&acirc;n da độc đ&aacute;o v&agrave; tự nhi&ecirc;n, mang đến vẻ đẹp sang trọng, bền bỉ v&agrave; c&oacute; độ bền cao theo thời gian.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc đỏ đ&ocirc; quyến rũ:</strong><br />\n	M&agrave;u <strong>đỏ đ&ocirc;</strong> nổi bật v&agrave; quyến rũ, gi&uacute;p bạn dễ d&agrave;ng tạo điểm nhấn trong mọi bộ trang phục. Đ&acirc;y l&agrave; lựa chọn l&yacute; tưởng cho những c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự nổi bật nhưng vẫn thanh lịch v&agrave; tinh tế.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế sang trọng v&agrave; tinh tế:</strong><br />\n	Kiểu d&aacute;ng thanh lịch với c&aacute;c chi tiết tỉ mỉ, gi&uacute;p t&uacute;i x&aacute;ch trở th&agrave;nh phụ kiện ho&agrave;n hảo cho c&aacute;c dịp tiệc t&ugrave;ng, dạo phố hay đi l&agrave;m. T&uacute;i c&oacute; k&iacute;ch thước vừa phải, đủ để đựng c&aacute;c vật dụng c&aacute; nh&acirc;n như điện thoại, v&iacute;, ch&igrave;a kh&oacute;a, v&agrave; mỹ phẩm.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa tiện dụng:</strong><br />\n	T&uacute;i được thiết kế với ngăn ch&iacute;nh rộng r&atilde;i v&agrave; c&aacute;c ngăn phụ nhỏ gọn, gi&uacute;p bạn dễ d&agrave;ng sắp xếp đồ đạc một c&aacute;ch ngăn nắp v&agrave; tiện lợi.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo chắc chắn v&agrave; linh hoạt:</strong><br />\n	D&acirc;y đeo c&oacute; thể điều chỉnh độ d&agrave;i để bạn c&oacute; thể mang t&uacute;i theo nhiều c&aacute;ch kh&aacute;c nhau, từ x&aacute;ch tay đến đeo ch&eacute;o, tạo sự thoải m&aacute;i v&agrave; linh hoạt khi sử dụng.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>T&uacute;i X&aacute;ch Da C&aacute; Sấu Nữ M&agrave;u Đỏ Đ&ocirc; Quyến Rũ &ndash; TX53</strong> l&agrave; m&oacute;n phụ kiện kh&ocirc;ng thể thiếu cho những c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự sang trọng, đẳng cấp v&agrave; quyến rũ. Với chất liệu cao cấp v&agrave; thiết kế tinh tế, chiếc t&uacute;i n&agrave;y chắc chắn sẽ l&agrave;m nổi bật phong c&aacute;ch của bạn trong mọi ho&agrave;n cảnh.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (122, 4, 'Túi da cá sấu nữ phối màu độc lạ, đẹp mắt – TX51', 'https://casauhoanglong.com/wp-content/uploads/2024/03/tui-da-ca-sau-thiet-ke-doc-dao-TX51-600x800.jpeg', 3212000, '<h3><strong>T&uacute;i Da C&aacute; Sấu Nữ Phối M&agrave;u Độc Lạ, Đẹp Mắt &ndash; TX51</strong></h3>\n\n<p>T&uacute;i <strong>da c&aacute; sấu nữ phối m&agrave;u độc lạ TX51</strong> l&agrave; sự kết hợp ho&agrave;n hảo giữa chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế m&agrave;u sắc tinh tế, tạo n&ecirc;n một m&oacute;n phụ kiện thời trang kh&ocirc;ng thể thiếu cho những c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự mới mẻ v&agrave; kh&aacute;c biệt. Với sự phối hợp m&agrave;u sắc độc đ&aacute;o, chiếc t&uacute;i n&agrave;y mang đến vẻ đẹp nổi bật, c&aacute; t&iacute;nh nhưng vẫn rất thanh lịch.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	T&uacute;i được chế t&aacute;c từ <strong>da c&aacute; sấu thật</strong>, mang lại vẻ đẹp tự nhi&ecirc;n v&agrave; bền bỉ. C&aacute;c v&acirc;n da c&aacute; sấu độc đ&aacute;o gi&uacute;p t&uacute;i trở th&agrave;nh m&oacute;n phụ kiện đẳng cấp v&agrave; sang trọng.</p>\n	</li>\n	<li>\n	<p><strong>Phối m&agrave;u độc đ&aacute;o v&agrave; đẹp mắt:</strong><br />\n	Với sự phối hợp m&agrave;u sắc <strong>độc lạ</strong>, t&uacute;i TX51 nổi bật v&agrave; thu h&uacute;t sự ch&uacute; &yacute;. Sự kết hợp giữa c&aacute;c gam m&agrave;u h&agrave;i h&ograve;a gi&uacute;p t&uacute;i trở n&ecirc;n nổi bật nhưng vẫn giữ được sự thanh lịch, ph&ugrave; hợp với nhiều phong c&aacute;ch v&agrave; trang phục kh&aacute;c nhau.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế tinh tế, thời trang:</strong><br />\n	T&uacute;i c&oacute; kiểu d&aacute;ng nhỏ gọn, dễ d&agrave;ng mang theo trong mọi dịp, từ c&ocirc;ng sở, dạo phố đến c&aacute;c buổi tiệc, sự kiện. K&iacute;ch thước t&uacute;i vừa phải, đủ để đựng những vật dụng cần thiết như v&iacute;, điện thoại, ch&igrave;a kh&oacute;a, mỹ phẩm.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo linh hoạt:</strong><br />\n	D&acirc;y đeo chắc chắn c&oacute; thể điều chỉnh độ d&agrave;i, gi&uacute;p bạn dễ d&agrave;ng thay đổi c&aacute;ch mang t&uacute;i từ đeo ch&eacute;o đến x&aacute;ch tay, tạo sự thoải m&aacute;i v&agrave; tiện lợi.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa tiện dụng:</strong><br />\n	T&uacute;i được thiết kế với c&aacute;c ngăn ch&iacute;nh rộng r&atilde;i v&agrave; c&aacute;c ngăn phụ nhỏ gọn, gi&uacute;p bạn dễ d&agrave;ng sắp xếp đồ đạc một c&aacute;ch ngăn nắp v&agrave; tiện lợi.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>T&uacute;i Da C&aacute; Sấu Nữ Phối M&agrave;u Độc Lạ, Đẹp Mắt &ndash; TX51</strong> l&agrave; lựa chọn l&yacute; tưởng cho những c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự kh&aacute;c biệt, phong c&aacute;ch v&agrave; đẳng cấp. Với chất liệu cao cấp v&agrave; thiết kế nổi bật, chiếc t&uacute;i n&agrave;y sẽ l&agrave; điểm nhấn ho&agrave;n hảo cho phong c&aacute;ch của bạn, gi&uacute;p bạn tỏa s&aacute;ng trong mọi ho&agrave;n cảnh.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (123, 3, 'Túi laptop cá sấu độc quyền – Nhuộm thủ công – TXN08', 'https://casauhoanglong.com/wp-content/uploads/2023/08/tui-da-ca-sau-23423-600x820.jpg', 2321000, '<h3><strong>T&uacute;i Laptop C&aacute; Sấu Độc Quyền &ndash; Nhuộm Thủ C&ocirc;ng &ndash; TXN08</strong></h3>\n\n<p>T&uacute;i <strong>laptop c&aacute; sấu độc quyền TXN08</strong> l&agrave; sự kết hợp ho&agrave;n hảo giữa chất liệu da c&aacute; sấu cao cấp v&agrave; quy tr&igrave;nh nhuộm thủ c&ocirc;ng tỉ mỉ, mang đến một sản phẩm vừa sang trọng, vừa bền bỉ. Với thiết kế chuy&ecirc;n dụng d&agrave;nh cho laptop, chiếc t&uacute;i n&agrave;y kh&ocirc;ng chỉ bảo vệ thiết bị của bạn m&agrave; c&ograve;n thể hiện phong c&aacute;ch đẳng cấp v&agrave; sự tinh tế trong từng chi tiết.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	T&uacute;i được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o, mang đến vẻ đẹp sang trọng v&agrave; độ bền vượt trội theo thời gian. Da c&aacute; sấu gi&uacute;p t&uacute;i kh&ocirc;ng chỉ đẹp m&agrave; c&ograve;n cực kỳ chắc chắn.</p>\n	</li>\n	<li>\n	<p><strong>Quy tr&igrave;nh nhuộm thủ c&ocirc;ng tinh xảo:</strong><br />\n	T&uacute;i được <strong>nhuộm thủ c&ocirc;ng</strong> với m&agrave;u sắc tự nhi&ecirc;n v&agrave; tinh tế, tạo n&ecirc;n một vẻ ngo&agrave;i độc đ&aacute;o, kh&ocirc;ng giống bất kỳ sản phẩm n&agrave;o kh&aacute;c. Quy tr&igrave;nh n&agrave;y đảm bảo mỗi chiếc t&uacute;i đều mang một dấu ấn ri&ecirc;ng biệt.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế chuy&ecirc;n dụng cho laptop:</strong><br />\n	T&uacute;i c&oacute; k&iacute;ch thước ph&ugrave; hợp để đựng laptop, với c&aacute;c ngăn chứa rộng r&atilde;i v&agrave; bảo vệ an to&agrave;n cho thiết bị của bạn. B&ecirc;n cạnh đ&oacute;, t&uacute;i c&ograve;n c&oacute; c&aacute;c ngăn phụ để đựng c&aacute;c vật dụng c&aacute; nh&acirc;n như điện thoại, v&iacute;, t&agrave;i liệu, v.v.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc thanh lịch:</strong><br />\n	T&uacute;i c&oacute; thể c&oacute; nhiều m&agrave;u sắc cổ điển v&agrave; sang trọng, dễ d&agrave;ng kết hợp với nhiều phong c&aacute;ch thời trang kh&aacute;c nhau, từ c&ocirc;ng sở đến dạo phố.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo chắc chắn v&agrave; linh hoạt:</strong><br />\n	D&acirc;y đeo c&oacute; thể điều chỉnh độ d&agrave;i, gi&uacute;p bạn dễ d&agrave;ng mang t&uacute;i theo nhiều c&aacute;ch kh&aacute;c nhau, từ x&aacute;ch tay đến đeo vai, tạo sự thoải m&aacute;i v&agrave; linh hoạt.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>T&uacute;i Laptop C&aacute; Sấu Độc Quyền &ndash; Nhuộm Thủ C&ocirc;ng &ndash; TXN08</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự sang trọng, độc đ&aacute;o v&agrave; tiện dụng. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế chuy&ecirc;n dụng, chiếc t&uacute;i n&agrave;y kh&ocirc;ng chỉ bảo vệ laptop m&agrave; c&ograve;n n&acirc;ng tầm phong c&aacute;ch của bạn trong mọi ho&agrave;n cảnh.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (124, 3, 'Túi Golfer da cá sấu khóa vân tay sành điệu – TXN06', 'https://casauhoanglong.com/wp-content/uploads/2023/07/z4503220306755_bbf98348ddf4227e3165a9e10716092c-1-600x820.jpg', 2345000, '<h3><strong>T&uacute;i Golfer Da C&aacute; Sấu Kh&oacute;a V&acirc;n Tay S&agrave;nh Điệu &ndash; TXN06</strong></h3>\n\n<p>T&uacute;i <strong>Golfer da c&aacute; sấu kh&oacute;a v&acirc;n tay TXN06</strong> l&agrave; sự lựa chọn ho&agrave;n hảo cho những t&iacute;n đồ y&ecirc;u th&iacute;ch phong c&aacute;ch thể thao nhưng vẫn muốn thể hiện sự sang trọng v&agrave; đẳng cấp. Được l&agrave;m từ <strong>da c&aacute; sấu cao cấp</strong>, chiếc t&uacute;i n&agrave;y kh&ocirc;ng chỉ bền bỉ m&agrave; c&ograve;n sở hữu thiết kế độc đ&aacute;o với <strong>kh&oacute;a v&acirc;n tay</strong> hiện đại, mang đến sự tiện lợi v&agrave; phong c&aacute;ch nổi bật.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	T&uacute;i được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n, mang đến vẻ đẹp sang trọng v&agrave; độ bền vượt trội. Da c&aacute; sấu cũng gi&uacute;p t&uacute;i c&oacute; khả năng chống m&agrave;i m&ograve;n tốt, giữ được vẻ đẹp l&acirc;u d&agrave;i.</p>\n	</li>\n	<li>\n	<p><strong>Kh&oacute;a v&acirc;n tay tiện lợi:</strong><br />\n	Điểm nhấn đặc biệt của t&uacute;i l&agrave; <strong>kh&oacute;a v&acirc;n tay</strong> hiện đại, kh&ocirc;ng chỉ gi&uacute;p bảo mật m&agrave; c&ograve;n tạo sự kh&aacute;c biệt, mang lại cảm gi&aacute;c s&agrave;nh điệu v&agrave; an to&agrave;n cho người sử dụng.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế thể thao, s&agrave;nh điệu:</strong><br />\n	T&uacute;i c&oacute; thiết kế gọn g&agrave;ng, ph&ugrave; hợp cho những chuyến đi chơi golf hay c&aacute;c hoạt động thể thao ngo&agrave;i trời. K&iacute;ch thước t&uacute;i vừa phải, đủ để đựng c&aacute;c vật dụng cần thiết như v&iacute;, điện thoại, ch&igrave;a kh&oacute;a, v.v.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc sang trọng:</strong><br />\n	T&uacute;i c&oacute; thể c&oacute; c&aacute;c m&agrave;u sắc thanh lịch v&agrave; dễ phối đồ như đen, n&acirc;u, đỏ, gi&uacute;p bạn dễ d&agrave;ng kết hợp với nhiều phong c&aacute;ch kh&aacute;c nhau.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo linh hoạt v&agrave; chắc chắn:</strong><br />\n	D&acirc;y đeo c&oacute; thể điều chỉnh để bạn c&oacute; thể mang t&uacute;i theo nhiều c&aacute;ch kh&aacute;c nhau, từ đeo vai đến đeo ch&eacute;o, mang lại sự thoải m&aacute;i v&agrave; tiện lợi.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>T&uacute;i Golfer Da C&aacute; Sấu Kh&oacute;a V&acirc;n Tay S&agrave;nh Điệu &ndash; TXN06</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự kết hợp giữa phong c&aacute;ch thể thao v&agrave; sự sang trọng. Với chất liệu cao cấp v&agrave; thiết kế độc đ&aacute;o, chiếc t&uacute;i n&agrave;y sẽ l&agrave; điểm nhấn ho&agrave;n hảo cho phong c&aacute;ch của bạn trong mọi ho&agrave;n cảnh.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (125, 3, 'Túi da cá sấu nam – TXN11', 'https://casauhoanglong.com/wp-content/uploads/2023/11/tui-da-ca-sau-nam-tx35-3-600x820.jpg', 3399000, '<h3><strong>T&uacute;i Da C&aacute; Sấu Nam &ndash; TXN11: Đẳng Cấp v&agrave; Sang Trọng</strong></h3>\n\n<p>T&uacute;i <strong>da c&aacute; sấu nam TXN11</strong> l&agrave; lựa chọn l&yacute; tưởng cho những qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch sự tinh tế v&agrave; đẳng cấp. Được chế t&aacute;c từ <strong>da c&aacute; sấu cao cấp</strong>, chiếc t&uacute;i n&agrave;y kh&ocirc;ng chỉ nổi bật với vẻ ngo&agrave;i sang trọng m&agrave; c&ograve;n đảm bảo độ bền vượt trội, l&agrave; phụ kiện ho&agrave;n hảo để n&acirc;ng tầm phong c&aacute;ch của bạn trong mọi dịp.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	T&uacute;i được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, mang lại vẻ đẹp tự nhi&ecirc;n với c&aacute;c v&acirc;n da độc đ&aacute;o. Chất liệu n&agrave;y kh&ocirc;ng chỉ bền bỉ m&agrave; c&ograve;n c&oacute; khả năng chống m&agrave;i m&ograve;n, gi&uacute;p t&uacute;i giữ được vẻ đẹp l&acirc;u d&agrave;i theo thời gian.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế nam t&iacute;nh v&agrave; thanh lịch:</strong><br />\n	Với kiểu d&aacute;ng gọn g&agrave;ng v&agrave; thiết kế tinh tế, t&uacute;i <strong>TXN11</strong> ph&ugrave; hợp với nhiều phong c&aacute;ch kh&aacute;c nhau, từ c&ocirc;ng sở, dạo phố đến c&aacute;c buổi tiệc hay sự kiện quan trọng. T&uacute;i c&oacute; thể chứa đựng những vật dụng c&aacute; nh&acirc;n như v&iacute;, điện thoại, ch&igrave;a kh&oacute;a, v&agrave; c&aacute;c đồ d&ugrave;ng cần thiết kh&aacute;c.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc tinh tế:</strong><br />\n	T&uacute;i c&oacute; m&agrave;u sắc sang trọng, dễ d&agrave;ng phối hợp với nhiều loại trang phục, gi&uacute;p bạn thể hiện phong c&aacute;ch thời trang đẳng cấp.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa tiện dụng:</strong><br />\n	T&uacute;i được thiết kế với c&aacute;c ngăn chứa rộng r&atilde;i, gi&uacute;p bạn dễ d&agrave;ng sắp xếp đồ đạc một c&aacute;ch ngăn nắp v&agrave; tiện lợi.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo chắc chắn v&agrave; linh hoạt:</strong><br />\n	D&acirc;y đeo c&oacute; thể điều chỉnh để bạn c&oacute; thể mang t&uacute;i theo nhiều c&aacute;ch kh&aacute;c nhau, từ x&aacute;ch tay đến đeo vai hoặc đeo ch&eacute;o, tạo sự thoải m&aacute;i v&agrave; tiện dụng.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>T&uacute;i Da C&aacute; Sấu Nam &ndash; TXN11</strong> l&agrave; lựa chọn tuyệt vời cho những qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch sự sang trọng v&agrave; đẳng cấp. Với chất liệu cao cấp v&agrave; thiết kế thanh lịch, chiếc t&uacute;i n&agrave;y chắc chắn sẽ l&agrave; điểm nhấn ho&agrave;n hảo cho phong c&aacute;ch của bạn.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (126, 3, 'Túi unisex da cá sấu siêu tiện lợi – TXN09', 'https://casauhoanglong.com/wp-content/uploads/2023/09/z4709332778639_cf76b4c408e3f204d987f96e0c7f9caa-scaled-600x820.jpg', 2231000, '<h3><strong>T&uacute;i Unisex Da C&aacute; Sấu Si&ecirc;u Tiện Lợi &ndash; TXN09</strong></h3>\n\n<p>T&uacute;i <strong>unisex da c&aacute; sấu si&ecirc;u tiện lợi TXN09</strong> l&agrave; sự kết hợp ho&agrave;n hảo giữa chất liệu cao cấp v&agrave; thiết kế hiện đại, mang lại vẻ đẹp sang trọng v&agrave; t&iacute;nh ứng dụng cao. D&agrave;nh cho cả nam v&agrave; nữ, chiếc t&uacute;i n&agrave;y kh&ocirc;ng chỉ ph&ugrave; hợp với nhiều phong c&aacute;ch kh&aacute;c nhau m&agrave; c&ograve;n rất tiện dụng, đ&aacute;p ứng nhu cầu sử dụng h&agrave;ng ng&agrave;y.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	T&uacute;i được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n v&agrave; độc đ&aacute;o, mang lại vẻ đẹp sang trọng v&agrave; độ bền vượt trội theo thời gian. Da c&aacute; sấu cũng gi&uacute;p t&uacute;i c&oacute; khả năng chống m&agrave;i m&ograve;n, giữ được vẻ đẹp l&acirc;u d&agrave;i.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế unisex, dễ phối đồ:</strong><br />\n	T&uacute;i c&oacute; thiết kế đơn giản, gọn g&agrave;ng v&agrave; ph&ugrave; hợp cho cả nam v&agrave; nữ. Với kiểu d&aacute;ng thời trang, t&uacute;i dễ d&agrave;ng kết hợp với nhiều loại trang phục từ c&ocirc;ng sở, dạo phố đến c&aacute;c buổi tiệc, sự kiện.</p>\n	</li>\n	<li>\n	<p><strong>T&iacute;nh tiện dụng cao:</strong><br />\n	Với c&aacute;c ngăn chứa rộng r&atilde;i v&agrave; bố tr&iacute; hợp l&yacute;, t&uacute;i gi&uacute;p bạn dễ d&agrave;ng sắp xếp đồ đạc như v&iacute;, điện thoại, ch&igrave;a kh&oacute;a, mỹ phẩm v&agrave; c&aacute;c vật dụng c&aacute; nh&acirc;n kh&aacute;c một c&aacute;ch ngăn nắp v&agrave; tiện lợi.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo linh hoạt:</strong><br />\n	D&acirc;y đeo c&oacute; thể điều chỉnh, gi&uacute;p bạn mang t&uacute;i theo nhiều c&aacute;ch kh&aacute;c nhau, từ x&aacute;ch tay đến đeo ch&eacute;o, tạo sự thoải m&aacute;i v&agrave; linh hoạt khi sử dụng.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc dễ phối hợp:</strong><br />\n	T&uacute;i c&oacute; m&agrave;u sắc trung t&iacute;nh, dễ d&agrave;ng phối hợp với nhiều trang phục kh&aacute;c nhau, ph&ugrave; hợp với mọi ho&agrave;n cảnh v&agrave; phong c&aacute;ch.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>T&uacute;i Unisex Da C&aacute; Sấu Si&ecirc;u Tiện Lợi &ndash; TXN09</strong> l&agrave; m&oacute;n phụ kiện l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự sang trọng, tiện dụng v&agrave; linh hoạt. Với chất liệu cao cấp v&agrave; thiết kế th&ocirc;ng minh, chiếc t&uacute;i n&agrave;y chắc chắn sẽ l&agrave;m h&agrave;i l&ograve;ng cả những kh&aacute;ch h&agrave;ng kh&oacute; t&iacute;nh nhất.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (127, 4, 'Túi yên ngựa da cá sấu nguyên thủy – TX11 ', 'https://casauhoanglong.com/wp-content/uploads/2023/07/z4492653317318_317171b254c4e361b70fe176ca8d123e-600x820.jpg', 3421000, '<h3><strong>T&uacute;i Y&ecirc;n Ngựa Da C&aacute; Sấu Nguy&ecirc;n Thủy &ndash; TX11</strong></h3>\n\n<p>T&uacute;i <strong>y&ecirc;n ngựa da c&aacute; sấu nguy&ecirc;n thủy TX11</strong> l&agrave; một sản phẩm độc đ&aacute;o, kết hợp giữa sự mạnh mẽ của thiết kế y&ecirc;n ngựa v&agrave; vẻ đẹp sang trọng, tự nhi&ecirc;n của <strong>da c&aacute; sấu thật</strong>. Với kiểu d&aacute;ng mạnh mẽ v&agrave; tinh tế, chiếc t&uacute;i n&agrave;y mang lại vẻ ngo&agrave;i c&aacute; t&iacute;nh v&agrave; đẳng cấp, l&agrave; lựa chọn ho&agrave;n hảo cho những ai y&ecirc;u th&iacute;ch sự kh&aacute;c biệt v&agrave; phong c&aacute;ch mạnh mẽ.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu nguy&ecirc;n thủy:</strong><br />\n	T&uacute;i được chế t&aacute;c từ <strong>da c&aacute; sấu thật</strong>, với c&aacute;c v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o, mang đến vẻ đẹp sang trọng v&agrave; bền bỉ. Da c&aacute; sấu gi&uacute;p t&uacute;i c&oacute; độ bền cao, đồng thời giữ được vẻ đẹp tự nhi&ecirc;n v&agrave; mạnh mẽ theo thời gian.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế y&ecirc;n ngựa độc đ&aacute;o:</strong><br />\n	Với kiểu d&aacute;ng lấy cảm hứng từ <strong>y&ecirc;n ngựa</strong>, t&uacute;i TX11 kh&ocirc;ng chỉ tạo cảm gi&aacute;c mạnh mẽ m&agrave; c&ograve;n rất thời trang. Thiết kế n&agrave;y gi&uacute;p t&uacute;i trở th&agrave;nh một phụ kiện nổi bật, đầy c&aacute; t&iacute;nh.</p>\n	</li>\n	<li>\n	<p><strong>K&iacute;ch thước vừa phải, tiện dụng:</strong><br />\n	T&uacute;i c&oacute; k&iacute;ch thước l&yacute; tưởng để đựng c&aacute;c vật dụng c&aacute; nh&acirc;n như v&iacute;, điện thoại, ch&igrave;a kh&oacute;a, v&agrave; c&aacute;c đồ d&ugrave;ng cần thiết kh&aacute;c. Thiết kế ngăn nắp gi&uacute;p bạn dễ d&agrave;ng sắp xếp đồ đạc một c&aacute;ch gọn g&agrave;ng v&agrave; tiện lợi.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc tự nhi&ecirc;n, dễ phối hợp:</strong><br />\n	T&uacute;i c&oacute; m&agrave;u sắc tự nhi&ecirc;n của da c&aacute; sấu, dễ d&agrave;ng kết hợp với nhiều loại trang phục kh&aacute;c nhau, từ c&ocirc;ng sở đến dạo phố hay c&aacute;c buổi tiệc.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo linh hoạt:</strong><br />\n	D&acirc;y đeo chắc chắn c&oacute; thể điều chỉnh độ d&agrave;i, gi&uacute;p bạn dễ d&agrave;ng mang t&uacute;i theo nhiều c&aacute;ch kh&aacute;c nhau, từ x&aacute;ch tay đến đeo ch&eacute;o, tạo sự thoải m&aacute;i v&agrave; linh hoạt khi sử dụng.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>T&uacute;i Y&ecirc;n Ngựa Da C&aacute; Sấu Nguy&ecirc;n Thủy &ndash; TX11</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự mạnh mẽ, c&aacute; t&iacute;nh v&agrave; đẳng cấp. Với chất liệu cao cấp v&agrave; thiết kế độc đ&aacute;o, chiếc t&uacute;i n&agrave;y chắc chắn sẽ l&agrave; điểm nhấn ho&agrave;n hảo cho phong c&aacute;ch của bạn trong mọi ho&agrave;n cảnh.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (128, 4, 'Túi cá sấu trắng nguyên thủy mẫu siêu cấp – TX23', 'https://casauhoanglong.com/wp-content/uploads/2023/08/tui-ca-sau-bach-tang-23-600x820.jpg', 2199000, '<h3><strong>T&uacute;i C&aacute; Sấu Trắng Nguy&ecirc;n Thủy Mẫu Si&ecirc;u Cấp &ndash; TX23</strong></h3>\n\n<p>T&uacute;i <strong>c&aacute; sấu trắng nguy&ecirc;n thủy mẫu si&ecirc;u cấp TX23</strong> l&agrave; sản phẩm đỉnh cao, kết hợp giữa chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế sang trọng, mang đến một m&oacute;n phụ kiện thời trang kh&ocirc;ng thể thiếu cho những t&iacute;n đồ y&ecirc;u th&iacute;ch sự tinh tế v&agrave; đẳng cấp. Với m&agrave;u trắng nguy&ecirc;n thủy tự nhi&ecirc;n v&agrave; kiểu d&aacute;ng ho&agrave;n hảo, chiếc t&uacute;i n&agrave;y chắc chắn sẽ l&agrave; điểm nhấn nổi bật trong bộ sưu tập của bạn.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu nguy&ecirc;n thủy si&ecirc;u cấp:</strong><br />\n	T&uacute;i được chế t&aacute;c từ <strong>da c&aacute; sấu thật</strong>, với c&aacute;c v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o, mang đến vẻ đẹp sang trọng v&agrave; độ bền vượt trội. Chất liệu n&agrave;y kh&ocirc;ng chỉ đẹp m&agrave; c&ograve;n rất bền, gi&uacute;p t&uacute;i giữ được h&igrave;nh d&aacute;ng v&agrave; m&agrave;u sắc l&acirc;u d&agrave;i.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u trắng nguy&ecirc;n thủy tinh tế:</strong><br />\n	M&agrave;u <strong>trắng nguy&ecirc;n thủy</strong> của da c&aacute; sấu mang lại vẻ đẹp thuần khiết v&agrave; thanh lịch. Đ&acirc;y l&agrave; m&agrave;u sắc dễ d&agrave;ng phối hợp với nhiều trang phục, từ c&ocirc;ng sở đến c&aacute;c buổi tiệc, gi&uacute;p bạn nổi bật trong mọi ho&agrave;n cảnh.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế si&ecirc;u cấp, sang trọng:</strong><br />\n	T&uacute;i c&oacute; thiết kế tinh tế v&agrave; ho&agrave;n hảo, với c&aacute;c chi tiết được chăm ch&uacute;t tỉ mỉ. K&iacute;ch thước t&uacute;i vừa phải, đủ để đựng c&aacute;c vật dụng c&aacute; nh&acirc;n như v&iacute;, điện thoại, mỹ phẩm v&agrave; c&aacute;c đồ d&ugrave;ng cần thiết kh&aacute;c.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa tiện dụng:</strong><br />\n	T&uacute;i được thiết kế với c&aacute;c ngăn ch&iacute;nh rộng r&atilde;i v&agrave; c&aacute;c ngăn phụ nhỏ gọn, gi&uacute;p bạn dễ d&agrave;ng sắp xếp đồ đạc một c&aacute;ch ngăn nắp v&agrave; tiện lợi.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo chắc chắn v&agrave; linh hoạt:</strong><br />\n	D&acirc;y đeo của t&uacute;i c&oacute; thể điều chỉnh độ d&agrave;i, gi&uacute;p bạn dễ d&agrave;ng thay đổi c&aacute;ch mang t&uacute;i từ x&aacute;ch tay đến đeo ch&eacute;o, tạo sự thoải m&aacute;i v&agrave; linh hoạt.</p>\n	</li>\n</ul>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (129, 4, 'Túi da bụng cá sấu – TX18', 'https://casauhoanglong.com/wp-content/uploads/2023/02/Tui-ca-sau-nguyen-ban-TX004-600x820.jpg', 3599000, '<h3><strong>T&uacute;i Da Bụng C&aacute; Sấu &ndash; TX18</strong></h3>\n\n<p>T&uacute;i <strong>da bụng c&aacute; sấu TX18</strong> l&agrave; sự kết hợp ho&agrave;n hảo giữa chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế tinh tế, mang đến vẻ đẹp sang trọng v&agrave; đẳng cấp. Với chất liệu <strong>da bụng c&aacute; sấu</strong> độc đ&aacute;o, chiếc t&uacute;i n&agrave;y kh&ocirc;ng chỉ nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n m&agrave; c&ograve;n đảm bảo độ bền v&agrave; t&iacute;nh thẩm mỹ vượt trội, l&agrave; m&oacute;n phụ kiện l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự kh&aacute;c biệt v&agrave; phong c&aacute;ch thời trang đỉnh cao.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da bụng c&aacute; sấu cao cấp:</strong><br />\n	T&uacute;i được chế t&aacute;c từ <strong>da bụng c&aacute; sấu</strong> thật, nổi bật với c&aacute;c v&acirc;n da độc đ&aacute;o v&agrave; mềm mại. Da bụng c&aacute; sấu mang lại vẻ đẹp tự nhi&ecirc;n, sang trọng v&agrave; bền bỉ, đồng thời c&oacute; khả năng chống m&agrave;i m&ograve;n cao, giữ được độ mới l&acirc;u d&agrave;i.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế tinh tế, sang trọng:</strong><br />\n	T&uacute;i c&oacute; kiểu d&aacute;ng gọn g&agrave;ng, ph&ugrave; hợp cho cả nam v&agrave; nữ. Với thiết kế thanh lịch v&agrave; hiện đại, t&uacute;i dễ d&agrave;ng kết hợp với nhiều phong c&aacute;ch thời trang kh&aacute;c nhau, từ c&ocirc;ng sở đến dạo phố hay c&aacute;c buổi tiệc, sự kiện.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa tiện dụng:</strong><br />\n	T&uacute;i được thiết kế với c&aacute;c ngăn chứa rộng r&atilde;i, gi&uacute;p bạn dễ d&agrave;ng sắp xếp đồ đạc như v&iacute;, điện thoại, ch&igrave;a kh&oacute;a, mỹ phẩm v&agrave; c&aacute;c vật dụng c&aacute; nh&acirc;n kh&aacute;c một c&aacute;ch ngăn nắp v&agrave; tiện lợi.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc thanh lịch, dễ phối đồ:</strong><br />\n	T&uacute;i c&oacute; m&agrave;u sắc trung t&iacute;nh, dễ d&agrave;ng phối hợp với nhiều loại trang phục, mang lại vẻ đẹp tinh tế v&agrave; sang trọng cho người sử dụng.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo chắc chắn v&agrave; linh hoạt:</strong><br />\n	D&acirc;y đeo của t&uacute;i c&oacute; thể điều chỉnh độ d&agrave;i, gi&uacute;p bạn dễ d&agrave;ng thay đổi c&aacute;ch mang t&uacute;i từ x&aacute;ch tay đến đeo vai hoặc đeo ch&eacute;o, mang lại sự thoải m&aacute;i v&agrave; linh hoạt khi sử dụng.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>T&uacute;i Da Bụng C&aacute; Sấu &ndash; TX18</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự sang trọng, độc đ&aacute;o v&agrave; bền bỉ. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế tinh tế, chiếc t&uacute;i n&agrave;y sẽ l&agrave; điểm nhấn ho&agrave;n hảo cho phong c&aacute;ch của bạn trong mọi ho&agrave;n cảnh.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (130, 4, 'Túi da cá sấu MINA đen – TX05', 'https://casauhoanglong.com/wp-content/uploads/2023/05/IMG_9957-600x820.jpg', 5429000, '<h3><strong>T&uacute;i Da C&aacute; Sấu MINA Đen &ndash; TX05</strong></h3>\n\n<p>T&uacute;i <strong>da c&aacute; sấu MINA đen TX05</strong> l&agrave; một sản phẩm ho&agrave;n hảo d&agrave;nh cho những ai y&ecirc;u th&iacute;ch sự sang trọng v&agrave; tinh tế. Với chất liệu <strong>da c&aacute; sấu cao cấp</strong> v&agrave; m&agrave;u sắc <strong>đen cổ điển</strong>, chiếc t&uacute;i n&agrave;y mang đến vẻ đẹp thanh lịch, dễ d&agrave;ng kết hợp với nhiều phong c&aacute;ch thời trang kh&aacute;c nhau. Được thiết kế với c&aacute;c chi tiết tỉ mỉ, <strong>TX05</strong> kh&ocirc;ng chỉ l&agrave; một phụ kiện thời trang m&agrave; c&ograve;n l&agrave; biểu tượng của sự đẳng cấp v&agrave; sang trọng.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	T&uacute;i được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n, mang đến vẻ đẹp độc đ&aacute;o v&agrave; bền bỉ. Da c&aacute; sấu kh&ocirc;ng chỉ đẹp m&agrave; c&ograve;n c&oacute; độ bền vượt trội, gi&uacute;p t&uacute;i giữ được h&igrave;nh d&aacute;ng v&agrave; m&agrave;u sắc l&acirc;u d&agrave;i.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc đen cổ điển:</strong><br />\n	M&agrave;u <strong>đen</strong> của t&uacute;i mang lại sự thanh lịch v&agrave; dễ d&agrave;ng phối hợp với nhiều trang phục, từ c&ocirc;ng sở đến dạo phố, hoặc tham dự c&aacute;c sự kiện quan trọng. Đ&acirc;y l&agrave; m&agrave;u sắc ph&ugrave; hợp cho mọi ho&agrave;n cảnh v&agrave; gi&uacute;p bạn tỏa s&aacute;ng một c&aacute;ch tinh tế.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế tinh tế v&agrave; sang trọng:</strong><br />\n	T&uacute;i c&oacute; kiểu d&aacute;ng gọn g&agrave;ng, thanh lịch với c&aacute;c chi tiết được chăm ch&uacute;t tỉ mỉ. Được thiết kế để ph&ugrave; hợp với cả nam v&agrave; nữ, t&uacute;i l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự đơn giản nhưng vẫn đầy sang trọng.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa tiện dụng:</strong><br />\n	T&uacute;i c&oacute; c&aacute;c ngăn chứa rộng r&atilde;i, gi&uacute;p bạn dễ d&agrave;ng sắp xếp c&aacute;c vật dụng c&aacute; nh&acirc;n như v&iacute;, điện thoại, ch&igrave;a kh&oacute;a, mỹ phẩm, v&agrave; c&aacute;c đồ d&ugrave;ng cần thiết kh&aacute;c một c&aacute;ch ngăn nắp v&agrave; tiện lợi.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo chắc chắn v&agrave; linh hoạt:</strong><br />\n	D&acirc;y đeo của t&uacute;i c&oacute; thể điều chỉnh độ d&agrave;i, gi&uacute;p bạn dễ d&agrave;ng thay đổi c&aacute;ch mang t&uacute;i từ x&aacute;ch tay đến đeo ch&eacute;o hoặc đeo vai, tạo sự thoải m&aacute;i v&agrave; linh hoạt khi sử dụng.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>T&uacute;i Da C&aacute; Sấu MINA Đen &ndash; TX05</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự sang trọng, thanh lịch v&agrave; tiện dụng. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế tinh tế, chiếc t&uacute;i n&agrave;y sẽ l&agrave; m&oacute;n phụ kiện kh&ocirc;ng thể thiếu, gi&uacute;p bạn thể hiện phong c&aacute;ch v&agrave; đẳng cấp của m&igrave;nh.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (131, 7, 'Vali da cá sấu hàng hiệu cao cấp Gento D519', 'https://www.gento.vn/wp-content/uploads/2023/06/vali-da-ca-sau-cao-cap4.jpg', 4299000, '<h3><strong>Vali Da C&aacute; Sấu H&agrave;ng Hiệu Cao Cấp Gento D519</strong></h3>\n\n<p>Vali <strong>da c&aacute; sấu Gento D519</strong> l&agrave; sự kết hợp ho&agrave;n hảo giữa chất liệu <strong>da c&aacute; sấu cao cấp</strong> v&agrave; thiết kế tinh tế, mang đến một sản phẩm kh&ocirc;ng chỉ đẹp mắt m&agrave; c&ograve;n v&ocirc; c&ugrave;ng bền bỉ. Với kiểu d&aacute;ng hiện đại v&agrave; đẳng cấp, chiếc vali n&agrave;y kh&ocirc;ng chỉ l&agrave; phương tiện di chuyển m&agrave; c&ograve;n l&agrave; biểu tượng của phong c&aacute;ch v&agrave; sự sang trọng. D&agrave;nh cho những ai y&ecirc;u th&iacute;ch sự kh&aacute;c biệt v&agrave; lu&ocirc;n muốn thể hiện đẳng cấp, <strong>Gento D519</strong> l&agrave; lựa chọn l&yacute; tưởng cho c&aacute;c chuyến đi quan trọng.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	Vali được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n v&agrave; độc đ&aacute;o, mang lại vẻ đẹp sang trọng v&agrave; độ bền vượt trội. Da c&aacute; sấu kh&ocirc;ng chỉ đẹp m&agrave; c&ograve;n c&oacute; khả năng chống m&agrave;i m&ograve;n, giữ được độ mới l&acirc;u d&agrave;i, gi&uacute;p vali lu&ocirc;n bền bỉ theo thời gian.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế tinh tế, sang trọng:</strong><br />\n	Vali Gento D519 c&oacute; thiết kế hiện đại, gọn g&agrave;ng nhưng kh&ocirc;ng k&eacute;m phần sang trọng. C&aacute;c chi tiết được chăm ch&uacute;t tỉ mỉ, từ đường may đến c&aacute;c phụ kiện kim loại, tạo n&ecirc;n một sản phẩm ho&agrave;n hảo, ph&ugrave; hợp với những chuyến c&ocirc;ng t&aacute;c, du lịch hay c&aacute;c sự kiện quan trọng.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa rộng r&atilde;i v&agrave; tiện dụng:</strong><br />\n	Vali c&oacute; kh&ocirc;ng gian rộng r&atilde;i với c&aacute;c ngăn chứa được bố tr&iacute; hợp l&yacute;, gi&uacute;p bạn dễ d&agrave;ng sắp xếp đồ đạc một c&aacute;ch ngăn nắp. Với thiết kế th&ocirc;ng minh, vali c&oacute; thể chứa được nhiều đồ d&ugrave;ng c&aacute; nh&acirc;n, từ quần &aacute;o đến c&aacute;c vật dụng cần thiết kh&aacute;c.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y k&eacute;o v&agrave; kh&oacute;a an to&agrave;n:</strong><br />\n	Vali được trang bị kh&oacute;a an to&agrave;n v&agrave; d&acirc;y k&eacute;o chất lượng cao, gi&uacute;p bảo vệ đồ đạc của bạn khỏi những t&aacute;c động b&ecirc;n ngo&agrave;i. Kh&oacute;a được thiết kế chắc chắn, dễ d&agrave;ng sử dụng v&agrave; đảm bảo an to&agrave;n tối đa.</p>\n	</li>\n	<li>\n	<p><strong>B&aacute;nh xe linh hoạt v&agrave; chắc chắn:</strong><br />\n	Vali c&oacute; b&aacute;nh xe xoay 360 độ, gi&uacute;p bạn di chuyển dễ d&agrave;ng v&agrave; linh hoạt. Thiết kế b&aacute;nh xe chắc chắn gi&uacute;p vali di chuyển ổn định tr&ecirc;n nhiều loại địa h&igrave;nh kh&aacute;c nhau, mang lại sự tiện lợi tối đa cho người sử dụng.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>Vali Da C&aacute; Sấu H&agrave;ng Hiệu Cao Cấp Gento D519</strong> l&agrave; lựa chọn ho&agrave;n hảo cho những ai y&ecirc;u th&iacute;ch sự sang trọng, tiện dụng v&agrave; đẳng cấp. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế th&ocirc;ng minh, chiếc vali n&agrave;y sẽ l&agrave; người bạn đồng h&agrave;nh l&yacute; tưởng trong mọi chuyến đi, gi&uacute;p bạn thể hiện phong c&aacute;ch v&agrave; đẳng cấp của m&igrave;nh.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (132, 5, 'Túi xách da cá sấu ĐỘC BẢN, túi da macbook, túi xách da nam công sở MB050', 'https://babuhandmade.com/wp-content/uploads/2023/02/tui-xach-da-ca-sau-tui-da-macbook-1.jpg', 2399000, '<h3><strong>T&uacute;i X&aacute;ch Da C&aacute; Sấu ĐỘC BẢN, T&uacute;i Da Macbook, T&uacute;i X&aacute;ch Da Nam C&ocirc;ng Sở MB050</strong></h3>\n\n<p>T&uacute;i <strong>x&aacute;ch da c&aacute; sấu MB050</strong> l&agrave; sự kết hợp ho&agrave;n hảo giữa chất liệu <strong>da c&aacute; sấu cao cấp</strong> v&agrave; thiết kế <strong>độc bản</strong>, mang đến một m&oacute;n phụ kiện thời trang kh&ocirc;ng thể thiếu cho những qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch sự sang trọng v&agrave; đẳng cấp. Với khả năng chứa đựng Macbook v&agrave; c&aacute;c vật dụng c&ocirc;ng sở, chiếc t&uacute;i n&agrave;y kh&ocirc;ng chỉ l&agrave; một m&oacute;n đồ tiện &iacute;ch m&agrave; c&ograve;n l&agrave; biểu tượng của phong c&aacute;ch thời thượng, l&yacute; tưởng cho những ai thường xuy&ecirc;n di chuyển v&agrave; l&agrave;m việc tại c&aacute;c văn ph&ograve;ng.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	T&uacute;i được chế t&aacute;c từ <strong>da c&aacute; sấu thật</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o, mang đến vẻ đẹp sang trọng v&agrave; độ bền vượt trội. Da c&aacute; sấu gi&uacute;p t&uacute;i kh&ocirc;ng chỉ bền bỉ m&agrave; c&ograve;n giữ được vẻ đẹp nguy&ecirc;n bản theo thời gian.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế độc bản, sang trọng:</strong><br />\n	Với kiểu d&aacute;ng <strong>độc bản</strong>, t&uacute;i x&aacute;ch MB050 nổi bật với vẻ ngo&agrave;i tinh tế v&agrave; thanh lịch, ph&ugrave; hợp với nhiều phong c&aacute;ch thời trang c&ocirc;ng sở, từ những buổi họp quan trọng đến c&aacute;c sự kiện trang trọng.</p>\n	</li>\n	<li>\n	<p><strong>T&uacute;i da Macbook tiện dụng:</strong><br />\n	Thiết kế của t&uacute;i được tối ưu để đựng <strong>Macbook</strong> v&agrave; c&aacute;c thiết bị điện tử kh&aacute;c, với ngăn chứa được bảo vệ kỹ lưỡng. Ngo&agrave;i ra, t&uacute;i c&ograve;n c&oacute; c&aacute;c ngăn phụ để đựng c&aacute;c vật dụng c&ocirc;ng sở như v&iacute;, b&uacute;t, điện thoại, ch&igrave;a kh&oacute;a, gi&uacute;p bạn dễ d&agrave;ng sắp xếp đồ đạc một c&aacute;ch ngăn nắp.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo chắc chắn, dễ d&agrave;ng điều chỉnh:</strong><br />\n	D&acirc;y đeo của t&uacute;i c&oacute; thể điều chỉnh để bạn c&oacute; thể mang t&uacute;i theo nhiều c&aacute;ch kh&aacute;c nhau, từ x&aacute;ch tay đến đeo vai hoặc đeo ch&eacute;o, tạo sự thoải m&aacute;i v&agrave; linh hoạt trong mọi ho&agrave;n cảnh.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc thanh lịch, dễ phối hợp:</strong><br />\n	T&uacute;i c&oacute; m&agrave;u sắc trung t&iacute;nh, dễ d&agrave;ng phối hợp với nhiều loại trang phục c&ocirc;ng sở kh&aacute;c nhau, từ sơ mi, vest đến quần t&acirc;y, tạo n&ecirc;n vẻ ngo&agrave;i lịch l&atilde;m v&agrave; chuy&ecirc;n nghiệp.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>T&uacute;i X&aacute;ch Da C&aacute; Sấu ĐỘC BẢN MB050</strong> l&agrave; lựa chọn l&yacute; tưởng cho những qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch sự sang trọng v&agrave; tiện dụng. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế th&ocirc;ng minh, chiếc t&uacute;i n&agrave;y kh&ocirc;ng chỉ gi&uacute;p bạn bảo vệ c&aacute;c thiết bị điện tử m&agrave; c&ograve;n thể hiện phong c&aacute;ch thời trang đẳng cấp trong m&ocirc;i trường c&ocirc;ng sở.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (133, 5, 'TÚI BAO TỬ/ĐEO CHÉO DA CÁ SẤU', 'https://cdn1.azibai.com/media/images/product/04082022/FphbI6LTN7NmZ8pjMdIkSIQpTWAOu7ImyUGsZlGL.jpeg', 1999000, '<h3><strong>T&uacute;i Bao Tử/Đeo Ch&eacute;o Da C&aacute; Sấu</strong></h3>\n\n<p>T&uacute;i <strong>bao tử/đeo ch&eacute;o da c&aacute; sấu</strong> l&agrave; m&oacute;n phụ kiện thời trang kh&ocirc;ng thể thiếu cho những ai y&ecirc;u th&iacute;ch sự năng động, tiện dụng nhưng vẫn muốn thể hiện phong c&aacute;ch sang trọng. Với chất liệu <strong>da c&aacute; sấu cao cấp</strong>, chiếc t&uacute;i n&agrave;y kh&ocirc;ng chỉ bền bỉ m&agrave; c&ograve;n mang lại vẻ đẹp tự nhi&ecirc;n v&agrave; độc đ&aacute;o từ c&aacute;c v&acirc;n da c&aacute; sấu. Thiết kế <strong>bao tử/đeo ch&eacute;o</strong> gi&uacute;p bạn dễ d&agrave;ng di chuyển v&agrave; mang theo c&aacute;c vật dụng c&aacute; nh&acirc;n một c&aacute;ch gọn g&agrave;ng v&agrave; tiện lợi.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	T&uacute;i được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, mang lại vẻ đẹp tự nhi&ecirc;n với c&aacute;c v&acirc;n da độc đ&aacute;o. Chất liệu n&agrave;y kh&ocirc;ng chỉ tạo n&ecirc;n sự sang trọng m&agrave; c&ograve;n rất bền bỉ, gi&uacute;p t&uacute;i giữ được h&igrave;nh d&aacute;ng v&agrave; m&agrave;u sắc l&acirc;u d&agrave;i.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế bao tử/đeo ch&eacute;o tiện dụng:</strong><br />\n	Với kiểu d&aacute;ng bao tử hoặc đeo ch&eacute;o, t&uacute;i gi&uacute;p bạn dễ d&agrave;ng mang theo c&aacute;c vật dụng c&aacute; nh&acirc;n như điện thoại, v&iacute;, ch&igrave;a kh&oacute;a, tiền mặt, v&agrave; c&aacute;c vật dụng nhỏ kh&aacute;c m&agrave; kh&ocirc;ng cần phải mang theo một chiếc t&uacute;i lớn. Thiết kế n&agrave;y mang lại sự linh hoạt v&agrave; thoải m&aacute;i khi di chuyển.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa th&ocirc;ng minh:</strong><br />\n	T&uacute;i được thiết kế với c&aacute;c ngăn chứa tiện dụng, gi&uacute;p bạn dễ d&agrave;ng sắp xếp đồ đạc một c&aacute;ch ngăn nắp. C&aacute;c ngăn phụ c&oacute; thể đựng điện thoại, thẻ t&iacute;n dụng, ch&igrave;a kh&oacute;a, gi&uacute;p bạn dễ d&agrave;ng truy cập v&agrave; sử dụng mọi thứ khi cần.</p>\n	</li>\n	<li>\n	<p><strong>D&acirc;y đeo chắc chắn v&agrave; điều chỉnh được:</strong><br />\n	D&acirc;y đeo của t&uacute;i c&oacute; thể điều chỉnh độ d&agrave;i, gi&uacute;p bạn dễ d&agrave;ng thay đổi c&aacute;ch mang t&uacute;i từ đeo ch&eacute;o sang mang ngang h&ocirc;ng, tạo sự thoải m&aacute;i v&agrave; linh hoạt trong mọi t&igrave;nh huống.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc v&agrave; thiết kế tinh tế:</strong><br />\n	T&uacute;i c&oacute; m&agrave;u sắc trung t&iacute;nh v&agrave; thiết kế tinh tế, dễ d&agrave;ng kết hợp với nhiều loại trang phục, từ đồ thể thao đến trang phục thường ng&agrave;y, mang lại vẻ ngo&agrave;i c&aacute; t&iacute;nh v&agrave; thời trang.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>T&uacute;i Bao Tử/Đeo Ch&eacute;o Da C&aacute; Sấu</strong> l&agrave; sự lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự tiện lợi v&agrave; phong c&aacute;ch. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế th&ocirc;ng minh, chiếc t&uacute;i n&agrave;y kh&ocirc;ng chỉ gi&uacute;p bạn bảo vệ c&aacute;c vật dụng c&aacute; nh&acirc;n m&agrave; c&ograve;n l&agrave; một m&oacute;n phụ kiện thời trang nổi bật, mang lại sự sang trọng v&agrave; đẳng cấp cho người sử dụng.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (134, 2, 'Ví cầm tay nữ da cá sấu thời trang hàng hiệu VCSN03', 'https://tuixachda.net/wp-content/uploads/2017/06/vi-cam-tay-nu-da-ca-sau-thoi-trang-hang-hieu-vcsn03.jpg', 2199000, '<h3><strong>V&iacute; Cầm Tay Nữ Da C&aacute; Sấu Thời Trang H&agrave;ng Hiệu VCSN03</strong></h3>\n\n<p><strong>V&iacute; cầm tay nữ da c&aacute; sấu thời trang h&agrave;ng hiệu VCSN03</strong> l&agrave; m&oacute;n phụ kiện ho&agrave;n hảo cho những qu&yacute; c&ocirc; y&ecirc;u th&iacute;ch sự sang trọng, tinh tế v&agrave; đẳng cấp. Được chế t&aacute;c từ <strong>da c&aacute; sấu cao cấp</strong>, chiếc v&iacute; n&agrave;y kh&ocirc;ng chỉ mang đến vẻ đẹp tự nhi&ecirc;n với c&aacute;c v&acirc;n da độc đ&aacute;o m&agrave; c&ograve;n đảm bảo độ bền bỉ, gi&uacute;p bạn sử dụng l&acirc;u d&agrave;i. Với thiết kế thanh lịch v&agrave; tiện dụng, <strong>VCSN03</strong> sẽ l&agrave; điểm nhấn ho&agrave;n hảo cho phong c&aacute;ch của bạn.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	V&iacute; được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n, tạo n&ecirc;n vẻ đẹp sang trọng v&agrave; độc đ&aacute;o. Da c&aacute; sấu kh&ocirc;ng chỉ bền bỉ m&agrave; c&ograve;n c&oacute; độ b&oacute;ng tự nhi&ecirc;n, gi&uacute;p chiếc v&iacute; lu&ocirc;n giữ được vẻ đẹp nguy&ecirc;n vẹn theo thời gian.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế thời trang, thanh lịch:</strong><br />\n	Với thiết kế nhỏ gọn v&agrave; thanh lịch, v&iacute; cầm tay VCSN03 dễ d&agrave;ng kết hợp với nhiều phong c&aacute;ch thời trang kh&aacute;c nhau, từ c&ocirc;ng sở đến c&aacute;c buổi tiệc, sự kiện. M&agrave;u sắc trang nh&atilde; gi&uacute;p bạn dễ d&agrave;ng phối hợp với c&aacute;c trang phục kh&aacute;c.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa tiện dụng:</strong><br />\n	V&iacute; được thiết kế với c&aacute;c ngăn chứa th&ocirc;ng minh, gi&uacute;p bạn dễ d&agrave;ng sắp xếp c&aacute;c vật dụng c&aacute; nh&acirc;n như tiền mặt, thẻ t&iacute;n dụng, giấy tờ v&agrave; c&aacute;c vật dụng nhỏ kh&aacute;c một c&aacute;ch ngăn nắp. C&aacute;c ngăn phụ gi&uacute;p bạn dễ d&agrave;ng t&igrave;m kiếm v&agrave; truy cập đồ đạc khi cần.</p>\n	</li>\n	<li>\n	<p><strong>Kh&oacute;a k&eacute;o chắc chắn:</strong><br />\n	V&iacute; được trang bị kh&oacute;a k&eacute;o chất lượng cao, gi&uacute;p bảo vệ đồ đạc của bạn khỏi rơi rớt v&agrave; đảm bảo an to&agrave;n cho c&aacute;c vật dụng b&ecirc;n trong.</p>\n	</li>\n	<li>\n	<p><strong>K&iacute;ch thước ho&agrave;n hảo:</strong><br />\n	Với k&iacute;ch thước vừa phải, v&iacute; cầm tay VCSN03 dễ d&agrave;ng bỏ v&agrave;o t&uacute;i x&aacute;ch hoặc mang theo tay, rất tiện lợi cho c&aacute;c dịp dạo phố hay đi tiệc.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>V&iacute; Cầm Tay Nữ Da C&aacute; Sấu Thời Trang H&agrave;ng Hiệu VCSN03</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự sang trọng v&agrave; tiện dụng. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế tinh tế, chiếc v&iacute; n&agrave;y sẽ l&agrave; điểm nhấn ho&agrave;n hảo trong bộ sưu tập phụ kiện của bạn, gi&uacute;p bạn lu&ocirc;n nổi bật v&agrave; thể hiện phong c&aacute;ch thời trang đẳng cấp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (135, 2, 'Ví da cá sấu cầm tay giá rẻ tại Hà Nội VCSN09', 'https://tuixachda.net/wp-content/uploads/2017/06/vi-da-ca-sau-cam-tay-gia-re-tai-ha-noi-vcsn09.jpg', 2399000, '<h3><strong>V&iacute; Da C&aacute; Sấu Cầm Tay Gi&aacute; Rẻ Tại H&agrave; Nội VCSN09</strong></h3>\n\n<p><strong>V&iacute; da c&aacute; sấu cầm tay VCSN09</strong> l&agrave; sự lựa chọn ho&agrave;n hảo cho những ai y&ecirc;u th&iacute;ch sự sang trọng v&agrave; đẳng cấp nhưng vẫn muốn t&igrave;m kiếm một sản phẩm c&oacute; gi&aacute; th&agrave;nh hợp l&yacute;. Được l&agrave;m từ <strong>da c&aacute; sấu cao cấp</strong>, chiếc v&iacute; n&agrave;y mang đến vẻ đẹp tự nhi&ecirc;n với c&aacute;c v&acirc;n da độc đ&aacute;o v&agrave; độ bền vượt trội. Với thiết kế tiện dụng v&agrave; thanh lịch, <strong>VCSN09</strong> l&agrave; m&oacute;n phụ kiện l&yacute; tưởng cho mọi qu&yacute; c&ocirc;, gi&uacute;p bạn lu&ocirc;n nổi bật v&agrave; phong c&aacute;ch.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	V&iacute; được chế t&aacute;c từ <strong>da c&aacute; sấu thật</strong>, mang lại vẻ đẹp sang trọng v&agrave; bền bỉ. C&aacute;c v&acirc;n da c&aacute; sấu tự nhi&ecirc;n tạo n&ecirc;n một sản phẩm độc đ&aacute;o, gi&uacute;p chiếc v&iacute; lu&ocirc;n nổi bật v&agrave; giữ được vẻ đẹp l&acirc;u d&agrave;i.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế thanh lịch, tiện dụng:</strong><br />\n	V&iacute; cầm tay <strong>VCSN09</strong> c&oacute; kiểu d&aacute;ng nhỏ gọn, dễ d&agrave;ng mang theo trong t&uacute;i x&aacute;ch hoặc cầm tay. Với thiết kế đơn giản nhưng tinh tế, chiếc v&iacute; n&agrave;y dễ d&agrave;ng kết hợp với nhiều phong c&aacute;ch thời trang kh&aacute;c nhau, từ c&ocirc;ng sở đến dạo phố.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa th&ocirc;ng minh:</strong><br />\n	V&iacute; được trang bị c&aacute;c ngăn chứa rộng r&atilde;i, gi&uacute;p bạn dễ d&agrave;ng sắp xếp tiền mặt, thẻ t&iacute;n dụng, giấy tờ v&agrave; c&aacute;c vật dụng nhỏ kh&aacute;c một c&aacute;ch ngăn nắp. V&iacute; c&oacute; thể đựng nhiều đồ m&agrave; kh&ocirc;ng l&agrave;m mất đi vẻ gọn g&agrave;ng.</p>\n	</li>\n	<li>\n	<p><strong>Kh&oacute;a k&eacute;o chắc chắn:</strong><br />\n	V&iacute; c&oacute; kh&oacute;a k&eacute;o chất lượng cao, gi&uacute;p bảo vệ đồ đạc của bạn an to&agrave;n, tr&aacute;nh rơi rớt trong qu&aacute; tr&igrave;nh sử dụng.</p>\n	</li>\n	<li>\n	<p><strong>Gi&aacute; cả hợp l&yacute;:</strong><br />\n	Mặc d&ugrave; được l&agrave;m từ <strong>da c&aacute; sấu cao cấp</strong>, <strong>VCSN09</strong> c&oacute; mức gi&aacute; rất hợp l&yacute;, ph&ugrave; hợp với những ai muốn sở hữu một chiếc v&iacute; da c&aacute; sấu đẹp m&agrave; kh&ocirc;ng phải bỏ ra một số tiền qu&aacute; lớn.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>V&iacute; Da C&aacute; Sấu Cầm Tay Gi&aacute; Rẻ Tại H&agrave; Nội VCSN09</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai muốn sở hữu một chiếc v&iacute; da c&aacute; sấu chất lượng cao với mức gi&aacute; hợp l&yacute;. Với thiết kế sang trọng v&agrave; tiện dụng, chiếc v&iacute; n&agrave;y sẽ l&agrave; m&oacute;n phụ kiện kh&ocirc;ng thể thiếu trong bộ sưu tập của bạn.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (136, 2, 'Ví da cá sấu cầm tay thời trang mới năm 2017 VCSN10', 'https://tuixachda.net/wp-content/uploads/2017/06/vi-da-ca-sau-cam-tay-thoi-trang-moi-nam-2017-vcsn10.jpg', 1599000, '<h3><strong>V&iacute; Da C&aacute; Sấu Cầm Tay Thời Trang Mới Năm 2017 VCSN10</strong></h3>\n\n<p><strong>V&iacute; da c&aacute; sấu cầm tay VCSN10</strong> l&agrave; một trong những mẫu v&iacute; <strong>thời trang mới nhất năm 2017</strong>, mang đến cho bạn sự kết hợp ho&agrave;n hảo giữa phong c&aacute;ch hiện đại v&agrave; chất liệu cao cấp. Được chế t&aacute;c từ <strong>da c&aacute; sấu thật</strong>, chiếc v&iacute; n&agrave;y kh&ocirc;ng chỉ nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o m&agrave; c&ograve;n c&oacute; độ bền vượt trội, gi&uacute;p bạn sử dụng l&acirc;u d&agrave;i m&agrave; vẫn giữ được vẻ đẹp nguy&ecirc;n vẹn. Thiết kế thanh lịch v&agrave; tinh tế của <strong>VCSN10</strong> l&agrave; m&oacute;n phụ kiện l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự sang trọng v&agrave; đẳng cấp.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	V&iacute; được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, mang lại vẻ đẹp tự nhi&ecirc;n v&agrave; độc đ&aacute;o từ c&aacute;c v&acirc;n da. Da c&aacute; sấu kh&ocirc;ng chỉ bền bỉ m&agrave; c&ograve;n c&oacute; độ b&oacute;ng tự nhi&ecirc;n, gi&uacute;p chiếc v&iacute; lu&ocirc;n giữ được vẻ đẹp sang trọng v&agrave; mới mẻ theo thời gian.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế thời trang v&agrave; tinh tế:</strong><br />\n	V&iacute; cầm tay <strong>VCSN10</strong> c&oacute; kiểu d&aacute;ng thanh lịch, nhỏ gọn, dễ d&agrave;ng mang theo trong t&uacute;i x&aacute;ch hoặc cầm tay. Với thiết kế đơn giản nhưng hiện đại, chiếc v&iacute; n&agrave;y ph&ugrave; hợp với nhiều phong c&aacute;ch thời trang kh&aacute;c nhau, từ c&ocirc;ng sở đến dạo phố hay tham dự c&aacute;c sự kiện quan trọng.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa tiện dụng:</strong><br />\n	V&iacute; được thiết kế với c&aacute;c ngăn chứa rộng r&atilde;i, gi&uacute;p bạn dễ d&agrave;ng sắp xếp tiền mặt, thẻ t&iacute;n dụng, giấy tờ v&agrave; c&aacute;c vật dụng nhỏ kh&aacute;c một c&aacute;ch ngăn nắp v&agrave; dễ d&agrave;ng truy cập khi cần.</p>\n	</li>\n	<li>\n	<p><strong>Kh&oacute;a k&eacute;o chắc chắn:</strong><br />\n	V&iacute; c&oacute; kh&oacute;a k&eacute;o chất lượng cao, gi&uacute;p bảo vệ đồ đạc của bạn một c&aacute;ch an to&agrave;n, tr&aacute;nh rơi rớt trong qu&aacute; tr&igrave;nh sử dụng.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc trang nh&atilde;:</strong><br />\n	V&iacute; c&oacute; m&agrave;u sắc trung t&iacute;nh, dễ d&agrave;ng phối hợp với nhiều trang phục kh&aacute;c nhau, tạo n&ecirc;n vẻ ngo&agrave;i thanh lịch v&agrave; tinh tế.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>V&iacute; Da C&aacute; Sấu Cầm Tay Thời Trang Mới Năm 2017 VCSN10</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự sang trọng v&agrave; tiện dụng. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế tinh tế, chiếc v&iacute; n&agrave;y sẽ l&agrave; m&oacute;n phụ kiện kh&ocirc;ng thể thiếu trong bộ sưu tập của bạn, gi&uacute;p bạn lu&ocirc;n nổi bật v&agrave; thể hiện phong c&aacute;ch thời trang đẳng cấp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (137, 2, 'Ví da cá sấu nữ 3 gấp hàng hiệu giá rẻ 2017 VCSN14', 'https://tuixachda.net/wp-content/uploads/2017/06/vi-da-ca-sau-nu-3-gap-hang-hieu-gia-re-2017-vcsn14.jpg', 2999000, '<h3><strong>V&iacute; Da C&aacute; Sấu Nữ 3 Gấp H&agrave;ng Hiệu Gi&aacute; Rẻ 2017 VCSN14</strong></h3>\n\n<p><strong>V&iacute; da c&aacute; sấu nữ 3 gấp VCSN14</strong> l&agrave; một trong những mẫu v&iacute; <strong>h&agrave;ng hiệu gi&aacute; rẻ</strong> được y&ecirc;u th&iacute;ch trong năm 2017. Với thiết kế <strong>3 gấp</strong> tinh tế, chiếc v&iacute; n&agrave;y mang đến sự tiện dụng v&agrave; sang trọng cho ph&aacute;i đẹp. Được chế t&aacute;c từ <strong>da c&aacute; sấu cao cấp</strong>, chiếc v&iacute; kh&ocirc;ng chỉ nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o m&agrave; c&ograve;n c&oacute; độ bền vượt trội, gi&uacute;p bạn sử dụng l&acirc;u d&agrave;i m&agrave; vẫn giữ được vẻ đẹp nguy&ecirc;n vẹn.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	V&iacute; được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, mang lại vẻ đẹp tự nhi&ecirc;n v&agrave; độc đ&aacute;o. C&aacute;c v&acirc;n da c&aacute; sấu gi&uacute;p chiếc v&iacute; trở n&ecirc;n sang trọng v&agrave; đẳng cấp, đồng thời da c&aacute; sấu cũng rất bền, giữ được h&igrave;nh d&aacute;ng v&agrave; m&agrave;u sắc l&acirc;u d&agrave;i.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế 3 gấp tiện dụng:</strong><br />\n	Với thiết kế <strong>3 gấp</strong>, v&iacute; gi&uacute;p bạn dễ d&agrave;ng sắp xếp tiền mặt, thẻ t&iacute;n dụng, giấy tờ v&agrave; c&aacute;c vật dụng nhỏ kh&aacute;c một c&aacute;ch ngăn nắp v&agrave; dễ d&agrave;ng truy cập. Mẫu v&iacute; n&agrave;y rất tiện dụng v&agrave; gọn g&agrave;ng, th&iacute;ch hợp cho những ai y&ecirc;u th&iacute;ch sự đơn giản nhưng vẫn muốn thể hiện phong c&aacute;ch.</p>\n	</li>\n	<li>\n	<p><strong>Kh&oacute;a k&eacute;o chắc chắn:</strong><br />\n	V&iacute; được trang bị kh&oacute;a k&eacute;o chất lượng cao, gi&uacute;p bảo vệ đồ đạc của bạn an to&agrave;n, tr&aacute;nh rơi rớt trong qu&aacute; tr&igrave;nh sử dụng.</p>\n	</li>\n	<li>\n	<p><strong>Gi&aacute; cả hợp l&yacute;:</strong><br />\n	Mặc d&ugrave; l&agrave; v&iacute; <strong>h&agrave;ng hiệu</strong> l&agrave;m từ da c&aacute; sấu cao cấp, <strong>VCSN14</strong> c&oacute; mức gi&aacute; rất hợp l&yacute;, ph&ugrave; hợp với những ai muốn sở hữu một chiếc v&iacute; sang trọng m&agrave; kh&ocirc;ng phải chi qu&aacute; nhiều tiền.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc trang nh&atilde;:</strong><br />\n	V&iacute; c&oacute; m&agrave;u sắc trung t&iacute;nh, dễ d&agrave;ng kết hợp với nhiều loại trang phục, từ c&ocirc;ng sở đến dạo phố, tạo n&ecirc;n vẻ ngo&agrave;i thanh lịch v&agrave; tinh tế.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>V&iacute; Da C&aacute; Sấu Nữ 3 Gấp H&agrave;ng Hiệu Gi&aacute; Rẻ 2017 VCSN14</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự sang trọng, tiện dụng v&agrave; gi&aacute; trị tốt. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế th&ocirc;ng minh, chiếc v&iacute; n&agrave;y kh&ocirc;ng chỉ gi&uacute;p bạn bảo vệ đồ đạc m&agrave; c&ograve;n thể hiện phong c&aacute;ch thời trang đẳng cấp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (138, 2, 'Ví cầm tay da cá sấu kéo khóa giá rẻ tại Hà Nội và TPHCM VCSN13', 'https://tuixachda.net/wp-content/uploads/2017/06/vi-cam-tay-da-ca-sau-keo-khoa-gia-re-tai-ha-noi-va-tphcm-vcsn13.jpg', 1299000, '<h3><strong>V&iacute; Cầm Tay Da C&aacute; Sấu K&eacute;o Kh&oacute;a Gi&aacute; Rẻ Tại H&agrave; Nội v&agrave; TP.HCM VCSN13</strong></h3>\n\n<p><strong>V&iacute; cầm tay da c&aacute; sấu k&eacute;o kh&oacute;a VCSN13</strong> l&agrave; lựa chọn ho&agrave;n hảo cho những ai y&ecirc;u th&iacute;ch sự sang trọng, tinh tế v&agrave; tiện dụng nhưng vẫn muốn sở hữu một chiếc v&iacute; <strong>gi&aacute; rẻ</strong>. Được l&agrave;m từ <strong>da c&aacute; sấu cao cấp</strong>, chiếc v&iacute; n&agrave;y kh&ocirc;ng chỉ mang đến vẻ đẹp tự nhi&ecirc;n với c&aacute;c v&acirc;n da độc đ&aacute;o m&agrave; c&ograve;n rất bền bỉ, gi&uacute;p bạn sử dụng l&acirc;u d&agrave;i m&agrave; vẫn giữ được vẻ đẹp nguy&ecirc;n vẹn. <strong>VCSN13</strong> l&agrave; m&oacute;n phụ kiện l&yacute; tưởng cho ph&aacute;i đẹp, ph&ugrave; hợp với cả những ai sống tại <strong>H&agrave; Nội</strong> v&agrave; <strong>TP.HCM</strong>.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	V&iacute; được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, mang lại vẻ đẹp sang trọng v&agrave; độc đ&aacute;o với c&aacute;c v&acirc;n da tự nhi&ecirc;n. Chất liệu n&agrave;y kh&ocirc;ng chỉ bền bỉ m&agrave; c&ograve;n c&oacute; độ b&oacute;ng tự nhi&ecirc;n, gi&uacute;p v&iacute; lu&ocirc;n giữ được vẻ đẹp cao cấp theo thời gian.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế k&eacute;o kh&oacute;a tiện dụng:</strong><br />\n	Với thiết kế <strong>k&eacute;o kh&oacute;a</strong>, v&iacute; mang lại sự an to&agrave;n tuyệt đối cho c&aacute;c vật dụng c&aacute; nh&acirc;n như tiền mặt, thẻ t&iacute;n dụng, giấy tờ v&agrave; c&aacute;c vật dụng nhỏ kh&aacute;c. Kh&oacute;a k&eacute;o chất lượng cao gi&uacute;p bảo vệ đồ đạc của bạn an to&agrave;n, tr&aacute;nh rơi rớt trong qu&aacute; tr&igrave;nh sử dụng.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế nhỏ gọn, thanh lịch:</strong><br />\n	V&iacute; c&oacute; kiểu d&aacute;ng nhỏ gọn, dễ d&agrave;ng mang theo trong t&uacute;i x&aacute;ch hoặc cầm tay. Thiết kế thanh lịch v&agrave; tinh tế của v&iacute; ph&ugrave; hợp với nhiều phong c&aacute;ch thời trang kh&aacute;c nhau, từ c&ocirc;ng sở đến dạo phố, hay tham gia c&aacute;c sự kiện quan trọng.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc trang nh&atilde;:</strong><br />\n	V&iacute; c&oacute; m&agrave;u sắc trung t&iacute;nh, dễ d&agrave;ng kết hợp với nhiều loại trang phục, mang đến vẻ ngo&agrave;i thanh lịch v&agrave; thời thượng. M&agrave;u sắc n&agrave;y gi&uacute;p bạn dễ d&agrave;ng phối hợp với c&aacute;c bộ đồ kh&aacute;c nhau, từ c&ocirc;ng sở đến c&aacute;c buổi tiệc.</p>\n	</li>\n	<li>\n	<p><strong>Gi&aacute; cả hợp l&yacute;:</strong><br />\n	D&ugrave; được l&agrave;m từ <strong>da c&aacute; sấu cao cấp</strong>, <strong>VCSN13</strong> c&oacute; mức gi&aacute; rất hợp l&yacute;, ph&ugrave; hợp với nhiều đối tượng kh&aacute;ch h&agrave;ng. Đ&acirc;y l&agrave; sự lựa chọn l&yacute; tưởng cho những ai muốn sở hữu một chiếc v&iacute; sang trọng nhưng vẫn tiết kiệm.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>V&iacute; Cầm Tay Da C&aacute; Sấu K&eacute;o Kh&oacute;a Gi&aacute; Rẻ Tại H&agrave; Nội v&agrave; TP.HCM VCSN13</strong> l&agrave; m&oacute;n phụ kiện kh&ocirc;ng thể thiếu cho những ai y&ecirc;u th&iacute;ch sự sang trọng, tiện dụng v&agrave; gi&aacute; trị tốt. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế th&ocirc;ng minh, chiếc v&iacute; n&agrave;y sẽ l&agrave; điểm nhấn ho&agrave;n hảo trong bộ sưu tập phụ kiện của bạn, gi&uacute;p bạn lu&ocirc;n nổi bật v&agrave; thể hiện phong c&aacute;ch thời trang đẳng cấp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (139, 2, 'Ví da cá sấu nữ cầm tay cúc bấm 2017 giá rẻ VCSN17', 'https://tuixachda.net/wp-content/uploads/2017/06/vi-da-ca-sau-nu-cam-tay-cuc-bam-2017-gia-re-vcsn17.jpg', 2199000, '<h3><strong>V&iacute; Da C&aacute; Sấu Nữ Cầm Tay C&uacute;c Bấm 2017 Gi&aacute; Rẻ VCSN17</strong></h3>\n\n<p><strong>V&iacute; da c&aacute; sấu nữ cầm tay c&uacute;c bấm VCSN17</strong> l&agrave; lựa chọn tuyệt vời cho những ai y&ecirc;u th&iacute;ch sự sang trọng, tiện dụng nhưng vẫn muốn sở hữu một sản phẩm <strong>gi&aacute; rẻ</strong>. Với chất liệu <strong>da c&aacute; sấu cao cấp</strong>, chiếc v&iacute; n&agrave;y mang đến vẻ đẹp tự nhi&ecirc;n với c&aacute;c v&acirc;n da độc đ&aacute;o, c&ugrave;ng độ bền vượt trội. Thiết kế <strong>c&uacute;c bấm</strong> tiện dụng gi&uacute;p bạn dễ d&agrave;ng sử dụng v&agrave; bảo vệ đồ đạc c&aacute; nh&acirc;n. <strong>VCSN17</strong> l&agrave; m&oacute;n phụ kiện l&yacute; tưởng cho c&aacute;c qu&yacute; c&ocirc;, đặc biệt trong năm 2017.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	V&iacute; được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n v&agrave; độc đ&aacute;o, tạo n&ecirc;n vẻ đẹp sang trọng v&agrave; đẳng cấp. Da c&aacute; sấu kh&ocirc;ng chỉ bền bỉ m&agrave; c&ograve;n c&oacute; độ b&oacute;ng tự nhi&ecirc;n, giữ cho chiếc v&iacute; lu&ocirc;n mới mẻ theo thời gian.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế c&uacute;c bấm tiện dụng:</strong><br />\n	V&iacute; c&oacute; thiết kế <strong>c&uacute;c bấm</strong> chắc chắn, gi&uacute;p bạn dễ d&agrave;ng mở v&agrave; đ&oacute;ng v&iacute; một c&aacute;ch nhanh ch&oacute;ng v&agrave; an to&agrave;n. C&uacute;c bấm gi&uacute;p giữ c&aacute;c vật dụng c&aacute; nh&acirc;n của bạn như tiền mặt, thẻ t&iacute;n dụng v&agrave; giấy tờ một c&aacute;ch gọn g&agrave;ng v&agrave; an to&agrave;n.</p>\n	</li>\n	<li>\n	<p><strong>Kiểu d&aacute;ng nhỏ gọn, thanh lịch:</strong><br />\n	Với thiết kế nhỏ gọn, v&iacute; dễ d&agrave;ng mang theo trong t&uacute;i x&aacute;ch hoặc cầm tay. Mẫu v&iacute; n&agrave;y kh&ocirc;ng chỉ tiện dụng m&agrave; c&ograve;n rất thời trang, ph&ugrave; hợp với nhiều phong c&aacute;ch từ c&ocirc;ng sở đến dạo phố hay tham gia c&aacute;c sự kiện.</p>\n	</li>\n	<li>\n	<p><strong>Gi&aacute; cả hợp l&yacute;:</strong><br />\n	Mặc d&ugrave; được l&agrave;m từ <strong>da c&aacute; sấu cao cấp</strong>, <strong>VCSN17</strong> c&oacute; mức gi&aacute; phải chăng, ph&ugrave; hợp với nhiều đối tượng kh&aacute;ch h&agrave;ng. Đ&acirc;y l&agrave; sự lựa chọn ho&agrave;n hảo cho những ai muốn sở hữu một chiếc v&iacute; sang trọng m&agrave; kh&ocirc;ng phải chi qu&aacute; nhiều tiền.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc trang nh&atilde;:</strong><br />\n	V&iacute; c&oacute; m&agrave;u sắc trung t&iacute;nh, dễ d&agrave;ng phối hợp với nhiều trang phục kh&aacute;c nhau, từ c&ocirc;ng sở đến dạo phố, tạo n&ecirc;n vẻ ngo&agrave;i thanh lịch v&agrave; tinh tế.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>V&iacute; Da C&aacute; Sấu Nữ Cầm Tay C&uacute;c Bấm 2017 Gi&aacute; Rẻ VCSN17</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự sang trọng, tiện dụng v&agrave; gi&aacute; trị tốt. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế c&uacute;c bấm tiện lợi, chiếc v&iacute; n&agrave;y sẽ l&agrave; điểm nhấn ho&agrave;n hảo trong bộ sưu tập phụ kiện của bạn, gi&uacute;p bạn lu&ocirc;n nổi bật v&agrave; thể hiện phong c&aacute;ch thời trang đẳng cấp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (140, 2, 'Ví cầm tay da cá sấu hình móng tay giá rẻ VCSN18', 'https://tuixachda.net/wp-content/uploads/2017/06/vi-da-ca-sau-cam-tay-mau-nau-sang-trong-vcsn20-300x300.jpg', 2199000, '<h3><strong>V&iacute; Cầm Tay Da C&aacute; Sấu H&igrave;nh M&oacute;ng Tay Gi&aacute; Rẻ VCSN18</strong></h3>\n\n<p><strong>V&iacute; cầm tay da c&aacute; sấu h&igrave;nh m&oacute;ng tay VCSN18</strong> l&agrave; một sản phẩm <strong>gi&aacute; rẻ</strong> nhưng kh&ocirc;ng k&eacute;m phần sang trọng v&agrave; độc đ&aacute;o. Được chế t&aacute;c từ <strong>da c&aacute; sấu cao cấp</strong>, chiếc v&iacute; n&agrave;y mang đến vẻ đẹp tự nhi&ecirc;n v&agrave; nổi bật với c&aacute;c v&acirc;n da c&aacute; sấu đặc trưng. Thiết kế <strong>h&igrave;nh m&oacute;ng tay</strong> độc đ&aacute;o tạo n&ecirc;n một điểm nhấn th&uacute; vị, gi&uacute;p bạn thể hiện phong c&aacute;ch c&aacute; nh&acirc;n đầy ấn tượng. <strong>VCSN18</strong> l&agrave; sự lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự kh&aacute;c biệt v&agrave; sang trọng.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	V&iacute; được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, với c&aacute;c v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o, mang lại vẻ đẹp sang trọng v&agrave; bền bỉ. Da c&aacute; sấu kh&ocirc;ng chỉ đẹp m&agrave; c&ograve;n rất bền, gi&uacute;p chiếc v&iacute; giữ được vẻ đẹp nguy&ecirc;n vẹn theo thời gian.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế h&igrave;nh m&oacute;ng tay độc đ&aacute;o:</strong><br />\n	Điểm nổi bật của chiếc v&iacute; l&agrave; thiết kế <strong>h&igrave;nh m&oacute;ng tay</strong> tinh tế, tạo n&ecirc;n sự kh&aacute;c biệt v&agrave; ấn tượng. Đ&acirc;y l&agrave; một thiết kế đầy s&aacute;ng tạo, gi&uacute;p bạn nổi bật trong đ&aacute;m đ&ocirc;ng v&agrave; thể hiện phong c&aacute;ch c&aacute; nh&acirc;n độc đ&aacute;o.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa tiện dụng:</strong><br />\n	V&iacute; c&oacute; nhiều ngăn chứa th&ocirc;ng minh, gi&uacute;p bạn dễ d&agrave;ng sắp xếp tiền mặt, thẻ t&iacute;n dụng, giấy tờ v&agrave; c&aacute;c vật dụng nhỏ kh&aacute;c một c&aacute;ch gọn g&agrave;ng v&agrave; dễ d&agrave;ng truy cập khi cần.</p>\n	</li>\n	<li>\n	<p><strong>Kh&oacute;a k&eacute;o chắc chắn:</strong><br />\n	V&iacute; được trang bị kh&oacute;a k&eacute;o chất lượng cao, gi&uacute;p bảo vệ đồ đạc của bạn an to&agrave;n, tr&aacute;nh rơi rớt trong qu&aacute; tr&igrave;nh sử dụng.</p>\n	</li>\n	<li>\n	<p><strong>Gi&aacute; cả hợp l&yacute;:</strong><br />\n	Mặc d&ugrave; được l&agrave;m từ <strong>da c&aacute; sấu cao cấp</strong>, <strong>VCSN18</strong> c&oacute; mức gi&aacute; rất hợp l&yacute;, ph&ugrave; hợp với những ai muốn sở hữu một chiếc v&iacute; sang trọng nhưng kh&ocirc;ng phải chi qu&aacute; nhiều tiền.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>V&iacute; Cầm Tay Da C&aacute; Sấu H&igrave;nh M&oacute;ng Tay Gi&aacute; Rẻ VCSN18</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự độc đ&aacute;o v&agrave; sang trọng. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế h&igrave;nh m&oacute;ng tay ấn tượng, chiếc v&iacute; n&agrave;y kh&ocirc;ng chỉ gi&uacute;p bạn bảo vệ đồ đạc m&agrave; c&ograve;n thể hiện phong c&aacute;ch thời trang đẳng cấp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (141, 2, 'Ví da cá sấu cầm tay kéo khóa màu đen đẹp 2017 VCSN19', 'https://tuixachda.net/wp-content/uploads/2017/06/vi-da-ca-sau-cam-tay-keo-khoa-mau-den-dep-2017-vcsn19.jpg', 1299000, '<h3><strong>V&iacute; Da C&aacute; Sấu Cầm Tay K&eacute;o Kh&oacute;a M&agrave;u Đen Đẹp 2017 VCSN19</strong></h3>\n\n<p><strong>V&iacute; da c&aacute; sấu cầm tay k&eacute;o kh&oacute;a m&agrave;u đen đẹp VCSN19</strong> l&agrave; một sản phẩm <strong>sang trọng v&agrave; thời thượng</strong> trong năm 2017. Được chế t&aacute;c từ <strong>da c&aacute; sấu cao cấp</strong>, chiếc v&iacute; n&agrave;y mang đến vẻ đẹp tự nhi&ecirc;n với c&aacute;c v&acirc;n da độc đ&aacute;o, c&ugrave;ng độ bền vượt trội. M&agrave;u đen thanh lịch kết hợp với thiết kế <strong>k&eacute;o kh&oacute;a</strong> tiện dụng, gi&uacute;p bạn dễ d&agrave;ng sử dụng v&agrave; bảo vệ đồ đạc c&aacute; nh&acirc;n một c&aacute;ch an to&agrave;n. <strong>VCSN19</strong> l&agrave; sự lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự sang trọng v&agrave; tinh tế.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	V&iacute; được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n v&agrave; độc đ&aacute;o. Da c&aacute; sấu kh&ocirc;ng chỉ bền m&agrave; c&ograve;n c&oacute; độ b&oacute;ng tự nhi&ecirc;n, gi&uacute;p v&iacute; giữ được vẻ đẹp l&acirc;u d&agrave;i v&agrave; lu&ocirc;n mới mẻ.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế k&eacute;o kh&oacute;a tiện dụng:</strong><br />\n	Với thiết kế <strong>k&eacute;o kh&oacute;a</strong> chắc chắn, v&iacute; gi&uacute;p bạn bảo vệ đồ đạc của m&igrave;nh một c&aacute;ch an to&agrave;n, tr&aacute;nh rơi rớt trong qu&aacute; tr&igrave;nh sử dụng. Kh&oacute;a k&eacute;o dễ d&agrave;ng mở v&agrave; đ&oacute;ng, mang lại sự tiện lợi tối đa khi sử dụng.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc đen thanh lịch:</strong><br />\n	M&agrave;u đen l&agrave; một m&agrave;u sắc rất dễ phối hợp với nhiều loại trang phục kh&aacute;c nhau, từ c&ocirc;ng sở đến dạo phố, tạo n&ecirc;n vẻ ngo&agrave;i thanh lịch v&agrave; tinh tế. M&agrave;u đen cũng gi&uacute;p chiếc v&iacute; trở n&ecirc;n dễ d&agrave;ng kết hợp với nhiều phong c&aacute;ch thời trang kh&aacute;c nhau.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa th&ocirc;ng minh:</strong><br />\n	V&iacute; c&oacute; c&aacute;c ngăn chứa tiện dụng, gi&uacute;p bạn dễ d&agrave;ng sắp xếp tiền mặt, thẻ t&iacute;n dụng, giấy tờ v&agrave; c&aacute;c vật dụng nhỏ kh&aacute;c một c&aacute;ch ngăn nắp v&agrave; dễ d&agrave;ng truy cập khi cần.</p>\n	</li>\n	<li>\n	<p><strong>Gi&aacute; cả hợp l&yacute;:</strong><br />\n	Mặc d&ugrave; được l&agrave;m từ <strong>da c&aacute; sấu cao cấp</strong>, <strong>VCSN19</strong> c&oacute; mức gi&aacute; hợp l&yacute;, ph&ugrave; hợp với những ai muốn sở hữu một chiếc v&iacute; sang trọng m&agrave; kh&ocirc;ng phải chi qu&aacute; nhiều tiền.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>V&iacute; Da C&aacute; Sấu Cầm Tay K&eacute;o Kh&oacute;a M&agrave;u Đen Đẹp 2017 VCSN19</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự sang trọng v&agrave; tiện dụng. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế th&ocirc;ng minh, chiếc v&iacute; n&agrave;y sẽ l&agrave; m&oacute;n phụ kiện kh&ocirc;ng thể thiếu trong bộ sưu tập của bạn, gi&uacute;p bạn lu&ocirc;n nổi bật v&agrave; thể hiện phong c&aacute;ch thời trang đẳng cấp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (142, 2, 'Ví da cá sấu cầm tay màu nâu sang trọng VCSN20', 'https://tuixachda.net/wp-content/uploads/2017/06/vi-da-ca-sau-cam-tay-mau-nau-sang-trong-vcsn20.jpg', 3199000, '<h3><strong>V&iacute; Da C&aacute; Sấu Cầm Tay M&agrave;u N&acirc;u Sang Trọng VCSN20</strong></h3>\n\n<p><strong>V&iacute; da c&aacute; sấu cầm tay m&agrave;u n&acirc;u sang trọng VCSN20</strong> l&agrave; sự kết hợp ho&agrave;n hảo giữa sự sang trọng v&agrave; t&iacute;nh tiện dụng. Được chế t&aacute;c từ <strong>da c&aacute; sấu cao cấp</strong>, chiếc v&iacute; n&agrave;y kh&ocirc;ng chỉ c&oacute; vẻ đẹp tự nhi&ecirc;n với c&aacute;c v&acirc;n da độc đ&aacute;o m&agrave; c&ograve;n mang đến sự bền bỉ v&agrave; độ bền vượt trội. M&agrave;u n&acirc;u thanh lịch của v&iacute; dễ d&agrave;ng kết hợp với nhiều trang phục kh&aacute;c nhau, tạo n&ecirc;n vẻ ngo&agrave;i tinh tế v&agrave; đẳng cấp. <strong>VCSN20</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự sang trọng v&agrave; muốn thể hiện phong c&aacute;ch c&aacute; nh&acirc;n một c&aacute;ch tinh tế.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	V&iacute; được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o, mang lại vẻ đẹp sang trọng v&agrave; bền bỉ. Chất liệu da c&aacute; sấu gi&uacute;p v&iacute; lu&ocirc;n giữ được vẻ đẹp nguy&ecirc;n vẹn theo thời gian.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc n&acirc;u sang trọng:</strong><br />\n	M&agrave;u n&acirc;u của v&iacute; rất dễ phối hợp với nhiều trang phục kh&aacute;c nhau, từ c&ocirc;ng sở đến dạo phố, tạo n&ecirc;n vẻ ngo&agrave;i thanh lịch v&agrave; thời thượng. M&agrave;u sắc n&agrave;y cũng dễ d&agrave;ng kết hợp với c&aacute;c phụ kiện kh&aacute;c, l&agrave;m tăng th&ecirc;m sự nổi bật cho phong c&aacute;ch của bạn.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế tiện dụng:</strong><br />\n	V&iacute; c&oacute; thiết kế cầm tay gọn g&agrave;ng, dễ d&agrave;ng mang theo trong t&uacute;i x&aacute;ch hoặc cầm tay. C&aacute;c ngăn chứa b&ecirc;n trong gi&uacute;p bạn sắp xếp tiền mặt, thẻ t&iacute;n dụng v&agrave; c&aacute;c vật dụng nhỏ kh&aacute;c một c&aacute;ch ngăn nắp v&agrave; tiện lợi.</p>\n	</li>\n	<li>\n	<p><strong>Kh&oacute;a k&eacute;o chắc chắn:</strong><br />\n	V&iacute; được trang bị kh&oacute;a k&eacute;o chất lượng cao, gi&uacute;p bảo vệ đồ đạc của bạn an to&agrave;n, tr&aacute;nh rơi rớt trong qu&aacute; tr&igrave;nh sử dụng. Kh&oacute;a k&eacute;o dễ d&agrave;ng mở v&agrave; đ&oacute;ng, mang lại sự tiện lợi tối đa khi sử dụng.</p>\n	</li>\n	<li>\n	<p><strong>Gi&aacute; cả hợp l&yacute;:</strong><br />\n	D&ugrave; được l&agrave;m từ <strong>da c&aacute; sấu cao cấp</strong>, <strong>VCSN20</strong> c&oacute; mức gi&aacute; rất hợp l&yacute;, ph&ugrave; hợp với nhiều đối tượng kh&aacute;ch h&agrave;ng. Đ&acirc;y l&agrave; sự lựa chọn ho&agrave;n hảo cho những ai muốn sở hữu một chiếc v&iacute; sang trọng nhưng kh&ocirc;ng phải chi qu&aacute; nhiều tiền.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>V&iacute; Da C&aacute; Sấu Cầm Tay M&agrave;u N&acirc;u Sang Trọng VCSN20</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự sang trọng, tiện dụng v&agrave; gi&aacute; trị tốt. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế th&ocirc;ng minh, chiếc v&iacute; n&agrave;y sẽ l&agrave; điểm nhấn ho&agrave;n hảo trong bộ sưu tập phụ kiện của bạn, gi&uacute;p bạn lu&ocirc;n nổi bật v&agrave; thể hiện phong c&aacute;ch thời trang đẳng cấp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (143, 2, 'Mẫu ví nữ dài độc đáo mã WLS18 da cá sấu cao cấp', 'https://lavatino.com/wp-content/uploads/2021/08/mau-vi-dai-nu-doc-dao-wls18-5.jpg', 3511000, '<h3><strong>Mẫu V&iacute; Nữ D&agrave;i Độc Đ&aacute;o M&atilde; WLS18 Da C&aacute; Sấu Cao Cấp</strong></h3>\n\n<p><strong>Mẫu v&iacute; nữ d&agrave;i độc đ&aacute;o m&atilde; WLS18</strong> được l&agrave;m từ <strong>da c&aacute; sấu cao cấp</strong>, l&agrave; sự kết hợp ho&agrave;n hảo giữa sự sang trọng v&agrave; t&iacute;nh tiện dụng. Với thiết kế d&agrave;i, chiếc v&iacute; n&agrave;y kh&ocirc;ng chỉ gi&uacute;p bạn dễ d&agrave;ng sắp xếp tiền mặt, thẻ t&iacute;n dụng, giấy tờ v&agrave; c&aacute;c vật dụng c&aacute; nh&acirc;n m&agrave; c&ograve;n tạo điểm nhấn cho phong c&aacute;ch thời trang của bạn. Da c&aacute; sấu thật, với c&aacute;c v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o, mang đến một sản phẩm vừa bền bỉ vừa đẹp mắt. <strong>WLS18</strong> l&agrave; lựa chọn l&yacute; tưởng cho những qu&yacute; c&ocirc; y&ecirc;u th&iacute;ch sự tinh tế v&agrave; kh&aacute;c biệt.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	Được chế t&aacute;c từ <strong>da c&aacute; sấu thật</strong>, v&iacute; mang đến vẻ đẹp tự nhi&ecirc;n với c&aacute;c v&acirc;n da độc đ&aacute;o, bền bỉ theo thời gian. Da c&aacute; sấu kh&ocirc;ng chỉ đẹp m&agrave; c&ograve;n rất bền, gi&uacute;p v&iacute; lu&ocirc;n giữ được vẻ đẹp nguy&ecirc;n vẹn.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế d&agrave;i tiện dụng:</strong><br />\n	V&iacute; c&oacute; thiết kế d&agrave;i, dễ d&agrave;ng chứa đựng nhiều vật dụng như tiền mặt, thẻ t&iacute;n dụng, giấy tờ, v&agrave; c&aacute;c vật dụng nhỏ kh&aacute;c. Thiết kế n&agrave;y gi&uacute;p bạn tổ chức đồ đạc một c&aacute;ch ngăn nắp v&agrave; dễ d&agrave;ng truy cập khi cần.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc sang trọng:</strong><br />\n	V&iacute; c&oacute; m&agrave;u sắc tinh tế v&agrave; sang trọng, dễ d&agrave;ng kết hợp với nhiều loại trang phục kh&aacute;c nhau. M&agrave;u sắc n&agrave;y gi&uacute;p bạn tạo dựng phong c&aacute;ch thanh lịch v&agrave; đẳng cấp.</p>\n	</li>\n	<li>\n	<p><strong>Kh&oacute;a k&eacute;o chất lượng cao:</strong><br />\n	Với <strong>kh&oacute;a k&eacute;o</strong> chắc chắn, v&iacute; gi&uacute;p bảo vệ đồ đạc của bạn an to&agrave;n, tr&aacute;nh rơi rớt trong qu&aacute; tr&igrave;nh sử dụng. Kh&oacute;a k&eacute;o dễ d&agrave;ng mở v&agrave; đ&oacute;ng, mang lại sự tiện lợi tối đa khi sử dụng.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế nhỏ gọn nhưng tiện lợi:</strong><br />\n	Mặc d&ugrave; c&oacute; thiết kế d&agrave;i, v&iacute; vẫn giữ được sự nhỏ gọn v&agrave; dễ d&agrave;ng mang theo trong t&uacute;i x&aacute;ch hoặc cầm tay. Đ&acirc;y l&agrave; m&oacute;n phụ kiện l&yacute; tưởng cho c&aacute;c qu&yacute; c&ocirc; hiện đại.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>Mẫu V&iacute; Nữ D&agrave;i Độc Đ&aacute;o M&atilde; WLS18 Da C&aacute; Sấu Cao Cấp</strong> l&agrave; lựa chọn ho&agrave;n hảo cho những ai y&ecirc;u th&iacute;ch sự sang trọng v&agrave; tiện dụng. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế d&agrave;i th&ocirc;ng minh, chiếc v&iacute; n&agrave;y sẽ l&agrave; điểm nhấn ho&agrave;n hảo trong bộ sưu tập phụ kiện của bạn, gi&uacute;p bạn lu&ocirc;n nổi bật v&agrave; thể hiện phong c&aacute;ch thời trang đẳng cấp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (144, 2, 'Ví nữ dáng dài da cá sấu chính hãng WLS21', 'https://lavatino.com/wp-content/uploads/2021/08/vi-cam-tay-nu-da-ca-sau-da-bung-mau-do-da-1.jpg', 3299000, '<h3><strong>V&iacute; Nữ D&aacute;ng D&agrave;i Da C&aacute; Sấu Ch&iacute;nh H&atilde;ng WLS21</strong></h3>\n\n<p><strong>V&iacute; nữ d&aacute;ng d&agrave;i da c&aacute; sấu ch&iacute;nh h&atilde;ng WLS21</strong> l&agrave; sản phẩm ho&agrave;n hảo cho những ai y&ecirc;u th&iacute;ch sự sang trọng v&agrave; tinh tế. Được l&agrave;m từ <strong>da c&aacute; sấu ch&iacute;nh h&atilde;ng</strong>, chiếc v&iacute; n&agrave;y mang đến vẻ đẹp tự nhi&ecirc;n với c&aacute;c v&acirc;n da độc đ&aacute;o, thể hiện sự đẳng cấp v&agrave; bền bỉ theo thời gian. Với thiết kế d&aacute;ng d&agrave;i, v&iacute; kh&ocirc;ng chỉ gi&uacute;p bạn sắp xếp tiền mặt, thẻ t&iacute;n dụng, giấy tờ một c&aacute;ch gọn g&agrave;ng m&agrave; c&ograve;n l&agrave; một phụ kiện thời trang đầy ấn tượng. <strong>WLS21</strong> l&agrave; lựa chọn l&yacute; tưởng cho những qu&yacute; c&ocirc; y&ecirc;u th&iacute;ch sự sang trọng v&agrave; hiện đại.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu ch&iacute;nh h&atilde;ng:</strong><br />\n	V&iacute; được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o, mang lại vẻ đẹp sang trọng v&agrave; bền bỉ. Da c&aacute; sấu ch&iacute;nh h&atilde;ng gi&uacute;p v&iacute; lu&ocirc;n giữ được vẻ đẹp nguy&ecirc;n vẹn v&agrave; bền l&acirc;u.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế d&aacute;ng d&agrave;i tiện dụng:</strong><br />\n	Với thiết kế d&aacute;ng d&agrave;i, v&iacute; gi&uacute;p bạn dễ d&agrave;ng sắp xếp tiền mặt, thẻ t&iacute;n dụng, giấy tờ v&agrave; c&aacute;c vật dụng nhỏ kh&aacute;c một c&aacute;ch ngăn nắp v&agrave; tiện lợi. Thiết kế n&agrave;y cũng gi&uacute;p bạn dễ d&agrave;ng mang theo trong t&uacute;i x&aacute;ch hoặc cầm tay.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc sang trọng v&agrave; thanh lịch:</strong><br />\n	V&iacute; c&oacute; m&agrave;u sắc tinh tế, dễ d&agrave;ng kết hợp với nhiều loại trang phục kh&aacute;c nhau. M&agrave;u sắc n&agrave;y gi&uacute;p tạo n&ecirc;n vẻ ngo&agrave;i thanh lịch v&agrave; đẳng cấp, ph&ugrave; hợp cho cả c&ocirc;ng sở v&agrave; c&aacute;c buổi tiệc.</p>\n	</li>\n	<li>\n	<p><strong>Kh&oacute;a k&eacute;o chắc chắn:</strong><br />\n	V&iacute; được trang bị kh&oacute;a k&eacute;o chất lượng cao, gi&uacute;p bảo vệ đồ đạc của bạn an to&agrave;n, tr&aacute;nh rơi rớt trong qu&aacute; tr&igrave;nh sử dụng. Kh&oacute;a k&eacute;o dễ d&agrave;ng mở v&agrave; đ&oacute;ng, mang lại sự tiện lợi tối đa khi sử dụng.</p>\n	</li>\n	<li>\n	<p><strong>Chất lượng vượt trội:</strong><br />\n	Với chất liệu <strong>da c&aacute; sấu ch&iacute;nh h&atilde;ng</strong> v&agrave; thiết kế tỉ mỉ, <strong>WLS21</strong> mang lại sự bền bỉ v&agrave; đẹp mắt, gi&uacute;p bạn sử dụng l&acirc;u d&agrave;i m&agrave; vẫn giữ được vẻ đẹp như mới.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>V&iacute; Nữ D&aacute;ng D&agrave;i Da C&aacute; Sấu Ch&iacute;nh H&atilde;ng WLS21</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự sang trọng, tiện dụng v&agrave; chất lượng vượt trội. Với chất liệu da c&aacute; sấu ch&iacute;nh h&atilde;ng v&agrave; thiết kế d&aacute;ng d&agrave;i th&ocirc;ng minh, chiếc v&iacute; n&agrave;y sẽ l&agrave; m&oacute;n phụ kiện kh&ocirc;ng thể thiếu, gi&uacute;p bạn lu&ocirc;n nổi bật v&agrave; thể hiện phong c&aacute;ch thời trang đẳng cấp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (145, 2, 'Ví nữ da cá sấu 2 dây kéo VNCS904', 'https://bizweb.dktcdn.net/thumb/compact/100/027/341/products/img-7290.jpg?v=1669862745433', 2999000, '<h3><strong>V&iacute; Nữ Da C&aacute; Sấu 2 D&acirc;y K&eacute;o VNCS904</strong></h3>\n\n<p><strong>V&iacute; nữ da c&aacute; sấu 2 d&acirc;y k&eacute;o VNCS904</strong> l&agrave; sự kết hợp ho&agrave;n hảo giữa t&iacute;nh tiện dụng v&agrave; vẻ đẹp sang trọng. Được l&agrave;m từ <strong>da c&aacute; sấu cao cấp</strong>, chiếc v&iacute; n&agrave;y mang đến vẻ đẹp tự nhi&ecirc;n với c&aacute;c v&acirc;n da độc đ&aacute;o, thể hiện sự đẳng cấp v&agrave; độ bền vượt trội. Thiết kế <strong>2 d&acirc;y k&eacute;o</strong> tiện lợi gi&uacute;p bạn dễ d&agrave;ng sắp xếp v&agrave; truy cập c&aacute;c vật dụng c&aacute; nh&acirc;n, tạo sự gọn g&agrave;ng v&agrave; dễ d&agrave;ng sử dụng. <strong>VNCS904</strong> l&agrave; lựa chọn l&yacute; tưởng cho những qu&yacute; c&ocirc; y&ecirc;u th&iacute;ch sự hiện đại v&agrave; tinh tế.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	V&iacute; được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, với c&aacute;c v&acirc;n da tự nhi&ecirc;n đặc biệt, mang lại vẻ đẹp sang trọng v&agrave; độ bền vượt trội. Da c&aacute; sấu kh&ocirc;ng chỉ đẹp m&agrave; c&ograve;n rất bền, gi&uacute;p v&iacute; giữ được vẻ đẹp l&acirc;u d&agrave;i.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế 2 d&acirc;y k&eacute;o tiện dụng:</strong><br />\n	V&iacute; c&oacute; thiết kế <strong>2 d&acirc;y k&eacute;o</strong>, gi&uacute;p bạn dễ d&agrave;ng ph&acirc;n chia v&agrave; sắp xếp c&aacute;c vật dụng c&aacute; nh&acirc;n như tiền mặt, thẻ t&iacute;n dụng, giấy tờ v&agrave; c&aacute;c vật dụng nhỏ kh&aacute;c một c&aacute;ch ngăn nắp v&agrave; tiện lợi. Thiết kế n&agrave;y gi&uacute;p bạn dễ d&agrave;ng truy cập v&agrave;o đồ đạc khi cần.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc thanh lịch:</strong><br />\n	M&agrave;u sắc của v&iacute; rất dễ d&agrave;ng kết hợp với nhiều loại trang phục kh&aacute;c nhau, từ c&ocirc;ng sở đến dạo phố, tạo n&ecirc;n vẻ ngo&agrave;i thanh lịch v&agrave; tinh tế. M&agrave;u sắc n&agrave;y cũng gi&uacute;p chiếc v&iacute; trở n&ecirc;n dễ d&agrave;ng kết hợp với c&aacute;c phụ kiện kh&aacute;c.</p>\n	</li>\n	<li>\n	<p><strong>Kh&oacute;a k&eacute;o chắc chắn:</strong><br />\n	V&iacute; được trang bị <strong>2 kh&oacute;a k&eacute;o chất lượng cao</strong>, gi&uacute;p bảo vệ đồ đạc của bạn an to&agrave;n, tr&aacute;nh rơi rớt trong qu&aacute; tr&igrave;nh sử dụng. Kh&oacute;a k&eacute;o dễ d&agrave;ng mở v&agrave; đ&oacute;ng, mang lại sự tiện lợi tối đa khi sử dụng.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế gọn g&agrave;ng v&agrave; thời trang:</strong><br />\n	V&iacute; c&oacute; thiết kế nhỏ gọn nhưng vẫn đủ kh&ocirc;ng gian để chứa c&aacute;c vật dụng cần thiết. Đ&acirc;y l&agrave; m&oacute;n phụ kiện l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự tiện lợi v&agrave; thời trang.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>V&iacute; Nữ Da C&aacute; Sấu 2 D&acirc;y K&eacute;o VNCS904</strong> l&agrave; lựa chọn ho&agrave;n hảo cho những ai y&ecirc;u th&iacute;ch sự sang trọng, tiện dụng v&agrave; chất lượng vượt trội. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế th&ocirc;ng minh, chiếc v&iacute; n&agrave;y sẽ l&agrave; điểm nhấn ho&agrave;n hảo trong bộ sưu tập phụ kiện của bạn, gi&uacute;p bạn lu&ocirc;n nổi bật v&agrave; thể hiện phong c&aacute;ch thời trang đẳng cấp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (146, 2, 'Ví cầm tay 1 khuôn da cá sấu', 'https://bizweb.dktcdn.net/thumb/compact/100/027/341/products/29a-9cd60c1a-e345-4dae-9688-15207b4f77b2.jpg?v=1551318859157', 3199000, '<h3><strong>V&iacute; Cầm Tay 1 Khu&ocirc;n Da C&aacute; Sấu</strong></h3>\n\n<p><strong>V&iacute; cầm tay 1 khu&ocirc;n da c&aacute; sấu</strong> l&agrave; m&oacute;n phụ kiện sang trọng v&agrave; đẳng cấp, được chế t&aacute;c từ <strong>da c&aacute; sấu cao cấp</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o. Với thiết kế <strong>1 khu&ocirc;n</strong> đơn giản nhưng tinh tế, chiếc v&iacute; n&agrave;y mang đến sự gọn g&agrave;ng, dễ d&agrave;ng sử dụng v&agrave; bảo quản c&aacute;c vật dụng c&aacute; nh&acirc;n. Đ&acirc;y l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự thanh lịch v&agrave; sang trọng trong từng chi tiết.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	V&iacute; được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, mang lại vẻ đẹp tự nhi&ecirc;n v&agrave; bền bỉ theo thời gian. Da c&aacute; sấu kh&ocirc;ng chỉ đẹp m&agrave; c&ograve;n rất chắc chắn, gi&uacute;p v&iacute; giữ được h&igrave;nh d&aacute;ng v&agrave; chất lượng l&acirc;u d&agrave;i.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế 1 khu&ocirc;n đơn giản:</strong><br />\n	Với thiết kế <strong>1 khu&ocirc;n</strong> tối giản nhưng đầy tinh tế, v&iacute; dễ d&agrave;ng cầm tay v&agrave; ph&ugrave; hợp với nhiều phong c&aacute;ch kh&aacute;c nhau. Thiết kế n&agrave;y gi&uacute;p bạn dễ d&agrave;ng mang theo khi đi l&agrave;m, dự tiệc hay đi chơi.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc thanh lịch:</strong><br />\n	V&iacute; c&oacute; m&agrave;u sắc trung t&iacute;nh, dễ d&agrave;ng kết hợp với nhiều loại trang phục, từ trang phục c&ocirc;ng sở đến dạo phố, gi&uacute;p bạn tạo dựng phong c&aacute;ch thanh lịch v&agrave; thời thượng.</p>\n	</li>\n	<li>\n	<p><strong>Ngăn chứa tiện dụng:</strong><br />\n	V&iacute; c&oacute; kh&ocirc;ng gian đủ để chứa tiền mặt, thẻ t&iacute;n dụng, giấy tờ v&agrave; c&aacute;c vật dụng nhỏ kh&aacute;c. Với thiết kế đơn giản, bạn c&oacute; thể dễ d&agrave;ng sắp xếp v&agrave; truy cập c&aacute;c đồ vật cần thiết.</p>\n	</li>\n	<li>\n	<p><strong>Kh&oacute;a k&eacute;o hoặc n&uacute;t bấm chắc chắn:</strong><br />\n	V&iacute; được trang bị kh&oacute;a k&eacute;o hoặc n&uacute;t bấm chất lượng cao, gi&uacute;p bảo vệ đồ đạc của bạn an to&agrave;n, tr&aacute;nh rơi rớt trong qu&aacute; tr&igrave;nh sử dụng.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>V&iacute; Cầm Tay 1 Khu&ocirc;n Da C&aacute; Sấu</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự đơn giản nhưng vẫn muốn thể hiện sự sang trọng. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế th&ocirc;ng minh, chiếc v&iacute; n&agrave;y sẽ l&agrave; điểm nhấn ho&agrave;n hảo trong bộ sưu tập phụ kiện của bạn, gi&uacute;p bạn lu&ocirc;n nổi bật v&agrave; thể hiện phong c&aacute;ch thời trang đẳng cấp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (147, 9, 'Áo khoác da cá sấu S1142a', 'https://www.casauthanhvinh.com/wp-content/uploads/2020/12/ao-da-s1142a-2.jpg', 2679000, '<h3><strong>&Aacute;o Kho&aacute;c Da C&aacute; Sấu S1142a</strong></h3>\n\n<p><strong>&Aacute;o kho&aacute;c da c&aacute; sấu S1142a</strong> l&agrave; một sản phẩm cao cấp, được chế t&aacute;c từ <strong>da c&aacute; sấu thật</strong>, mang lại vẻ ngo&agrave;i sang trọng v&agrave; đẳng cấp. Với thiết kế tinh tế, chiếc &aacute;o kho&aacute;c n&agrave;y kh&ocirc;ng chỉ gi&uacute;p bạn giữ ấm m&agrave; c&ograve;n l&agrave; m&oacute;n phụ kiện thời trang nổi bật, thể hiện phong c&aacute;ch mạnh mẽ v&agrave; c&aacute; t&iacute;nh. <strong>S1142a</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự kh&aacute;c biệt v&agrave; muốn sở hữu một m&oacute;n đồ độc đ&aacute;o, bền bỉ v&agrave; đầy ấn tượng.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	&Aacute;o kho&aacute;c được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o. Da c&aacute; sấu kh&ocirc;ng chỉ đẹp m&agrave; c&ograve;n rất bền, mang đến sự sang trọng v&agrave; độ bền vượt trội theo thời gian.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế thời trang, mạnh mẽ:</strong><br />\n	&Aacute;o kho&aacute;c <strong>S1142a</strong> c&oacute; thiết kế hiện đại v&agrave; đầy c&aacute; t&iacute;nh, với đường may tỉ mỉ, ph&ugrave; hợp với nhiều phong c&aacute;ch kh&aacute;c nhau. Kiểu d&aacute;ng &aacute;o kho&aacute;c gi&uacute;p bạn dễ d&agrave;ng phối hợp với c&aacute;c trang phục kh&aacute;c, từ quần jeans đến quần &acirc;u, tạo n&ecirc;n vẻ ngo&agrave;i mạnh mẽ v&agrave; đẳng cấp.</p>\n	</li>\n	<li>\n	<p><strong>Chắc chắn v&agrave; bền bỉ:</strong><br />\n	Da c&aacute; sấu mang lại sự chắc chắn, bền bỉ, gi&uacute;p &aacute;o kho&aacute;c giữ được h&igrave;nh d&aacute;ng v&agrave; chất lượng l&acirc;u d&agrave;i. Đ&acirc;y l&agrave; m&oacute;n đồ l&yacute; tưởng cho những ai t&igrave;m kiếm một sản phẩm vừa đẹp vừa bền.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc sang trọng:</strong><br />\n	&Aacute;o kho&aacute;c c&oacute; m&agrave;u sắc tinh tế, dễ d&agrave;ng kết hợp với nhiều loại trang phục kh&aacute;c nhau, tạo n&ecirc;n vẻ ngo&agrave;i lịch l&atilde;m v&agrave; thời thượng.</p>\n	</li>\n	<li>\n	<p><strong>Tiện dụng v&agrave; thoải m&aacute;i:</strong><br />\n	Mặc d&ugrave; l&agrave;m từ da c&aacute; sấu, &aacute;o kho&aacute;c vẫn mang lại cảm gi&aacute;c thoải m&aacute;i khi mặc. Với thiết kế vừa vặn, bạn c&oacute; thể dễ d&agrave;ng di chuyển v&agrave; tự tin trong mọi t&igrave;nh huống.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>&Aacute;o Kho&aacute;c Da C&aacute; Sấu S1142a</strong> l&agrave; lựa chọn ho&agrave;n hảo cho những ai y&ecirc;u th&iacute;ch sự sang trọng, mạnh mẽ v&agrave; c&aacute; t&iacute;nh. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế thời trang, chiếc &aacute;o kho&aacute;c n&agrave;y sẽ l&agrave; điểm nhấn kh&ocirc;ng thể thiếu trong bộ sưu tập thời trang của bạn, gi&uacute;p bạn lu&ocirc;n nổi bật v&agrave; thể hiện phong c&aacute;ch đẳng cấp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (148, 9, 'Áo khoác da cá sấu S1141a', 'https://www.casauthanhvinh.com/wp-content/uploads/2020/12/ao-da-s1141a-1.jpg', 3219000, '<p><strong>&Aacute;o kho&aacute;c da c&aacute; sấu S1141a</strong> l&agrave; một sản phẩm cao cấp, được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, mang đến vẻ ngo&agrave;i sang trọng v&agrave; đẳng cấp. Với thiết kế tinh tế v&agrave; hiện đại, chiếc &aacute;o kho&aacute;c n&agrave;y kh&ocirc;ng chỉ gi&uacute;p bạn giữ ấm m&agrave; c&ograve;n l&agrave; một m&oacute;n đồ thời trang nổi bật, thể hiện phong c&aacute;ch mạnh mẽ v&agrave; c&aacute; t&iacute;nh. <strong>S1141a</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự độc đ&aacute;o v&agrave; muốn sở hữu một m&oacute;n đồ vừa bền bỉ vừa ấn tượng.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	&Aacute;o kho&aacute;c được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o, mang lại vẻ đẹp sang trọng v&agrave; bền bỉ theo thời gian. Da c&aacute; sấu kh&ocirc;ng chỉ đẹp m&agrave; c&ograve;n rất chắc chắn, gi&uacute;p &aacute;o kho&aacute;c giữ được h&igrave;nh d&aacute;ng v&agrave; chất lượng l&acirc;u d&agrave;i.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế hiện đại v&agrave; mạnh mẽ:</strong><br />\n	&Aacute;o kho&aacute;c <strong>S1141a</strong> c&oacute; thiết kế đầy c&aacute; t&iacute;nh v&agrave; hiện đại, với đường may tỉ mỉ v&agrave; kiểu d&aacute;ng ph&ugrave; hợp với nhiều phong c&aacute;ch kh&aacute;c nhau. Bạn c&oacute; thể dễ d&agrave;ng kết hợp &aacute;o kho&aacute;c với nhiều loại trang phục, từ quần jeans đến quần &acirc;u, tạo n&ecirc;n một vẻ ngo&agrave;i lịch l&atilde;m v&agrave; mạnh mẽ.</p>\n	</li>\n	<li>\n	<p><strong>Độ bền vượt trội:</strong><br />\n	Da c&aacute; sấu mang lại sự chắc chắn, bền bỉ, gi&uacute;p &aacute;o kho&aacute;c lu&ocirc;n giữ được vẻ đẹp v&agrave; độ bền theo thời gian. Đ&acirc;y l&agrave; m&oacute;n đồ l&yacute; tưởng cho những ai t&igrave;m kiếm sự sang trọng v&agrave; l&acirc;u d&agrave;i.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc sang trọng v&agrave; dễ phối đồ:</strong><br />\n	&Aacute;o kho&aacute;c c&oacute; m&agrave;u sắc tinh tế v&agrave; dễ d&agrave;ng kết hợp với nhiều loại trang phục kh&aacute;c nhau, từ c&ocirc;ng sở đến dạo phố, tạo n&ecirc;n phong c&aacute;ch thanh lịch v&agrave; đẳng cấp.</p>\n	</li>\n	<li>\n	<p><strong>Tiện dụng v&agrave; thoải m&aacute;i:</strong><br />\n	Mặc d&ugrave; l&agrave;m từ da c&aacute; sấu, &aacute;o kho&aacute;c vẫn mang lại cảm gi&aacute;c thoải m&aacute;i khi mặc. Với thiết kế vừa vặn, bạn c&oacute; thể dễ d&agrave;ng di chuyển v&agrave; tự tin trong mọi t&igrave;nh huống.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>&Aacute;o Kho&aacute;c Da C&aacute; Sấu S1141a</strong> l&agrave; lựa chọn ho&agrave;n hảo cho những ai y&ecirc;u th&iacute;ch sự sang trọng, mạnh mẽ v&agrave; c&aacute; t&iacute;nh. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế thời trang, chiếc &aacute;o kho&aacute;c n&agrave;y sẽ l&agrave; điểm nhấn kh&ocirc;ng thể thiếu trong bộ sưu tập thời trang của bạn, gi&uacute;p bạn lu&ocirc;n nổi bật v&agrave; thể hiện phong c&aacute;ch đẳng cấp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (149, 9, 'Áo khoác da cá sấu S1143a', 'https://www.casauthanhvinh.com/wp-content/uploads/2020/12/ao-da-s1143a-1.jpg', 1569000, '<p><strong>&Aacute;o kho&aacute;c da c&aacute; sấu S1143a</strong> l&agrave; một sản phẩm đẳng cấp, được l&agrave;m từ <strong>da c&aacute; sấu cao cấp</strong>, mang lại vẻ ngo&agrave;i sang trọng v&agrave; mạnh mẽ. Với thiết kế tinh tế v&agrave; hiện đại, chiếc &aacute;o kho&aacute;c n&agrave;y kh&ocirc;ng chỉ gi&uacute;p bạn giữ ấm trong những ng&agrave;y lạnh m&agrave; c&ograve;n l&agrave; một m&oacute;n phụ kiện thời trang nổi bật, thể hiện phong c&aacute;ch c&aacute; t&iacute;nh v&agrave; lịch l&atilde;m. <strong>S1143a</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự độc đ&aacute;o v&agrave; muốn sở hữu một sản phẩm bền bỉ, sang trọng.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu cao cấp:</strong><br />\n	&Aacute;o kho&aacute;c được chế t&aacute;c từ <strong>da c&aacute; sấu thật</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n v&agrave; độc đ&aacute;o, mang lại vẻ đẹp sang trọng v&agrave; bền bỉ. Da c&aacute; sấu kh&ocirc;ng chỉ mang đến vẻ đẹp tự nhi&ecirc;n m&agrave; c&ograve;n rất chắc chắn, gi&uacute;p &aacute;o kho&aacute;c giữ được chất lượng l&acirc;u d&agrave;i.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế hiện đại v&agrave; c&aacute; t&iacute;nh:</strong><br />\n	<strong>S1143a</strong> sở hữu thiết kế mạnh mẽ, ph&ugrave; hợp với những ai y&ecirc;u th&iacute;ch sự c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch thời trang đẳng cấp. Kiểu d&aacute;ng &aacute;o kho&aacute;c dễ d&agrave;ng kết hợp với nhiều trang phục kh&aacute;c nhau, từ quần jeans đến quần &acirc;u, tạo n&ecirc;n một phong c&aacute;ch lịch l&atilde;m, mạnh mẽ v&agrave; đầy cuốn h&uacute;t.</p>\n	</li>\n	<li>\n	<p><strong>Độ bền vượt trội:</strong><br />\n	Với chất liệu <strong>da c&aacute; sấu</strong>, &aacute;o kho&aacute;c kh&ocirc;ng chỉ bền bỉ m&agrave; c&ograve;n giữ được vẻ đẹp tự nhi&ecirc;n qua thời gian. Đ&acirc;y l&agrave; một sản phẩm l&yacute; tưởng cho những ai t&igrave;m kiếm một m&oacute;n đồ vừa đẹp vừa bền.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc sang trọng v&agrave; dễ phối đồ:</strong><br />\n	&Aacute;o kho&aacute;c c&oacute; m&agrave;u sắc tinh tế v&agrave; dễ d&agrave;ng kết hợp với nhiều loại trang phục kh&aacute;c nhau, từ c&ocirc;ng sở đến dạo phố. M&agrave;u sắc n&agrave;y mang đến vẻ ngo&agrave;i thanh lịch, ph&ugrave; hợp với nhiều ho&agrave;n cảnh kh&aacute;c nhau.</p>\n	</li>\n	<li>\n	<p><strong>Tiện dụng v&agrave; thoải m&aacute;i:</strong><br />\n	Mặc d&ugrave; l&agrave;m từ da c&aacute; sấu, &aacute;o kho&aacute;c vẫn mang lại cảm gi&aacute;c thoải m&aacute;i khi mặc. Thiết kế vừa vặn gi&uacute;p bạn dễ d&agrave;ng di chuyển, đồng thời giữ ấm tốt trong những ng&agrave;y se lạnh.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>&Aacute;o Kho&aacute;c Da C&aacute; Sấu S1143a</strong> l&agrave; lựa chọn ho&agrave;n hảo cho những ai y&ecirc;u th&iacute;ch sự sang trọng, mạnh mẽ v&agrave; c&aacute; t&iacute;nh. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế thời trang, chiếc &aacute;o kho&aacute;c n&agrave;y sẽ l&agrave; điểm nhấn kh&ocirc;ng thể thiếu trong bộ sưu tập thời trang của bạn, gi&uacute;p bạn lu&ocirc;n nổi bật v&agrave; thể hiện phong c&aacute;ch đẳng cấp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (150, 9, 'Áo Da Cá Sấu Nam Phối Da Bò ACS02', 'https://tuidacasau.vn/images/2018/01/ao-da-ca-sau-nam-acs02.jpg', 3296000, '<p><strong>&Aacute;o Da C&aacute; Sấu Nam Phối Da B&ograve; ACS02</strong> l&agrave; một sản phẩm cao cấp, kết hợp giữa <strong>da c&aacute; sấu</strong> v&agrave; <strong>da b&ograve;</strong> chất lượng, mang đến vẻ ngo&agrave;i mạnh mẽ, sang trọng v&agrave; đầy c&aacute; t&iacute;nh. Với thiết kế tinh tế, chiếc &aacute;o n&agrave;y kh&ocirc;ng chỉ gi&uacute;p bạn giữ ấm m&agrave; c&ograve;n l&agrave; một m&oacute;n đồ thời trang độc đ&aacute;o, thể hiện phong c&aacute;ch đẳng cấp v&agrave; sự kh&aacute;c biệt. <strong>ACS02</strong> l&agrave; lựa chọn ho&agrave;n hảo cho những ai y&ecirc;u th&iacute;ch sự kết hợp ho&agrave;n hảo giữa hai chất liệu da cao cấp.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu v&agrave; da b&ograve; cao cấp:</strong><br />\n	&Aacute;o kho&aacute;c được l&agrave;m từ <strong>da c&aacute; sấu thật</strong> kết hợp với <strong>da b&ograve;</strong> chất lượng, mang lại sự bền bỉ, chắc chắn v&agrave; vẻ đẹp tự nhi&ecirc;n. Da c&aacute; sấu nổi bật với c&aacute;c v&acirc;n độc đ&aacute;o, trong khi da b&ograve; gi&uacute;p tạo sự mềm mại, thoải m&aacute;i khi mặc.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế phối hợp tinh tế:</strong><br />\n	<strong>ACS02</strong> sở hữu thiết kế tinh tế, kết hợp ho&agrave;n hảo giữa hai loại da, tạo n&ecirc;n sự độc đ&aacute;o v&agrave; kh&aacute;c biệt. &Aacute;o kho&aacute;c c&oacute; đường may sắc sảo, mang đến vẻ ngo&agrave;i lịch l&atilde;m v&agrave; đầy c&aacute; t&iacute;nh.</p>\n	</li>\n	<li>\n	<p><strong>Độ bền vượt trội:</strong><br />\n	Với sự kết hợp giữa <strong>da c&aacute; sấu</strong> v&agrave; <strong>da b&ograve;</strong>, &aacute;o kho&aacute;c kh&ocirc;ng chỉ bền bỉ m&agrave; c&ograve;n giữ được vẻ đẹp tự nhi&ecirc;n v&agrave; độ bền l&acirc;u d&agrave;i, l&agrave; m&oacute;n đồ l&yacute; tưởng cho những ai t&igrave;m kiếm một sản phẩm cao cấp v&agrave; bền vững.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc sang trọng, dễ phối đồ:</strong><br />\n	&Aacute;o kho&aacute;c c&oacute; m&agrave;u sắc tinh tế, dễ d&agrave;ng kết hợp với nhiều loại trang phục kh&aacute;c nhau. M&agrave;u sắc n&agrave;y mang đến vẻ ngo&agrave;i lịch l&atilde;m v&agrave; phong c&aacute;ch thời thượng, ph&ugrave; hợp cho cả những dịp c&ocirc;ng sở v&agrave; dạo phố.</p>\n	</li>\n	<li>\n	<p><strong>Tiện dụng v&agrave; thoải m&aacute;i:</strong><br />\n	&Aacute;o kho&aacute;c được thiết kế với kiểu d&aacute;ng vừa vặn, gi&uacute;p bạn dễ d&agrave;ng di chuyển v&agrave; tạo cảm gi&aacute;c thoải m&aacute;i khi mặc. Chất liệu da mềm mại kết hợp với thiết kế th&ocirc;ng minh gi&uacute;p bạn lu&ocirc;n cảm thấy dễ chịu, d&ugrave; l&agrave; trong m&ocirc;i trường c&ocirc;ng sở hay trong những buổi tiệc.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>&Aacute;o Da C&aacute; Sấu Nam Phối Da B&ograve; ACS02</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự sang trọng, mạnh mẽ v&agrave; độc đ&aacute;o. Với sự kết hợp ho&agrave;n hảo giữa <strong>da c&aacute; sấu</strong> v&agrave; <strong>da b&ograve;</strong>, chiếc &aacute;o n&agrave;y sẽ l&agrave; điểm nhấn nổi bật trong bộ sưu tập thời trang của bạn, gi&uacute;p bạn lu&ocirc;n tự tin v&agrave; thể hiện phong c&aacute;ch đẳng cấp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (151, 9, 'Áo Khoác Da Cá Sấu Thật Cho Nam ACS01', 'https://tuidacasau.vn/images/2018/01/ao-khoac-da-ca-sau-cho-nam-acs01.jpg', 3899000, '<p><strong>&Aacute;o Kho&aacute;c Da C&aacute; Sấu Thật Cho Nam ACS01</strong> l&agrave; một sản phẩm thời trang cao cấp, được chế t&aacute;c từ <strong>da c&aacute; sấu thật</strong>, mang lại vẻ ngo&agrave;i sang trọng v&agrave; mạnh mẽ. Với thiết kế tinh tế v&agrave; phong c&aacute;ch hiện đại, chiếc &aacute;o kho&aacute;c n&agrave;y kh&ocirc;ng chỉ gi&uacute;p bạn giữ ấm m&agrave; c&ograve;n l&agrave; một m&oacute;n đồ thời trang đẳng cấp, thể hiện sự tự tin v&agrave; c&aacute; t&iacute;nh. <strong>ACS01</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự kh&aacute;c biệt v&agrave; muốn sở hữu một m&oacute;n đồ vừa bền bỉ vừa nổi bật.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu thật cao cấp:</strong><br />\n	&Aacute;o kho&aacute;c được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o, mang lại vẻ đẹp sang trọng v&agrave; bền bỉ. Da c&aacute; sấu kh&ocirc;ng chỉ đẹp m&agrave; c&ograve;n rất chắc chắn, gi&uacute;p &aacute;o kho&aacute;c giữ được chất lượng l&acirc;u d&agrave;i v&agrave; vẻ ngo&agrave;i lu&ocirc;n mới mẻ.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế hiện đại, mạnh mẽ:</strong><br />\n	<strong>ACS01</strong> sở hữu thiết kế đầy c&aacute; t&iacute;nh v&agrave; mạnh mẽ, với đường may tỉ mỉ v&agrave; kiểu d&aacute;ng ph&ugrave; hợp với nhiều phong c&aacute;ch kh&aacute;c nhau. &Aacute;o kho&aacute;c n&agrave;y dễ d&agrave;ng kết hợp với c&aacute;c trang phục kh&aacute;c, từ quần jeans đến quần &acirc;u, gi&uacute;p bạn tạo dựng một phong c&aacute;ch thời trang đẳng cấp v&agrave; lịch l&atilde;m.</p>\n	</li>\n	<li>\n	<p><strong>Độ bền vượt trội:</strong><br />\n	Da c&aacute; sấu mang lại sự chắc chắn v&agrave; độ bền cao, gi&uacute;p &aacute;o kho&aacute;c giữ được h&igrave;nh d&aacute;ng v&agrave; chất lượng l&acirc;u d&agrave;i. Đ&acirc;y l&agrave; m&oacute;n đồ l&yacute; tưởng cho những ai t&igrave;m kiếm sự sang trọng v&agrave; bền bỉ trong một sản phẩm.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc sang trọng v&agrave; dễ phối đồ:</strong><br />\n	&Aacute;o kho&aacute;c c&oacute; m&agrave;u sắc tinh tế v&agrave; dễ d&agrave;ng kết hợp với nhiều loại trang phục kh&aacute;c nhau. M&agrave;u sắc n&agrave;y mang đến vẻ ngo&agrave;i thanh lịch v&agrave; đẳng cấp, ph&ugrave; hợp cho cả những dịp c&ocirc;ng sở hay dạo phố.</p>\n	</li>\n	<li>\n	<p><strong>Tiện dụng v&agrave; thoải m&aacute;i:</strong><br />\n	Mặc d&ugrave; l&agrave;m từ da c&aacute; sấu, &aacute;o kho&aacute;c vẫn mang lại cảm gi&aacute;c thoải m&aacute;i khi mặc. Thiết kế vừa vặn gi&uacute;p bạn dễ d&agrave;ng di chuyển v&agrave; tự tin trong mọi t&igrave;nh huống.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>&Aacute;o Kho&aacute;c Da C&aacute; Sấu Thật Cho Nam ACS01</strong> l&agrave; lựa chọn ho&agrave;n hảo cho những ai y&ecirc;u th&iacute;ch sự sang trọng, mạnh mẽ v&agrave; c&aacute; t&iacute;nh. Với chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế thời trang, chiếc &aacute;o kho&aacute;c n&agrave;y sẽ l&agrave; điểm nhấn kh&ocirc;ng thể thiếu trong bộ sưu tập thời trang của bạn, gi&uacute;p bạn lu&ocirc;n nổi bật v&agrave; thể hiện phong c&aacute;ch đẳng cấp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (152, 9, 'Áo Khoác Da Cá Sấu Thật ACS03', 'https://tuidacasau.vn/images/2018/01/ao-khoac-da-ca-sau-that-acs03.jpg', 6579000, '<p><strong>&Aacute;o Kho&aacute;c Da C&aacute; Sấu Thật ACS03</strong> l&agrave; một sản phẩm thời trang cao cấp, được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, mang đến vẻ ngo&agrave;i mạnh mẽ, sang trọng v&agrave; đầy c&aacute; t&iacute;nh. Với thiết kế tinh tế v&agrave; chất liệu da cao cấp, chiếc &aacute;o kho&aacute;c n&agrave;y kh&ocirc;ng chỉ gi&uacute;p bạn giữ ấm trong những ng&agrave;y lạnh m&agrave; c&ograve;n l&agrave; một m&oacute;n đồ thời trang nổi bật, thể hiện phong c&aacute;ch đẳng cấp v&agrave; sự kh&aacute;c biệt. <strong>ACS03</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự độc đ&aacute;o v&agrave; muốn sở hữu một sản phẩm bền bỉ, sang trọng.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu thật cao cấp:</strong><br />\n	&Aacute;o kho&aacute;c được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o, mang lại vẻ đẹp sang trọng v&agrave; bền bỉ. Da c&aacute; sấu kh&ocirc;ng chỉ đẹp m&agrave; c&ograve;n rất chắc chắn, gi&uacute;p &aacute;o kho&aacute;c giữ được chất lượng l&acirc;u d&agrave;i v&agrave; vẻ ngo&agrave;i lu&ocirc;n mới mẻ.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế thời trang, mạnh mẽ:</strong><br />\n	<strong>ACS03</strong> sở hữu thiết kế hiện đại v&agrave; đầy c&aacute; t&iacute;nh, với đường may tỉ mỉ v&agrave; kiểu d&aacute;ng ph&ugrave; hợp với nhiều phong c&aacute;ch kh&aacute;c nhau. &Aacute;o kho&aacute;c n&agrave;y dễ d&agrave;ng kết hợp với c&aacute;c trang phục từ quần jeans đến quần &acirc;u, tạo n&ecirc;n phong c&aacute;ch lịch l&atilde;m, mạnh mẽ v&agrave; đẳng cấp.</p>\n	</li>\n	<li>\n	<p><strong>Độ bền vượt trội:</strong><br />\n	Da c&aacute; sấu mang lại sự chắc chắn v&agrave; độ bền cao, gi&uacute;p &aacute;o kho&aacute;c lu&ocirc;n giữ được h&igrave;nh d&aacute;ng v&agrave; chất lượng theo thời gian. Đ&acirc;y l&agrave; m&oacute;n đồ l&yacute; tưởng cho những ai t&igrave;m kiếm sự sang trọng v&agrave; bền bỉ trong một sản phẩm.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc sang trọng v&agrave; dễ phối đồ:</strong><br />\n	&Aacute;o kho&aacute;c c&oacute; m&agrave;u sắc tinh tế, dễ d&agrave;ng kết hợp với nhiều loại trang phục kh&aacute;c nhau. M&agrave;u sắc n&agrave;y mang đến vẻ ngo&agrave;i thanh lịch, ph&ugrave; hợp cho nhiều dịp, từ c&ocirc;ng sở đến dạo phố.</p>\n	</li>\n	<li>\n	<p><strong>Tiện dụng v&agrave; thoải m&aacute;i:</strong><br />\n	Mặc d&ugrave; l&agrave;m từ da c&aacute; sấu, &aacute;o kho&aacute;c vẫn mang lại cảm gi&aacute;c thoải m&aacute;i khi mặc. Thiết kế vừa vặn gi&uacute;p bạn dễ d&agrave;ng di chuyển v&agrave; tự tin trong mọi t&igrave;nh huống.</p>\n	</li>\n</ul>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (153, 9, 'Áo Khoác Da Cá Sấu Nam Có Mũ Trùm Đầu ACS05', 'https://tuidacasau.vn/images/2018/01/ao-khoac-da-ca-sau-nam-co-mu-trum-dau-acs05.jpg', 5299000, '<h3><strong>&Aacute;o Kho&aacute;c Da C&aacute; Sấu Nam C&oacute; Mũ Tr&ugrave;m Đầu ACS05</strong></h3>\n\n<p><strong>&Aacute;o Kho&aacute;c Da C&aacute; Sấu Nam C&oacute; Mũ Tr&ugrave;m Đầu ACS05</strong> l&agrave; sự kết hợp ho&agrave;n hảo giữa chất liệu da c&aacute; sấu cao cấp v&agrave; thiết kế hiện đại, mang đến vẻ ngo&agrave;i mạnh mẽ, sang trọng v&agrave; đầy c&aacute; t&iacute;nh. Với mũ tr&ugrave;m đầu tiện dụng, chiếc &aacute;o kho&aacute;c n&agrave;y kh&ocirc;ng chỉ gi&uacute;p bạn giữ ấm m&agrave; c&ograve;n tạo n&ecirc;n phong c&aacute;ch thời trang đẳng cấp, ph&ugrave; hợp cho những ng&agrave;y lạnh v&agrave; c&aacute;c dịp đặc biệt. <strong>ACS05</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự độc đ&aacute;o v&agrave; muốn sở hữu một m&oacute;n đồ vừa bền bỉ, vừa thời thượng.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu thật cao cấp:</strong><br />\n	&Aacute;o kho&aacute;c được chế t&aacute;c từ <strong>da c&aacute; sấu thật</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n v&agrave; độc đ&aacute;o, mang lại vẻ đẹp sang trọng, bền bỉ v&agrave; cực kỳ ấn tượng. Da c&aacute; sấu kh&ocirc;ng chỉ đẹp m&agrave; c&ograve;n rất chắc chắn, gi&uacute;p &aacute;o kho&aacute;c giữ được chất lượng l&acirc;u d&agrave;i v&agrave; vẻ ngo&agrave;i lu&ocirc;n mới mẻ.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế với mũ tr&ugrave;m đầu tiện dụng:</strong><br />\n	<strong>ACS05</strong> c&oacute; mũ tr&ugrave;m đầu, gi&uacute;p bảo vệ bạn khỏi gi&oacute; lạnh trong những ng&agrave;y đ&ocirc;ng. Mũ được thiết kế vừa vặn, dễ d&agrave;ng điều chỉnh v&agrave; mang lại sự tiện lợi khi sử dụng.</p>\n	</li>\n	<li>\n	<p><strong>Phong c&aacute;ch hiện đại, mạnh mẽ:</strong><br />\n	&Aacute;o kho&aacute;c sở hữu thiết kế đầy c&aacute; t&iacute;nh, mạnh mẽ v&agrave; lịch l&atilde;m, ph&ugrave; hợp với nhiều phong c&aacute;ch kh&aacute;c nhau. Kiểu d&aacute;ng &aacute;o kho&aacute;c n&agrave;y dễ d&agrave;ng kết hợp với c&aacute;c trang phục kh&aacute;c, từ quần jeans đến quần &acirc;u, gi&uacute;p bạn tạo dựng một phong c&aacute;ch thời trang đẳng cấp.</p>\n	</li>\n	<li>\n	<p><strong>Độ bền vượt trội:</strong><br />\n	Da c&aacute; sấu mang lại sự chắc chắn v&agrave; độ bền cao, gi&uacute;p &aacute;o kho&aacute;c lu&ocirc;n giữ được h&igrave;nh d&aacute;ng v&agrave; chất lượng qua thời gian. Đ&acirc;y l&agrave; m&oacute;n đồ l&yacute; tưởng cho những ai t&igrave;m kiếm một sản phẩm bền bỉ v&agrave; sang trọng.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc dễ phối đồ:</strong><br />\n	&Aacute;o kho&aacute;c c&oacute; m&agrave;u sắc tinh tế v&agrave; dễ d&agrave;ng kết hợp với nhiều loại trang phục kh&aacute;c nhau. M&agrave;u sắc n&agrave;y mang đến vẻ ngo&agrave;i thanh lịch v&agrave; đẳng cấp, ph&ugrave; hợp cho nhiều dịp, từ c&ocirc;ng sở đến dạo phố.</p>\n	</li>\n	<li>\n	<p><strong>Tiện dụng v&agrave; thoải m&aacute;i:</strong><br />\n	Mặc d&ugrave; l&agrave;m từ da c&aacute; sấu, &aacute;o kho&aacute;c vẫn mang lại cảm gi&aacute;c thoải m&aacute;i khi mặc. Thiết kế vừa vặn gi&uacute;p bạn dễ d&agrave;ng di chuyển v&agrave; tự tin trong mọi t&igrave;nh huống.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>&Aacute;o Kho&aacute;c Da C&aacute; Sấu Nam C&oacute; Mũ Tr&ugrave;m Đầu ACS05</strong> l&agrave; lựa chọn ho&agrave;n hảo cho những ai y&ecirc;u th&iacute;ch sự sang trọng, mạnh mẽ v&agrave; c&aacute; t&iacute;nh. Với chất liệu da c&aacute; sấu cao cấp, thiết kế hiện đại v&agrave; mũ tr&ugrave;m đầu tiện dụng, chiếc &aacute;o kho&aacute;c n&agrave;y sẽ l&agrave; điểm nhấn kh&ocirc;ng thể thiếu trong bộ sưu tập thời trang của bạn, gi&uacute;p bạn lu&ocirc;n nổi bật v&agrave; thể hiện phong c&aacute;ch đẳng cấp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (154, 10, 'Giày lười da cá sấu cao cấp dành cho nam – GD016', 'https://casauhoanglong.com/wp-content/uploads/2024/09/giay-ca-sau-GD016-6-600x820.jpeg', 4699000, '<h3><strong>Gi&agrave;y Lười Da C&aacute; Sấu Cao Cấp D&agrave;nh Cho Nam &ndash; GD016</strong></h3>\n\n<p><strong>Gi&agrave;y Lười Da C&aacute; Sấu Cao Cấp D&agrave;nh Cho Nam &ndash; GD016</strong> l&agrave; sự kết hợp ho&agrave;n hảo giữa sự sang trọng v&agrave; tiện dụng, được chế t&aacute;c từ <strong>da c&aacute; sấu thật</strong> cao cấp, mang đến cho bạn một sản phẩm thời trang đẳng cấp, bền bỉ v&agrave; cực kỳ ấn tượng. Với thiết kế gi&agrave;y lười tiện lợi, bạn c&oacute; thể dễ d&agrave;ng kết hợp với nhiều phong c&aacute;ch kh&aacute;c nhau, từ c&ocirc;ng sở đến dạo phố, tạo n&ecirc;n vẻ ngo&agrave;i lịch l&atilde;m v&agrave; phong c&aacute;ch.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu thật cao cấp:</strong><br />\n	Gi&agrave;y lười GD016 được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, mang lại vẻ ngo&agrave;i sang trọng v&agrave; bền bỉ. C&aacute;c v&acirc;n da tự nhi&ecirc;n của c&aacute; sấu kh&ocirc;ng chỉ tạo n&ecirc;n vẻ đẹp độc đ&aacute;o m&agrave; c&ograve;n gi&uacute;p sản phẩm giữ được chất lượng l&acirc;u d&agrave;i.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế gi&agrave;y lười tiện dụng:</strong><br />\n	Với kiểu d&aacute;ng gi&agrave;y lười, GD016 mang đến sự tiện lợi v&agrave; thoải m&aacute;i cho người sử dụng. Bạn kh&ocirc;ng cần phải lo lắng về d&acirc;y gi&agrave;y, chỉ cần xỏ ch&acirc;n v&agrave;o l&agrave; c&oacute; thể tự tin ra ngo&agrave;i với phong c&aacute;ch lịch l&atilde;m, hiện đại.</p>\n	</li>\n	<li>\n	<p><strong>Độ bền vượt trội:</strong><br />\n	Da c&aacute; sấu nổi bật với độ bền cao, gi&uacute;p đ&ocirc;i gi&agrave;y giữ được h&igrave;nh d&aacute;ng v&agrave; chất lượng qua thời gian. Đ&acirc;y l&agrave; lựa chọn l&yacute; tưởng cho những ai t&igrave;m kiếm một sản phẩm vừa đẹp vừa bền.</p>\n	</li>\n	<li>\n	<p><strong>Phong c&aacute;ch thời trang đẳng cấp:</strong><br />\n	Với thiết kế tinh tế v&agrave; m&agrave;u sắc sang trọng, gi&agrave;y lười GD016 dễ d&agrave;ng kết hợp với nhiều trang phục kh&aacute;c nhau. Từ bộ đồ c&ocirc;ng sở cho đến trang phục dạo phố, đ&ocirc;i gi&agrave;y n&agrave;y sẽ gi&uacute;p bạn thể hiện phong c&aacute;ch thời trang đẳng cấp v&agrave; lịch l&atilde;m.</p>\n	</li>\n	<li>\n	<p><strong>Tiện dụng v&agrave; thoải m&aacute;i:</strong><br />\n	Được thiết kế để mang lại cảm gi&aacute;c thoải m&aacute;i khi di chuyển, gi&agrave;y lười GD016 kh&ocirc;ng chỉ dễ mang m&agrave; c&ograve;n rất nhẹ nh&agrave;ng, gi&uacute;p bạn tự tin v&agrave; thoải m&aacute;i trong suốt cả ng&agrave;y d&agrave;i.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>Gi&agrave;y Lười Da C&aacute; Sấu Cao Cấp D&agrave;nh Cho Nam &ndash; GD016</strong> l&agrave; lựa chọn ho&agrave;n hảo cho những ai y&ecirc;u th&iacute;ch sự sang trọng, bền bỉ v&agrave; tiện dụng. Với chất liệu da c&aacute; sấu cao cấp, thiết kế thời trang v&agrave; độ bền vượt trội, đ&ocirc;i gi&agrave;y n&agrave;y sẽ l&agrave; m&oacute;n đồ kh&ocirc;ng thể thiếu trong bộ sưu tập thời trang của bạn, gi&uacute;p bạn lu&ocirc;n nổi bật v&agrave; thể hiện phong c&aacute;ch đẳng cấp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (155, 10, 'Giày da cá sấu nam màu thủ công thời trang – GD013', 'https://casauhoanglong.com/wp-content/uploads/2023/12/giay-ca-sau-nhuom-thu-cong-GD013-600x758.jpeg', 4129000, '<h3><strong>Gi&agrave;y Da C&aacute; Sấu Nam M&agrave;u Thủ C&ocirc;ng Thời Trang &ndash; GD013</strong></h3>\n\n<p><strong>Gi&agrave;y Da C&aacute; Sấu Nam M&agrave;u Thủ C&ocirc;ng Thời Trang &ndash; GD013</strong> l&agrave; sự lựa chọn ho&agrave;n hảo cho những qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch sự sang trọng, tinh tế v&agrave; kh&aacute;c biệt. Được chế t&aacute;c từ <strong>da c&aacute; sấu thật</strong>, đ&ocirc;i gi&agrave;y n&agrave;y kh&ocirc;ng chỉ mang lại vẻ đẹp nổi bật m&agrave; c&ograve;n thể hiện đẳng cấp thời trang. Với m&agrave;u sắc thủ c&ocirc;ng độc đ&aacute;o, GD013 tạo n&ecirc;n một phong c&aacute;ch mạnh mẽ, lịch l&atilde;m, ph&ugrave; hợp với những dịp đặc biệt v&agrave; cuộc sống h&agrave;ng ng&agrave;y.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu thủ c&ocirc;ng cao cấp:</strong><br />\n	Gi&agrave;y GD013 được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, được nhuộm thủ c&ocirc;ng với m&agrave;u sắc độc đ&aacute;o, mang lại vẻ đẹp tự nhi&ecirc;n v&agrave; sang trọng. C&aacute;c v&acirc;n da c&aacute; sấu r&otilde; n&eacute;t tạo điểm nhấn, gi&uacute;p đ&ocirc;i gi&agrave;y trở th&agrave;nh m&oacute;n đồ thời trang đẳng cấp v&agrave; bền bỉ.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc thủ c&ocirc;ng độc đ&aacute;o:</strong><br />\n	Với m&agrave;u sắc được nhuộm thủ c&ocirc;ng tỉ mỉ, mỗi đ&ocirc;i gi&agrave;y GD013 đều mang một m&agrave;u sắc ri&ecirc;ng biệt, tạo n&ecirc;n sự độc đ&aacute;o v&agrave; kh&aacute;c biệt. M&agrave;u sắc n&agrave;y kh&ocirc;ng chỉ đẹp mắt m&agrave; c&ograve;n dễ d&agrave;ng phối hợp với nhiều loại trang phục, từ c&ocirc;ng sở đến dạo phố.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế thời trang v&agrave; tinh tế:</strong><br />\n	Gi&agrave;y GD013 c&oacute; thiết kế tinh tế, với đường may sắc sảo v&agrave; kiểu d&aacute;ng hiện đại, ph&ugrave; hợp với những qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch phong c&aacute;ch lịch l&atilde;m, sang trọng. Dễ d&agrave;ng kết hợp với quần &acirc;u, jeans hay thậm ch&iacute; l&agrave; những bộ vest, gi&agrave;y GD013 sẽ gi&uacute;p bạn nổi bật trong mọi ho&agrave;n cảnh.</p>\n	</li>\n	<li>\n	<p><strong>Độ bền vượt trội:</strong><br />\n	Da c&aacute; sấu nổi bật với độ bền cao, gi&uacute;p đ&ocirc;i gi&agrave;y giữ được h&igrave;nh d&aacute;ng v&agrave; chất lượng qua thời gian. Đ&acirc;y l&agrave; lựa chọn l&yacute; tưởng cho những ai t&igrave;m kiếm một sản phẩm vừa đẹp vừa bền, mang lại gi&aacute; trị sử dụng l&acirc;u d&agrave;i.</p>\n	</li>\n	<li>\n	<p><strong>Tiện dụng v&agrave; thoải m&aacute;i:</strong><br />\n	Gi&agrave;y được thiết kế để mang lại sự thoải m&aacute;i tối đa khi di chuyển. Chất liệu da mềm mại v&agrave; đế gi&agrave;y chắc chắn gi&uacute;p bạn cảm thấy dễ chịu trong suốt cả ng&agrave;y d&agrave;i, từ c&ocirc;ng việc đến c&aacute;c hoạt động ngo&agrave;i trời.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>Gi&agrave;y Da C&aacute; Sấu Nam M&agrave;u Thủ C&ocirc;ng Thời Trang &ndash; GD013</strong> l&agrave; lựa chọn l&yacute; tưởng cho những ai y&ecirc;u th&iacute;ch sự sang trọng, kh&aacute;c biệt v&agrave; chất lượng vượt trội. Với thiết kế tinh tế, chất liệu da c&aacute; sấu cao cấp v&agrave; m&agrave;u sắc thủ c&ocirc;ng độc đ&aacute;o, đ&ocirc;i gi&agrave;y n&agrave;y sẽ gi&uacute;p bạn thể hiện phong c&aacute;ch thời trang đẳng cấp v&agrave; nổi bật trong mọi dịp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (156, 10, 'Giày da cá sấu xịn cao cấp dành cho nam – GD012', 'https://casauhoanglong.com/wp-content/uploads/2023/12/z5021707867695_323159522f52cdf727c792e830e60935-600x820.jpg', 4179000, '<h3><strong>Gi&agrave;y Da C&aacute; Sấu Nam M&agrave;u Thủ C&ocirc;ng Thời Trang &ndash; GD013</strong></h3>\n\n<p><strong>Gi&agrave;y Da C&aacute; Sấu Nam M&agrave;u Thủ C&ocirc;ng Thời Trang &ndash; GD013</strong> l&agrave; sự kết hợp ho&agrave;n hảo giữa nghệ thuật chế t&aacute;c thủ c&ocirc;ng v&agrave; chất liệu da c&aacute; sấu cao cấp, mang đến một sản phẩm kh&ocirc;ng chỉ bền bỉ m&agrave; c&ograve;n v&ocirc; c&ugrave;ng sang trọng. Được nhuộm thủ c&ocirc;ng với m&agrave;u sắc độc đ&aacute;o, GD013 kh&ocirc;ng chỉ l&agrave; đ&ocirc;i gi&agrave;y thời trang m&agrave; c&ograve;n l&agrave; biểu tượng của phong c&aacute;ch lịch l&atilde;m, tinh tế, ph&ugrave; hợp với những qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch sự kh&aacute;c biệt v&agrave; đẳng cấp.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu thật cao cấp:</strong><br />\n	Gi&agrave;y GD013 được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n, mang lại vẻ đẹp sang trọng v&agrave; bền bỉ. Da c&aacute; sấu kh&ocirc;ng chỉ gi&uacute;p gi&agrave;y c&oacute; độ bền vượt trội m&agrave; c&ograve;n tạo n&ecirc;n vẻ ngo&agrave;i độc đ&aacute;o, thu h&uacute;t mọi &aacute;nh nh&igrave;n.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc thủ c&ocirc;ng độc đ&aacute;o:</strong><br />\n	M&agrave;u sắc của gi&agrave;y được <strong>nhuộm thủ c&ocirc;ng</strong> tỉ mỉ, tạo ra một m&agrave;u sắc tự nhi&ecirc;n, độc đ&aacute;o v&agrave; kh&aacute;c biệt. Mỗi đ&ocirc;i gi&agrave;y đều mang một m&agrave;u sắc ri&ecirc;ng biệt, gi&uacute;p bạn nổi bật trong đ&aacute;m đ&ocirc;ng v&agrave; thể hiện c&aacute; t&iacute;nh mạnh mẽ, lịch l&atilde;m.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế tinh tế, thời trang:</strong><br />\n	Với thiết kế tối giản nhưng v&ocirc; c&ugrave;ng tinh tế, gi&agrave;y GD013 mang lại vẻ ngo&agrave;i sang trọng v&agrave; đẳng cấp. Đ&ocirc;i gi&agrave;y n&agrave;y dễ d&agrave;ng kết hợp với nhiều loại trang phục kh&aacute;c nhau, từ quần &acirc;u, jeans đến c&aacute;c bộ vest lịch l&atilde;m, ph&ugrave; hợp cho c&aacute;c dịp c&ocirc;ng sở, dạo phố hay những sự kiện quan trọng.</p>\n	</li>\n	<li>\n	<p><strong>Độ bền vượt trội:</strong><br />\n	Da c&aacute; sấu nổi tiếng với độ bền cao, gi&uacute;p đ&ocirc;i gi&agrave;y giữ được h&igrave;nh d&aacute;ng v&agrave; chất lượng l&acirc;u d&agrave;i. Gi&agrave;y GD013 l&agrave; sự đầu tư xứng đ&aacute;ng cho những ai t&igrave;m kiếm một sản phẩm thời trang vừa đẹp vừa bền.</p>\n	</li>\n	<li>\n	<p><strong>Tiện dụng v&agrave; thoải m&aacute;i:</strong><br />\n	Gi&agrave;y được thiết kế để mang lại sự thoải m&aacute;i khi di chuyển, với đế gi&agrave;y chắc chắn v&agrave; chất liệu da mềm mại. Bạn sẽ cảm thấy dễ chịu trong suốt cả ng&agrave;y d&agrave;i, d&ugrave; l&agrave; l&agrave;m việc hay tham gia c&aacute;c hoạt động ngo&agrave;i trời.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>Gi&agrave;y Da C&aacute; Sấu Nam M&agrave;u Thủ C&ocirc;ng Thời Trang &ndash; GD013</strong> l&agrave; lựa chọn l&yacute; tưởng cho những qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch sự sang trọng, độc đ&aacute;o v&agrave; chất lượng vượt trội. Với chất liệu da c&aacute; sấu cao cấp, thiết kế tinh tế v&agrave; m&agrave;u sắc thủ c&ocirc;ng độc đ&aacute;o, đ&ocirc;i gi&agrave;y n&agrave;y sẽ gi&uacute;p bạn thể hiện phong c&aacute;ch đẳng cấp v&agrave; nổi bật trong mọi dịp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (157, 10, 'Giày cá sấu nam da thật màu đen sang trọng – GD005', 'https://casauhoanglong.com/wp-content/uploads/2023/02/GIAY-DA-CA-SAU-GD005-600x699.jpg', 3599000, '<h3><strong>Gi&agrave;y C&aacute; Sấu Nam Da Thật M&agrave;u Đen Sang Trọng &ndash; GD005</strong></h3>\n\n<p><strong>Gi&agrave;y C&aacute; Sấu Nam Da Thật M&agrave;u Đen Sang Trọng &ndash; GD005</strong> l&agrave; lựa chọn ho&agrave;n hảo cho những qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch sự sang trọng, lịch l&atilde;m v&agrave; đẳng cấp. Được chế t&aacute;c từ <strong>da c&aacute; sấu thật</strong>, đ&ocirc;i gi&agrave;y n&agrave;y kh&ocirc;ng chỉ mang đến vẻ ngo&agrave;i tinh tế m&agrave; c&ograve;n đảm bảo độ bền vượt trội, gi&uacute;p bạn tự tin v&agrave; nổi bật trong mọi ho&agrave;n cảnh. Với m&agrave;u đen cổ điển, gi&agrave;y GD005 dễ d&agrave;ng kết hợp với nhiều trang phục kh&aacute;c nhau, từ c&ocirc;ng sở đến dạo phố, tạo n&ecirc;n phong c&aacute;ch thời trang kh&ocirc;ng thể bỏ qua.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu thật cao cấp:</strong><br />\n	Gi&agrave;y GD005 được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, nổi bật với c&aacute;c v&acirc;n da tự nhi&ecirc;n v&agrave; độc đ&aacute;o. Chất liệu n&agrave;y kh&ocirc;ng chỉ mang lại vẻ đẹp sang trọng m&agrave; c&ograve;n rất bền bỉ, gi&uacute;p gi&agrave;y giữ được h&igrave;nh d&aacute;ng v&agrave; chất lượng l&acirc;u d&agrave;i.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u đen sang trọng:</strong><br />\n	M&agrave;u đen cổ điển v&agrave; thanh lịch của gi&agrave;y GD005 dễ d&agrave;ng phối hợp với mọi loại trang phục, từ bộ đồ c&ocirc;ng sở, vest cho đến trang phục dạo phố. M&agrave;u đen kh&ocirc;ng bao giờ lỗi mốt v&agrave; lu&ocirc;n tạo n&ecirc;n vẻ ngo&agrave;i mạnh mẽ, lịch l&atilde;m cho người sử dụng.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế tinh tế, thời trang:</strong><br />\n	Gi&agrave;y GD005 sở hữu thiết kế đơn giản nhưng v&ocirc; c&ugrave;ng tinh tế, với đường may sắc sảo v&agrave; kiểu d&aacute;ng hiện đại. Đ&ocirc;i gi&agrave;y n&agrave;y mang đến vẻ ngo&agrave;i thanh lịch, ph&ugrave; hợp với nhiều dịp kh&aacute;c nhau, từ c&ocirc;ng sở đến c&aacute;c sự kiện quan trọng.</p>\n	</li>\n	<li>\n	<p><strong>Độ bền vượt trội:</strong><br />\n	Da c&aacute; sấu nổi tiếng với độ bền cao, gi&uacute;p đ&ocirc;i gi&agrave;y giữ được vẻ đẹp nguy&ecirc;n vẹn qua thời gian. Đ&acirc;y l&agrave; lựa chọn l&yacute; tưởng cho những ai t&igrave;m kiếm một sản phẩm thời trang vừa đẹp vừa bền.</p>\n	</li>\n	<li>\n	<p><strong>Tiện dụng v&agrave; thoải m&aacute;i:</strong><br />\n	Được thiết kế để mang lại sự thoải m&aacute;i tối đa khi di chuyển, gi&agrave;y GD005 c&oacute; đế gi&agrave;y chắc chắn v&agrave; chất liệu da mềm mại, gi&uacute;p bạn cảm thấy dễ chịu trong suốt cả ng&agrave;y d&agrave;i.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>Gi&agrave;y C&aacute; Sấu Nam Da Thật M&agrave;u Đen Sang Trọng &ndash; GD005</strong> l&agrave; lựa chọn l&yacute; tưởng cho những qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch sự sang trọng, đẳng cấp v&agrave; bền bỉ. Với chất liệu da c&aacute; sấu cao cấp, thiết kế tinh tế v&agrave; m&agrave;u đen thanh lịch, đ&ocirc;i gi&agrave;y n&agrave;y sẽ gi&uacute;p bạn thể hiện phong c&aacute;ch thời trang lịch l&atilde;m v&agrave; tự tin trong mọi dịp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (158, 10, 'Giày cá sấu màu đen cao cấp dành cho nam – GD007', 'https://casauhoanglong.com/wp-content/uploads/2023/02/giay-tay-ca-sau-GD007-600x820.jpg', 5699000, '<h3><strong>Gi&agrave;y C&aacute; Sấu M&agrave;u Đen Cao Cấp D&agrave;nh Cho Nam &ndash; GD007</strong></h3>\n\n<p><strong>Gi&agrave;y C&aacute; Sấu M&agrave;u Đen Cao Cấp D&agrave;nh Cho Nam &ndash; GD007</strong> l&agrave; sự kết hợp ho&agrave;n hảo giữa <strong>chất liệu da c&aacute; sấu thật</strong> v&agrave; thiết kế thời trang tinh tế, mang lại vẻ đẹp sang trọng v&agrave; bền bỉ cho người sử dụng. Với m&agrave;u đen thanh lịch v&agrave; kiểu d&aacute;ng hiện đại, đ&ocirc;i gi&agrave;y n&agrave;y kh&ocirc;ng chỉ dễ d&agrave;ng phối hợp với nhiều trang phục m&agrave; c&ograve;n gi&uacute;p bạn thể hiện phong c&aacute;ch lịch l&atilde;m, mạnh mẽ v&agrave; đẳng cấp.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu thật cao cấp:</strong><br />\n	Gi&agrave;y GD007 được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, với c&aacute;c v&acirc;n da tự nhi&ecirc;n đặc trưng, mang lại vẻ đẹp độc đ&aacute;o v&agrave; sang trọng. Da c&aacute; sấu kh&ocirc;ng chỉ c&oacute; độ bền vượt trội m&agrave; c&ograve;n gi&uacute;p đ&ocirc;i gi&agrave;y giữ được h&igrave;nh d&aacute;ng v&agrave; chất lượng qua thời gian.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u đen thanh lịch:</strong><br />\n	M&agrave;u đen l&agrave; lựa chọn cổ điển v&agrave; dễ d&agrave;ng phối hợp với mọi loại trang phục, từ c&ocirc;ng sở đến dạo phố. Gi&agrave;y GD007 sẽ l&agrave; điểm nhấn ho&agrave;n hảo cho phong c&aacute;ch thời trang của bạn, gi&uacute;p bạn lu&ocirc;n nổi bật v&agrave; lịch l&atilde;m trong mọi ho&agrave;n cảnh.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế tinh tế v&agrave; thời trang:</strong><br />\n	Gi&agrave;y GD007 sở hữu thiết kế hiện đại, với đường may sắc sảo v&agrave; kiểu d&aacute;ng thanh lịch. Đ&ocirc;i gi&agrave;y n&agrave;y dễ d&agrave;ng kết hợp với c&aacute;c bộ đồ c&ocirc;ng sở, trang phục dạo phố hay thậm ch&iacute; l&agrave; những sự kiện quan trọng, gi&uacute;p bạn lu&ocirc;n tự tin v&agrave; nổi bật.</p>\n	</li>\n	<li>\n	<p><strong>Độ bền vượt trội:</strong><br />\n	Da c&aacute; sấu nổi tiếng với độ bền cao, gi&uacute;p gi&agrave;y GD007 giữ được h&igrave;nh d&aacute;ng v&agrave; chất lượng l&acirc;u d&agrave;i, l&agrave; sự đầu tư xứng đ&aacute;ng cho những ai t&igrave;m kiếm sản phẩm vừa đẹp vừa bền.</p>\n	</li>\n	<li>\n	<p><strong>Tiện dụng v&agrave; thoải m&aacute;i:</strong><br />\n	Với đế gi&agrave;y chắc chắn v&agrave; chất liệu da mềm mại, gi&agrave;y GD007 mang lại sự thoải m&aacute;i khi di chuyển. Bạn sẽ cảm thấy dễ chịu trong suốt cả ng&agrave;y d&agrave;i, từ c&ocirc;ng việc đến c&aacute;c hoạt động ngo&agrave;i trời.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>Gi&agrave;y C&aacute; Sấu M&agrave;u Đen Cao Cấp D&agrave;nh Cho Nam &ndash; GD007</strong> l&agrave; sự lựa chọn ho&agrave;n hảo cho những qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch sự sang trọng, đẳng cấp v&agrave; chất lượng vượt trội. Với chất liệu da c&aacute; sấu cao cấp, thiết kế tinh tế v&agrave; m&agrave;u sắc thanh lịch, đ&ocirc;i gi&agrave;y n&agrave;y sẽ gi&uacute;p bạn thể hiện phong c&aacute;ch thời trang đẳng cấp v&agrave; tự tin trong mọi dịp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (159, 10, 'Giày tây da cá sấu thủ công VIP- GD015', 'https://casauhoanglong.com/wp-content/uploads/2024/09/giay-da-ca-sau-nam-GD15-2-600x800.jpeg', 5999000, '<h3><strong>Gi&agrave;y T&acirc;y Da C&aacute; Sấu Thủ C&ocirc;ng VIP &ndash; GD015</strong></h3>\n\n<p><strong>Gi&agrave;y T&acirc;y Da C&aacute; Sấu Thủ C&ocirc;ng VIP &ndash; GD015</strong> l&agrave; sự kết hợp ho&agrave;n hảo giữa <strong>chất liệu da c&aacute; sấu cao cấp</strong> v&agrave; nghệ thuật chế t&aacute;c thủ c&ocirc;ng tỉ mỉ, mang đến một sản phẩm đẳng cấp v&agrave; sang trọng cho những qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch sự kh&aacute;c biệt. Với thiết kế thanh lịch v&agrave; tinh tế, đ&ocirc;i gi&agrave;y n&agrave;y kh&ocirc;ng chỉ n&acirc;ng tầm phong c&aacute;ch m&agrave; c&ograve;n mang đến sự thoải m&aacute;i v&agrave; bền bỉ trong từng bước đi.</p>\n\n<hr />\n<p><strong>Đặc điểm nổi bật:</strong></p>\n\n<ul>\n	<li>\n	<p><strong>Chất liệu da c&aacute; sấu thủ c&ocirc;ng cao cấp:</strong><br />\n	Gi&agrave;y GD015 được l&agrave;m từ <strong>da c&aacute; sấu thật</strong>, chế t&aacute;c thủ c&ocirc;ng tỉ mỉ với c&aacute;c v&acirc;n da tự nhi&ecirc;n độc đ&aacute;o. Mỗi đ&ocirc;i gi&agrave;y đều mang một vẻ đẹp ri&ecirc;ng biệt, sang trọng v&agrave; bền bỉ, tạo n&ecirc;n sự kh&aacute;c biệt r&otilde; rệt so với c&aacute;c sản phẩm th&ocirc;ng thường.</p>\n	</li>\n	<li>\n	<p><strong>Thiết kế tỉ mỉ v&agrave; tinh tế:</strong><br />\n	Với kiểu d&aacute;ng gi&agrave;y t&acirc;y cổ điển, GD015 mang đến vẻ đẹp lịch l&atilde;m v&agrave; sang trọng. Được chế t&aacute;c bằng tay với đường may sắc sảo, gi&agrave;y c&oacute; thể dễ d&agrave;ng kết hợp với bộ đồ c&ocirc;ng sở, vest hay trang phục dạo phố, tạo n&ecirc;n phong c&aacute;ch đẳng cấp cho người sử dụng.</p>\n	</li>\n	<li>\n	<p><strong>M&agrave;u sắc sang trọng:</strong><br />\n	Gi&agrave;y GD015 c&oacute; m&agrave;u sắc tinh tế, dễ d&agrave;ng phối hợp với nhiều loại trang phục kh&aacute;c nhau. M&agrave;u sắc của gi&agrave;y lu&ocirc;n giữ được vẻ đẹp l&acirc;u d&agrave;i, kh&ocirc;ng bị phai mờ theo thời gian, gi&uacute;p bạn lu&ocirc;n giữ được phong c&aacute;ch thanh lịch.</p>\n	</li>\n	<li>\n	<p><strong>Độ bền vượt trội:</strong><br />\n	Da c&aacute; sấu nổi tiếng với độ bền cao, gi&uacute;p đ&ocirc;i gi&agrave;y giữ được h&igrave;nh d&aacute;ng v&agrave; chất lượng l&acirc;u d&agrave;i. Đ&acirc;y l&agrave; sự đầu tư xứng đ&aacute;ng cho những ai t&igrave;m kiếm một sản phẩm vừa đẹp vừa bền.</p>\n	</li>\n	<li>\n	<p><strong>Tiện dụng v&agrave; thoải m&aacute;i:</strong><br />\n	Với đế gi&agrave;y chắc chắn v&agrave; thiết kế &ocirc;m ch&acirc;n, gi&agrave;y GD015 mang lại sự thoải m&aacute;i tối đa khi di chuyển. Chất liệu da mềm mại v&agrave; linh hoạt gi&uacute;p bạn cảm thấy dễ chịu trong suốt cả ng&agrave;y d&agrave;i, từ c&ocirc;ng việc đến c&aacute;c hoạt động ngo&agrave;i trời.</p>\n	</li>\n</ul>\n\n<hr />\n<p><strong>Gi&agrave;y T&acirc;y Da C&aacute; Sấu Thủ C&ocirc;ng VIP &ndash; GD015</strong> l&agrave; lựa chọn l&yacute; tưởng cho những qu&yacute; &ocirc;ng y&ecirc;u th&iacute;ch sự sang trọng, đẳng cấp v&agrave; tinh tế. Với chất liệu da c&aacute; sấu cao cấp, thiết kế thủ c&ocirc;ng tỉ mỉ v&agrave; độ bền vượt trội, đ&ocirc;i gi&agrave;y n&agrave;y sẽ gi&uacute;p bạn tự tin thể hiện phong c&aacute;ch thời trang đẳng cấp v&agrave; lịch l&atilde;m trong mọi dịp.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2025-01-16', 1);
INSERT INTO `products` VALUES (162, 22, 'Test Product', '/uploads/images/categories/cate-1.png', 123000, '<p>M&ocirc; tả test</p>\n', '2025-05-16', 1);

-- ----------------------------
-- Table structure for review_images
-- ----------------------------
DROP TABLE IF EXISTS `review_images`;
CREATE TABLE `review_images`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idReview` int(11) NOT NULL,
  `imageUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idReview`(`idReview` ASC) USING BTREE,
  CONSTRAINT `review_images_ibfk_1` FOREIGN KEY (`idReview`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of review_images
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Admin', 'Người quản trị hệ thống, có toàn quyền với hệ thống');
INSERT INTO `roles` VALUES (2, 'Warehouse Manager Test', 'Nhân viên quản lý kho');
INSERT INTO `roles` VALUES (3, 'Product Manager', 'Nhân viên quản lý sản phẩm');
INSERT INTO `roles` VALUES (4, 'Category Manager', 'Nhân viên quản lý danh mục ');
INSERT INTO `roles` VALUES (14, 'Marketing Manager', 'Trưởng bộ phận kinh doanh ');
INSERT INTO `roles` VALUES (15, 'Content Manager', 'Quản lý nội dung');
INSERT INTO `roles` VALUES (16, 'Customer', 'Khách hàng');

-- ----------------------------
-- Table structure for roles_permissions
-- ----------------------------
DROP TABLE IF EXISTS `roles_permissions`;
CREATE TABLE `roles_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idRole` int(11) NULL DEFAULT NULL,
  `idPermission` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `roles_permissions_ibfk_1`(`idRole` ASC) USING BTREE,
  INDEX `roles_permissions_ibfk_2`(`idPermission` ASC) USING BTREE,
  CONSTRAINT `roles_permissions_ibfk_1` FOREIGN KEY (`idRole`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roles_permissions_ibfk_2` FOREIGN KEY (`idPermission`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 368 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles_permissions
-- ----------------------------
INSERT INTO `roles_permissions` VALUES (5, 4, 1);
INSERT INTO `roles_permissions` VALUES (6, 4, 2);
INSERT INTO `roles_permissions` VALUES (7, 4, 3);
INSERT INTO `roles_permissions` VALUES (8, 4, 4);
INSERT INTO `roles_permissions` VALUES (9, 1, 13);
INSERT INTO `roles_permissions` VALUES (11, 4, 13);
INSERT INTO `roles_permissions` VALUES (38, 3, 5);
INSERT INTO `roles_permissions` VALUES (39, 3, 8);
INSERT INTO `roles_permissions` VALUES (40, 3, 6);
INSERT INTO `roles_permissions` VALUES (41, 3, 7);
INSERT INTO `roles_permissions` VALUES (62, 2, 20);
INSERT INTO `roles_permissions` VALUES (63, 2, 23);
INSERT INTO `roles_permissions` VALUES (64, 2, 21);
INSERT INTO `roles_permissions` VALUES (65, 2, 22);
INSERT INTO `roles_permissions` VALUES (66, 2, 24);
INSERT INTO `roles_permissions` VALUES (354, 14, 13);
INSERT INTO `roles_permissions` VALUES (355, 14, 2);
INSERT INTO `roles_permissions` VALUES (356, 14, 4);
INSERT INTO `roles_permissions` VALUES (357, 14, 1);
INSERT INTO `roles_permissions` VALUES (358, 14, 3);
INSERT INTO `roles_permissions` VALUES (359, 14, 24);
INSERT INTO `roles_permissions` VALUES (360, 14, 14);
INSERT INTO `roles_permissions` VALUES (361, 14, 17);
INSERT INTO `roles_permissions` VALUES (362, 14, 15);
INSERT INTO `roles_permissions` VALUES (363, 14, 16);
INSERT INTO `roles_permissions` VALUES (364, 14, 5);
INSERT INTO `roles_permissions` VALUES (365, 14, 8);
INSERT INTO `roles_permissions` VALUES (366, 14, 6);
INSERT INTO `roles_permissions` VALUES (367, 14, 7);

-- ----------------------------
-- Table structure for suppliers
-- ----------------------------
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of suppliers
-- ----------------------------
INSERT INTO `suppliers` VALUES (1, 'Hermès', 'contact@hermes.com', '+33 1 40 17 47 17', '24 Rue du Faubourg Saint-Honoré, 75008 Paris, France', 1);
INSERT INTO `suppliers` VALUES (2, 'Louis Vuitton', 'info@louisvuitton.com', '+33 9 77 40 40 77', '2 Rue du Pont Neuf, 75001 Paris, France', 1);
INSERT INTO `suppliers` VALUES (3, 'Gucci', 'support@gucci.com', '+39 055 7592 3333', 'Via Tornabuoni 73/R, 50123 Florence, Italy', 1);
INSERT INTO `suppliers` VALUES (4, 'Prada', 'info@prada.com', '+39 02 567 811 11', 'Via Antonio Fogazzaro, 28, 20135 Milan, Italy', 1);
INSERT INTO `suppliers` VALUES (5, 'Crocodile Leather Co.', 'sales@crocodileleather.com', '+1 305-555-0192', 'Miami, FL, USA', 1);
INSERT INTO `suppliers` VALUES (6, 'Siam Leather Goods', 'contact@siamleathergoods.co.th', '+66 2 555 0199', 'Bangkok, Thailand', 1);
INSERT INTO `suppliers` VALUES (7, 'Heng Long Leather', 'info@henglongleather.com', '+65 6264 8888', 'Singapore', 1);
INSERT INTO `suppliers` VALUES (8, 'Patek Philippe Leather Dept.', 'leather@patek.com', '+41 22 884 20 20', 'Rue du Rhône 41, 1204 Genève, Switzerland', 0);
INSERT INTO `suppliers` VALUES (9, 'Zilli', 'service@zilli.fr', '+33 4 78 89 61 02', 'Rue Pierre Vacher, 69007 Lyon, France', 1);
INSERT INTO `suppliers` VALUES (10, 'Berluti', 'contact@berluti.com', '+33 1 47 20 01 77', 'Rue Marbeuf, 75008 Paris, France', 1);

-- ----------------------------
-- Table structure for tokens
-- ----------------------------
DROP TABLE IF EXISTS `tokens`;
CREATE TABLE `tokens`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenType` enum('VERIFY_ACCOUNT','RESET_PASSWORD','PAYMENT','') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `expiresAt` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '-1=expired; 0=used; 1=active',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_tokens-users`(`idUser` ASC) USING BTREE,
  INDEX `idx_token`(`token` ASC) USING BTREE COMMENT 'tìm kiếm token nhanh hơn',
  CONSTRAINT `fk_tokens-users` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tokens
-- ----------------------------
INSERT INTO `tokens` VALUES (1, 1, 'adfasdf123ASKL', 'RESET_PASSWORD', '2025-01-13 16:00:07', '2025-01-15 15:58:31', -1);
INSERT INTO `tokens` VALUES (2, 1, '3296644d-c14e-44e1-94b7-d3037a510358', 'RESET_PASSWORD', '2025-01-13 16:57:14', '2025-01-14 16:57:30', -1);
INSERT INTO `tokens` VALUES (92, 88, '8034c5db-53be-476a-8f69-5d4a83e393dc', 'VERIFY_ACCOUNT', '2025-06-03 02:03:06', '2025-06-04 02:03:06', 1);
INSERT INTO `tokens` VALUES (93, 89, '8d575b8a-5011-4577-9b19-a836604660b6', 'VERIFY_ACCOUNT', '2025-06-03 02:10:25', '2025-06-04 02:10:25', 1);
INSERT INTO `tokens` VALUES (94, 90, 'eec777cd-312b-474a-811f-588812288528', 'VERIFY_ACCOUNT', '2025-06-03 02:22:16', '2025-06-04 02:22:16', 1);
INSERT INTO `tokens` VALUES (95, 91, '78c958b1-1752-4462-ba2c-cc6d45540692', 'VERIFY_ACCOUNT', '2025-06-03 02:25:27', '2025-06-04 02:25:27', 1);
INSERT INTO `tokens` VALUES (98, 94, 'e4b74c20-383f-4932-a39f-a9317c5d4402', 'VERIFY_ACCOUNT', '2025-06-02 19:46:21', '2025-06-03 19:46:21', 0);
INSERT INTO `tokens` VALUES (99, 95, '72d3752e-7054-4981-8074-c66857a48381', 'VERIFY_ACCOUNT', '2025-06-02 19:49:22', '2025-06-03 19:49:22', 1);

-- ----------------------------
-- Table structure for user_discounts
-- ----------------------------
DROP TABLE IF EXISTS `user_discounts`;
CREATE TABLE `user_discounts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NULL DEFAULT NULL,
  `idDiscount` int(11) NULL DEFAULT NULL,
  `savedDate` datetime NULL DEFAULT current_timestamp(),
  `isUsed` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idUser`(`idUser` ASC) USING BTREE,
  INDEX `idDiscount`(`idDiscount` ASC) USING BTREE,
  CONSTRAINT `user_discounts_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_discounts_ibfk_2` FOREIGN KEY (`idDiscount`) REFERENCES `discount_codes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_discounts
-- ----------------------------
INSERT INTO `user_discounts` VALUES (1, 1, 15, '2025-05-28 11:43:54', 0);
INSERT INTO `user_discounts` VALUES (18, 1, 12, '2025-05-29 14:01:29', 0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phoneNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gender` enum('NAM','NỮ','KHÁC','') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `birthdate` date NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  `role` int(11) NULL DEFAULT 0,
  `google_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email_idx`(`email` ASC) USING BTREE COMMENT 'Hỗ trợ tìm kiếm theo email khi đăng nhập nhanh hơn',
  UNIQUE INDEX `phone_idx`(`phoneNumber` ASC) USING BTREE COMMENT 'Hỗ trợ tìm kiếm theo sdt khi đăng nhập nhanh hơn',
  UNIQUE INDEX `google_id`(`google_id` ASC) USING BTREE,
  INDEX `role`(`role` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin', 'admin@gmail.com', '0122345678', 'KHÁC', '2025-01-12', 1, 1, NULL);
INSERT INTO `users` VALUES (2, 'testUser', 'fed3b61b26081849378080b34e693d2e', 'Test User', 'testuser@example.com', '1234567890', 'NAM', '1990-01-01', 0, 0, NULL);
INSERT INTO `users` VALUES (103, 'developer', '5e8edd851d2fdfbd7415232c67367cc3', 'Developer', 'developer@gmail.com', '0122345679', 'NAM', '2025-01-12', 1, 1, NULL);

-- ----------------------------
-- Function structure for GenerateOrderCode
-- ----------------------------
DROP FUNCTION IF EXISTS `GenerateOrderCode`;
delimiter ;;
CREATE FUNCTION `GenerateOrderCode`()
 RETURNS varchar(20) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
  DETERMINISTIC
BEGIN
  DECLARE todayCode VARCHAR(8);
  DECLARE maxNumber INT;
  DECLARE nextNumber INT;
  DECLARE newCode VARCHAR(20);

  SET todayCode = DATE_FORMAT(NOW(), '%Y%m%d');

  SELECT MAX(CAST(SUBSTRING(`code`, 10) AS UNSIGNED))
  INTO maxNumber
  FROM orders_v2
  WHERE SUBSTRING(`code`, 1, 8) = todayCode;

  SET nextNumber = IFNULL(maxNumber, 0) + 1;

  SET newCode = CONCAT(todayCode, '-', LPAD(nextNumber, 5, '0'));

  RETURN newCode;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetCustomerChange
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetCustomerChange`;
delimiter ;;
CREATE PROCEDURE `GetCustomerChange`()
BEGIN
    SELECT 
        COUNT(DISTINCT CASE 
            WHEN MONTH(orderDate) = MONTH(CURRENT_DATE()) 
                AND YEAR(orderDate) = YEAR(CURRENT_DATE()) 
            THEN idUser
            END) AS customers_this_month,  
    
        COUNT(DISTINCT CASE 
            WHEN MONTH(orderDate) = MONTH(CURRENT_DATE() - INTERVAL 1 MONTH) 
                AND YEAR(orderDate) = YEAR(CURRENT_DATE() - INTERVAL 1 MONTH) 
            THEN idUser
            END) AS customers_last_month,  
    
        CASE 
            WHEN COUNT(DISTINCT CASE 
                    WHEN MONTH(orderDate) = MONTH(CURRENT_DATE() - INTERVAL 1 MONTH) 
                        AND YEAR(orderDate) = YEAR(CURRENT_DATE() - INTERVAL 1 MONTH) 
                    THEN idUser
                END) = 0 
            THEN NULL  
            ELSE ROUND(
                (COUNT(DISTINCT CASE 
                        WHEN MONTH(orderDate) = MONTH(CURRENT_DATE()) 
                            AND YEAR(orderDate) = YEAR(CURRENT_DATE()) 
                        THEN idUser
                    END) - COUNT(DISTINCT CASE 
                        WHEN MONTH(orderDate) = MONTH(CURRENT_DATE() - INTERVAL 1 MONTH) 
                            AND YEAR(orderDate) = YEAR(CURRENT_DATE() - INTERVAL 1 MONTH) 
                        THEN idUser
                    END)) 
                / COUNT(DISTINCT CASE 
                        WHEN MONTH(orderDate) = MONTH(CURRENT_DATE() - INTERVAL 1 MONTH) 
                            AND YEAR(orderDate) = YEAR(CURRENT_DATE() - INTERVAL 1 MONTH) 
                        THEN idUser
                    END) * 100, 2)  
        END AS change_percent  
    FROM orders_v2;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetMonthlyRevenue
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetMonthlyRevenue`;
delimiter ;;
CREATE PROCEDURE `GetMonthlyRevenue`(IN year INT)
BEGIN
    SELECT 
        month_numbers.month AS month,
        IF(MONTH(CURDATE()) < month_numbers.month, NULL, COALESCE(SUM(o.total), 0)) AS total_revenue
    FROM 
        (SELECT 1 AS month UNION ALL
         SELECT 2 UNION ALL
         SELECT 3 UNION ALL
         SELECT 4 UNION ALL
         SELECT 5 UNION ALL
         SELECT 6 UNION ALL
         SELECT 7 UNION ALL
         SELECT 8 UNION ALL
         SELECT 9 UNION ALL
         SELECT 10 UNION ALL
         SELECT 11 UNION ALL
         SELECT 12) AS month_numbers
    LEFT JOIN 
        orders_v2 o ON MONTH(o.orderDate) = month_numbers.month 
        AND YEAR(o.orderDate) = year  
    GROUP BY 
        month_numbers.month
    ORDER BY 
        month_numbers.month;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetOrderChange
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetOrderChange`;
delimiter ;;
CREATE PROCEDURE `GetOrderChange`()
BEGIN
    SELECT 
        COUNT(CASE 
                WHEN MONTH(orderDate) = MONTH(CURRENT_DATE()) 
                    AND YEAR(orderDate) = YEAR(CURRENT_DATE()) 
                THEN id 
                END) AS orders_this_month,  
        
        COUNT(CASE 
                WHEN MONTH(orderDate) = MONTH(CURRENT_DATE() - INTERVAL 1 MONTH) 
                    AND YEAR(orderDate) = YEAR(CURRENT_DATE() - INTERVAL 1 MONTH) 
                THEN id 
                END) AS orders_last_month,  
        
        CASE 
            WHEN COUNT(CASE 
                        WHEN MONTH(orderDate) = MONTH(CURRENT_DATE() - INTERVAL 1 MONTH) 
                            AND YEAR(orderDate) = YEAR(CURRENT_DATE() - INTERVAL 1 MONTH) 
                        THEN id
                    END) = 0 
            THEN NULL  
            ELSE ROUND(
                (COUNT(CASE 
                        WHEN MONTH(orderDate) = MONTH(CURRENT_DATE()) 
                            AND YEAR(orderDate) = YEAR(CURRENT_DATE()) 
                        THEN id
                    END) - COUNT(CASE 
                        WHEN MONTH(orderDate) = MONTH(CURRENT_DATE() - INTERVAL 1 MONTH) 
                            AND YEAR(orderDate) = YEAR(CURRENT_DATE() - INTERVAL 1 MONTH) 
                        THEN id
                    END)) 
                / COUNT(CASE 
                        WHEN MONTH(orderDate) = MONTH(CURRENT_DATE() - INTERVAL 1 MONTH) 
                            AND YEAR(orderDate) = YEAR(CURRENT_DATE() - INTERVAL 1 MONTH) 
                        THEN id
                    END) * 100, 2)  
        END AS change_percent  
    FROM orders_v2;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetRevenueChange
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetRevenueChange`;
delimiter ;;
CREATE PROCEDURE `GetRevenueChange`()
BEGIN
    SELECT 
        total_this_month,
        total_last_month,
        CASE 
            WHEN total_last_month = 0 THEN NULL
            ELSE ROUND((total_this_month - total_last_month) / total_last_month * 100, 2)
        END AS change_percent
    FROM (
        SELECT 
            SUM(CASE 
                    WHEN MONTH(orderDate) = MONTH(CURRENT_DATE()) 
                     AND YEAR(orderDate) = YEAR(CURRENT_DATE()) 
                    THEN total 
                    ELSE 0 
                END) AS total_this_month,
            
            SUM(CASE 
                    WHEN MONTH(orderDate) = MONTH(CURRENT_DATE() - INTERVAL 1 MONTH) 
                     AND YEAR(orderDate) = YEAR(CURRENT_DATE() - INTERVAL 1 MONTH) 
                    THEN total 
                    ELSE 0 
                END) AS total_last_month
        FROM orders_v2
    ) AS t;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for getTop10BestSaleProducts
-- ----------------------------
DROP PROCEDURE IF EXISTS `getTop10BestSaleProducts`;
delimiter ;;
CREATE PROCEDURE `getTop10BestSaleProducts`(IN type_filter VARCHAR(10))
BEGIN
    
    CREATE TEMPORARY TABLE temp_sales_data (
        product_id INT,
        quantity_sold BIGINT
    );

    
    IF type_filter = 'week' THEN
        INSERT INTO temp_sales_data (product_id, quantity_sold)
        SELECT
            pv.idProduct,
            SUM(oi.amount)
        FROM order_items oi
        INNER JOIN orders_v2 o ON oi.idOrder = o.id
        INNER JOIN product_variants pv ON oi.idProductVariant = pv.id
        WHERE o.isDelete = 0
          AND YEARWEEK(o.orderDate, 1) = YEARWEEK(CURRENT_DATE - INTERVAL 1 WEEK, 1)
        GROUP BY pv.idProduct;

    ELSEIF type_filter = 'month' THEN
        INSERT INTO temp_sales_data (product_id, quantity_sold)
        SELECT
            pv.idProduct,
            SUM(oi.amount)
        FROM order_items oi
        INNER JOIN orders_v2 o ON oi.idOrder = o.id
        INNER JOIN product_variants pv ON oi.idProductVariant = pv.id
        WHERE o.isDelete = 0
          AND YEAR(o.orderDate) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH)
          AND MONTH(o.orderDate) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH)
        GROUP BY pv.idProduct;

    ELSEIF type_filter = 'year' THEN
        INSERT INTO temp_sales_data (product_id, quantity_sold)
        SELECT
            pv.idProduct,
            SUM(oi.amount)
        FROM order_items oi
        INNER JOIN orders_v2 o ON oi.idOrder = o.id
        INNER JOIN product_variants pv ON oi.idProductVariant = pv.id
        WHERE o.isDelete = 0
          AND YEAR(o.orderDate) = YEAR(CURRENT_DATE - INTERVAL 1 YEAR)
        GROUP BY pv.idProduct;

    END IF;

    
    SET @total_quantity = (SELECT SUM(quantity_sold) FROM temp_sales_data);

    
    SELECT
        p.id,
        p.name,
        p.image,
        tsd.quantity_sold,
        ROUND((tsd.quantity_sold / @total_quantity) * 100, 2) AS percentage_of_total
    FROM temp_sales_data tsd
    JOIN products p ON p.id = tsd.product_id
    ORDER BY tsd.quantity_sold DESC
    LIMIT 10;

    
    DROP TEMPORARY TABLE temp_sales_data;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for InsertOrderItem
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertOrderItem`;
delimiter ;;
CREATE PROCEDURE `InsertOrderItem`(IN idOrder INTEGER,
  IN idVariant INTEGER,
  IN amount INTEGER)
BEGIN
  
  DECLARE key1 VARCHAR(255);
  DECLARE value1 VARCHAR(255);
  DECLARE key2 VARCHAR(255);
  DECLARE value2 VARCHAR(255);
  DECLARE unitPrice DECIMAL(10,2);
  
  
  SELECT `key`, `value` INTO key1, value1
  FROM product_options
  WHERE id = (SELECT idOption1 FROM product_variants WHERE id = idVariant);
  
  
  SELECT `key`, `value` INTO key2, value2
  FROM product_options
  WHERE id = (SELECT idOption2 FROM product_variants WHERE id = idVariant);
  
  
  SELECT p.price INTO unitPrice
  FROM products p 
  INNER JOIN product_variants pv ON p.id = pv.idProduct
  WHERE pv.id = idVariant;
  
  
  INSERT INTO order_items(idOrder, idProductVariant, amount, unitPrice, o1Key, o1Value, o2Key, o2Value)
  VALUES (idOrder, idVariant, amount, unitPrice, key1, value1, key2, value2);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PlaceOrder
-- ----------------------------
DROP PROCEDURE IF EXISTS `PlaceOrder`;
delimiter ;;
CREATE PROCEDURE `PlaceOrder`(IN idUser INT,
    IN paymentMethod VARCHAR(255),
    IN totalAmount DECIMAL(10,2),
    IN recipientName VARCHAR(255),
    IN recipientPhone VARCHAR(20),
    IN shippingAddress VARCHAR(255),
    IN shippingCompany VARCHAR(255),
    IN shippingCode VARCHAR(255),
    IN districtId INT,
    IN wardCode VARCHAR(50),
    IN items JSON)
BEGIN
  DECLARE orderId INT;
  DECLARE idx INT DEFAULT 0;
  DECLARE total_items INT;
  DECLARE current_item JSON;
  DECLARE idVariant INT;
  DECLARE amount INT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    
    ROLLBACK;
    SELECT 'Đã xảy ra lỗi, rollback giao dịch!' AS ErrorMessage;
  END;

  
  START TRANSACTION;

  
  INSERT INTO orders_v2 (
      idUser,
      `code`,
      orderDate,
      paymentMethod,
      total,
      recipientName,
      recipientPhone,
      shippingAddress,
      shippingCompany,
      shippingCode,
      isDelete,
      districtId,
      wardCode
  )
  VALUES (
      idUser,              
      GenerateOrderCode(), 
      NOW(),               
      paymentMethod,       
      totalAmount,         
      recipientName,       
      recipientPhone,      
      shippingAddress,     
      shippingCompany,     
      shippingCode,        
      0,                   
      districtId,          
      wardCode             
  );

  
  SET orderId := LAST_INSERT_ID();

  
  SET total_items = JSON_LENGTH(items);
  
  
  WHILE idx < total_items DO
      SET current_item = JSON_EXTRACT(items, CONCAT('$[', idx, ']'));
      SET idVariant = JSON_UNQUOTE(JSON_EXTRACT(current_item, '$.idVariant'));
      SET amount = JSON_UNQUOTE(JSON_EXTRACT(current_item, '$.amount'));

      
      CALL InsertOrderItem(orderId, idVariant, amount);
      
      
      UPDATE product_variants set stock = stock - amount where id = idVariant and stock >= amount;
      
      
      INSERT INTO inventory_histories(idVariant, idOrder, quantityChange, changeType, changeDate, idSupplier)
      VALUES (idVariant, orderId, -amount, 'SALE', NOW(), null);

      SET idx = idx + 1;
  END WHILE;
  
  
  SELECT * FROM orders_v2 WHERE id = orderId;
  SELECT * FROM order_items WHERE idOrder = orderId;
  SELECT * FROM inventory_histories WHERE idOrder = orderId;

  
  COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for test
-- ----------------------------
DROP PROCEDURE IF EXISTS `test`;
delimiter ;;
CREATE PROCEDURE `test`(IN idUser INT,
    IN orderCode VARCHAR(255),
    IN paymentMethod VARCHAR(255),
    IN totalAmount DECIMAL(10,2),
    IN recipientName VARCHAR(255),
    IN recipientPhone VARCHAR(20),
    IN shippingAddress VARCHAR(255),
    IN shippingCompany VARCHAR(255),
    IN shippingCode VARCHAR(255),
    IN isDelete TINYINT,
    IN districtId INT,
    IN wardCode VARCHAR(50),
    IN items JSON)
BEGIN
  DECLARE orderId INT;
  DECLARE idx INT DEFAULT 0;
  DECLARE total_items INT;
  DECLARE current_item JSON;
  DECLARE idVariant INT;
  DECLARE amount INT;

  
  START TRANSACTION;

  
  INSERT INTO orders_v2 (
      idUser,
      `code`,
      orderDate,
      paymentMethod,
      total,
      recipientName,
      recipientPhone,
      shippingAddress,
      shippingCompany,
      shippingCode,
      isDelete,
      districtId,
      wardCode
  )
  VALUES (
      idUser,              
      orderCode,           
      NOW(),               
      paymentMethod,       
      totalAmount,         
      recipientName,       
      recipientPhone,      
      shippingAddress,     
      shippingCompany,     
      shippingCode,        
      isDelete,            
      districtId,          
      wardCode             
  );

  
  SET orderId := LAST_INSERT_ID();

  
  SET total_items = JSON_LENGTH(items);
  
  
  WHILE idx < total_items DO
      SET current_item = JSON_EXTRACT(items, CONCAT('$[', idx, ']'));
      SET idVariant = JSON_UNQUOTE(JSON_EXTRACT(current_item, '$.idVariant'));
      SET amount = JSON_UNQUOTE(JSON_EXTRACT(current_item, '$.amount'));

      
      CALL InsertOrderItem(orderId, idVariant, amount);

      SET idx = idx + 1;
  END WHILE;
  
  
  SELECT * FROM orders_v2 WHERE id = orderId;
  SELECT * FROM order_items WHERE idOrder = orderId;

  
  ROLLBACK;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
