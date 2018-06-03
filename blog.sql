/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 03/06/2018 11:01:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `categories_slug_unique`(`slug`) USING BTREE,
  INDEX `categories_parent_id_foreign`(`parent_id`) USING BTREE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, NULL, 1, 'Category 1', 'category-1', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `categories` VALUES (2, NULL, 1, 'Category 2', 'category-2', '2018-06-02 08:54:02', '2018-06-02 08:54:02');

-- ----------------------------
-- Table structure for data_rows
-- ----------------------------
DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE `data_rows`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `data_rows_data_type_id_foreign`(`data_type_id`) USING BTREE,
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_rows
-- ----------------------------
INSERT INTO `data_rows` VALUES (1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1);
INSERT INTO `data_rows` VALUES (2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2);
INSERT INTO `data_rows` VALUES (3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '', 3);
INSERT INTO `data_rows` VALUES (4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '', 4);
INSERT INTO `data_rows` VALUES (5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '', 5);
INSERT INTO `data_rows` VALUES (6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '', 6);
INSERT INTO `data_rows` VALUES (7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 7);
INSERT INTO `data_rows` VALUES (8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '', 8);
INSERT INTO `data_rows` VALUES (9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\"}', 10);
INSERT INTO `data_rows` VALUES (10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11);
INSERT INTO `data_rows` VALUES (11, 1, 'locale', 'text', 'Locale', 0, 1, 1, 1, 1, 0, '', 12);
INSERT INTO `data_rows` VALUES (12, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '', 12);
INSERT INTO `data_rows` VALUES (13, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1);
INSERT INTO `data_rows` VALUES (14, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2);
INSERT INTO `data_rows` VALUES (15, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3);
INSERT INTO `data_rows` VALUES (16, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4);
INSERT INTO `data_rows` VALUES (17, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1);
INSERT INTO `data_rows` VALUES (18, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2);
INSERT INTO `data_rows` VALUES (19, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3);
INSERT INTO `data_rows` VALUES (20, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4);
INSERT INTO `data_rows` VALUES (21, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '', 5);
INSERT INTO `data_rows` VALUES (22, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, '', 9);
INSERT INTO `data_rows` VALUES (23, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1);
INSERT INTO `data_rows` VALUES (24, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2);
INSERT INTO `data_rows` VALUES (25, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3);
INSERT INTO `data_rows` VALUES (26, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 4);
INSERT INTO `data_rows` VALUES (27, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5);
INSERT INTO `data_rows` VALUES (28, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '', 6);
INSERT INTO `data_rows` VALUES (29, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 7);
INSERT INTO `data_rows` VALUES (30, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1);
INSERT INTO `data_rows` VALUES (31, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, '', 2);
INSERT INTO `data_rows` VALUES (32, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, '', 3);
INSERT INTO `data_rows` VALUES (33, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '', 4);
INSERT INTO `data_rows` VALUES (34, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, '', 5);
INSERT INTO `data_rows` VALUES (35, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '', 6);
INSERT INTO `data_rows` VALUES (36, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7);
INSERT INTO `data_rows` VALUES (37, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8);
INSERT INTO `data_rows` VALUES (38, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, '', 9);
INSERT INTO `data_rows` VALUES (39, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, '', 10);
INSERT INTO `data_rows` VALUES (40, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11);
INSERT INTO `data_rows` VALUES (41, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '', 12);
INSERT INTO `data_rows` VALUES (42, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 13);
INSERT INTO `data_rows` VALUES (43, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, '', 14);
INSERT INTO `data_rows` VALUES (44, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, '', 15);
INSERT INTO `data_rows` VALUES (45, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1);
INSERT INTO `data_rows` VALUES (46, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, '', 2);
INSERT INTO `data_rows` VALUES (47, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '', 3);
INSERT INTO `data_rows` VALUES (48, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, '', 4);
INSERT INTO `data_rows` VALUES (49, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '', 5);
INSERT INTO `data_rows` VALUES (50, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6);
INSERT INTO `data_rows` VALUES (51, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, '', 7);
INSERT INTO `data_rows` VALUES (52, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, '', 8);
INSERT INTO `data_rows` VALUES (53, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9);
INSERT INTO `data_rows` VALUES (54, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, '', 10);
INSERT INTO `data_rows` VALUES (55, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '', 11);
INSERT INTO `data_rows` VALUES (56, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, '', 12);
INSERT INTO `data_rows` VALUES (57, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1);
INSERT INTO `data_rows` VALUES (58, 7, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2);
INSERT INTO `data_rows` VALUES (59, 7, 'age', 'text', 'Age', 0, 1, 1, 1, 1, 1, NULL, 3);
INSERT INTO `data_rows` VALUES (60, 7, 'money', 'text', 'Money', 0, 1, 1, 1, 1, 1, NULL, 4);
INSERT INTO `data_rows` VALUES (61, 7, 'country', 'text', 'Country', 0, 1, 1, 1, 1, 1, NULL, 5);

-- ----------------------------
-- Table structure for data_types
-- ----------------------------
DROP TABLE IF EXISTS `data_types`;
CREATE TABLE `data_types`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `policy_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `data_types_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `data_types_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_types
-- ----------------------------
INSERT INTO `data_types` VALUES (1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '', '', 1, 0, NULL, '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `data_types` VALUES (2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `data_types` VALUES (3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `data_types` VALUES (4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `data_types` VALUES (5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `data_types` VALUES (6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `data_types` VALUES (7, 'donators', 'donators', 'Donator', 'Donators', NULL, 'App\\Donator', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-06-03 02:36:52', '2018-06-03 02:36:52');

-- ----------------------------
-- Table structure for donators
-- ----------------------------
DROP TABLE IF EXISTS `donators`;
CREATE TABLE `donators`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donators
-- ----------------------------
INSERT INTO `donators` VALUES (1, 'Melvin Antonia', '48', '11496902', 'Denmark', NULL, NULL);
INSERT INTO `donators` VALUES (2, 'Ashvini January', '55', '6642860', 'America', NULL, NULL);
INSERT INTO `donators` VALUES (3, 'Joni Ananya', '19', '18651582', 'Switzerland', NULL, NULL);
INSERT INTO `donators` VALUES (4, 'Riker Parker', '54', '13950276', 'Switzerland', NULL, NULL);
INSERT INTO `donators` VALUES (5, 'Zyana Uriel', '27', '14391540', 'America', NULL, NULL);
INSERT INTO `donators` VALUES (6, 'Rhonda Aida', '26', '8666923', 'America', NULL, NULL);
INSERT INTO `donators` VALUES (7, 'Hans Camden', '47', '19033417', 'Denmark', NULL, NULL);
INSERT INTO `donators` VALUES (8, 'Nadine Corey', '42', '2940828', 'Switzerland', NULL, NULL);
INSERT INTO `donators` VALUES (9, 'Beccy Arjun', '49', '11501528', 'Switzerland', NULL, NULL);
INSERT INTO `donators` VALUES (10, 'Rayne Foster', '36', '11174322', 'Singapore', NULL, NULL);
INSERT INTO `donators` VALUES (11, 'Emmeline Haden', '29', '12379481', 'Denmark', NULL, NULL);
INSERT INTO `donators` VALUES (12, 'Angelica Blaze', '37', '632661', 'Australia', NULL, NULL);
INSERT INTO `donators` VALUES (13, 'Kalea Lucas', '29', '16179334', 'Norway', NULL, NULL);
INSERT INTO `donators` VALUES (14, 'Seamus Alfie', '33', '12293305', 'Germany', NULL, NULL);
INSERT INTO `donators` VALUES (15, 'Winter Clement', '57', '4825490', 'Denmark', NULL, NULL);
INSERT INTO `donators` VALUES (16, 'Sean Rosalind', '25', '7862569', 'America', NULL, NULL);
INSERT INTO `donators` VALUES (17, 'Jody Flo', '51', '1541011', 'America', NULL, NULL);
INSERT INTO `donators` VALUES (18, 'Enya Jonas', '31', '9665064', 'Germany', NULL, NULL);
INSERT INTO `donators` VALUES (19, 'Aida Autumn', '56', '11764937', 'Switzerland', NULL, NULL);
INSERT INTO `donators` VALUES (20, 'Ivana Gabe', '57', '11760381', 'Australia', NULL, NULL);
INSERT INTO `donators` VALUES (21, 'Staci Marlene', '50', '2983017', 'Norway', NULL, NULL);
INSERT INTO `donators` VALUES (22, 'Tess Jericho', '41', '6857897', 'Australia', NULL, NULL);
INSERT INTO `donators` VALUES (23, 'Molly Jan', '60', '16656951', 'Switzerland', NULL, NULL);
INSERT INTO `donators` VALUES (24, 'Zac Lilly', '21', '8459816', 'Germany', NULL, NULL);
INSERT INTO `donators` VALUES (25, 'Zuriel Clayton', '48', '9777783', 'Australia', NULL, NULL);
INSERT INTO `donators` VALUES (26, 'Malcolm Dorothy', '26', '3898013', 'Norway', NULL, NULL);
INSERT INTO `donators` VALUES (27, 'Alexis Adeline', '28', '18836791', 'Australia', NULL, NULL);
INSERT INTO `donators` VALUES (28, 'Lindsay Kellan', '36', '2577816', 'Norway', NULL, NULL);
INSERT INTO `donators` VALUES (29, 'Vince Yvaine', '54', '41461', 'Switzerland', NULL, NULL);
INSERT INTO `donators` VALUES (30, 'Patrick Daniella', '30', '13823604', 'Norway', NULL, NULL);
INSERT INTO `donators` VALUES (31, 'Chenille Jago', '55', '9224162', 'Denmark', NULL, NULL);
INSERT INTO `donators` VALUES (32, 'Macey Mika', '30', '13455648', 'Australia', NULL, NULL);
INSERT INTO `donators` VALUES (33, 'Yelena Carole', '44', '10888158', 'Denmark', NULL, NULL);
INSERT INTO `donators` VALUES (34, 'Imelda Quentin', '47', '11474627', 'Singapore', NULL, NULL);
INSERT INTO `donators` VALUES (35, 'Eli Luciana', '31', '10770540', 'Singapore', NULL, NULL);
INSERT INTO `donators` VALUES (36, 'Alexandra Martha', '26', '8122984', 'Denmark', NULL, NULL);
INSERT INTO `donators` VALUES (37, 'Ryker Jericho', '39', '16617465', 'America', NULL, NULL);
INSERT INTO `donators` VALUES (38, 'Lilita Margie', '57', '17961498', 'Switzerland', NULL, NULL);
INSERT INTO `donators` VALUES (39, 'Roland Salome', '42', '11965271', 'America', NULL, NULL);
INSERT INTO `donators` VALUES (40, 'Sloane Lisa', '52', '6545485', 'Switzerland', NULL, NULL);
INSERT INTO `donators` VALUES (41, 'Terence Myla', '23', '4123634', 'America', NULL, NULL);
INSERT INTO `donators` VALUES (42, 'Livvy Pippa', '44', '1035429', 'Denmark', NULL, NULL);
INSERT INTO `donators` VALUES (43, 'Jeannine Margaux', '40', '6671833', 'Germany', NULL, NULL);
INSERT INTO `donators` VALUES (44, 'Nikolai Kaleigh', '33', '9378361', 'Germany', NULL, NULL);
INSERT INTO `donators` VALUES (45, 'Coral Juno', '51', '3883618', 'Switzerland', NULL, NULL);
INSERT INTO `donators` VALUES (46, 'Edouard Andy', '48', '18875115', 'Norway', NULL, NULL);
INSERT INTO `donators` VALUES (47, 'Robert Phoebe', '34', '12636509', 'Singapore', NULL, NULL);
INSERT INTO `donators` VALUES (48, 'Zelda Marjorie', '19', '14566239', 'Switzerland', NULL, NULL);
INSERT INTO `donators` VALUES (49, 'Klay Emmie', '27', '6358623', 'America', NULL, NULL);
INSERT INTO `donators` VALUES (50, 'Dirk Jazz', '55', '14619836', 'Singapore', NULL, NULL);
INSERT INTO `donators` VALUES (51, 'Tami Jude', '49', '2344057', 'Germany', NULL, NULL);
INSERT INTO `donators` VALUES (52, 'Valery Caitlan', '53', '4791293', 'Denmark', NULL, NULL);
INSERT INTO `donators` VALUES (53, 'Nellie Lyndsey', '56', '6410184', 'Germany', NULL, NULL);
INSERT INTO `donators` VALUES (54, 'Noelle Jacinda', '54', '7101715', 'Switzerland', NULL, NULL);
INSERT INTO `donators` VALUES (55, 'Castiel Deja', '52', '7335152', 'Germany', NULL, NULL);
INSERT INTO `donators` VALUES (56, 'Alec Tina', '20', '6843051', 'Australia', NULL, NULL);
INSERT INTO `donators` VALUES (57, 'Salome Aida', '41', '3864555', 'Norway', NULL, NULL);
INSERT INTO `donators` VALUES (58, 'Tracey Fernand', '50', '2039853', 'America', NULL, NULL);
INSERT INTO `donators` VALUES (59, 'Luisa Darragh', '55', '7288088', 'America', NULL, NULL);
INSERT INTO `donators` VALUES (60, 'Kelly Asha', '39', '14689905', 'Singapore', NULL, NULL);
INSERT INTO `donators` VALUES (61, 'Zackery Morgan', '39', '12643331', 'America', NULL, NULL);
INSERT INTO `donators` VALUES (62, 'Athan Louis', '28', '10286658', 'Denmark', NULL, NULL);
INSERT INTO `donators` VALUES (63, 'Catherine Jeanette', '40', '801962', 'Australia', NULL, NULL);
INSERT INTO `donators` VALUES (64, 'Wade Jovan', '53', '10086706', 'Germany', NULL, NULL);
INSERT INTO `donators` VALUES (65, 'Jason Dayna', '51', '6600808', 'Australia', NULL, NULL);
INSERT INTO `donators` VALUES (66, 'Marley Elana', '19', '11036796', 'Norway', NULL, NULL);
INSERT INTO `donators` VALUES (67, 'Madyson Nicki', '41', '18558423', 'Denmark', NULL, NULL);
INSERT INTO `donators` VALUES (68, 'Bret Chrystal', '25', '6227852', 'Norway', NULL, NULL);
INSERT INTO `donators` VALUES (69, 'Cassandra Makenzie', '28', '11600542', 'Denmark', NULL, NULL);
INSERT INTO `donators` VALUES (70, 'Rayna Charlize', '58', '7369336', 'America', NULL, NULL);
INSERT INTO `donators` VALUES (71, 'Tristan Kayden', '36', '7752784', 'Singapore', NULL, NULL);
INSERT INTO `donators` VALUES (72, 'Mikaela Ken', '23', '4127539', 'Denmark', NULL, NULL);
INSERT INTO `donators` VALUES (73, 'Phil Clarabelle', '20', '1013583', 'Norway', NULL, NULL);
INSERT INTO `donators` VALUES (74, 'Indie Lolita', '39', '10253351', 'Switzerland', NULL, NULL);
INSERT INTO `donators` VALUES (75, 'Emmalyn Maja', '42', '8949555', 'Germany', NULL, NULL);
INSERT INTO `donators` VALUES (76, 'Josiah Kara', '36', '1868064', 'Singapore', NULL, NULL);
INSERT INTO `donators` VALUES (77, 'Brett Penelope', '37', '7247171', 'Australia', NULL, NULL);
INSERT INTO `donators` VALUES (78, 'Cheyanne Mabel', '37', '15661834', 'Norway', NULL, NULL);
INSERT INTO `donators` VALUES (79, 'Jeremy Skylar', '37', '16437725', 'Switzerland', NULL, NULL);
INSERT INTO `donators` VALUES (80, 'Dara Gary', '31', '8378092', 'Norway', NULL, NULL);
INSERT INTO `donators` VALUES (81, 'Addison Merida', '37', '9033430', 'Denmark', NULL, NULL);
INSERT INTO `donators` VALUES (82, 'Petar Godric', '29', '18389550', 'Switzerland', NULL, NULL);
INSERT INTO `donators` VALUES (83, 'Trevon Galen', '36', '17425400', 'Denmark', NULL, NULL);
INSERT INTO `donators` VALUES (84, 'Carey Annabeth', '51', '14468871', 'Norway', NULL, NULL);
INSERT INTO `donators` VALUES (85, 'Cailin Zahra', '22', '16179538', 'America', NULL, NULL);
INSERT INTO `donators` VALUES (86, 'Quinn Yestin', '57', '2649628', 'America', NULL, NULL);
INSERT INTO `donators` VALUES (87, 'Nate Eliana', '41', '15269268', 'Singapore', NULL, NULL);
INSERT INTO `donators` VALUES (88, 'Jorja Mateo', '27', '9091940', 'Denmark', NULL, NULL);
INSERT INTO `donators` VALUES (89, 'Amethyst Beatrix', '39', '110577', 'Norway', NULL, NULL);
INSERT INTO `donators` VALUES (90, 'Safire Joyce', '44', '16441046', 'Norway', NULL, NULL);
INSERT INTO `donators` VALUES (91, 'Mary Christa', '47', '3079830', 'America', NULL, NULL);
INSERT INTO `donators` VALUES (92, 'Clover Erin', '40', '8536307', 'Denmark', NULL, NULL);
INSERT INTO `donators` VALUES (93, 'Jayda Brett', '60', '15478413', 'Denmark', NULL, NULL);
INSERT INTO `donators` VALUES (94, 'Elsa Claude', '25', '12346557', 'Australia', NULL, NULL);
INSERT INTO `donators` VALUES (95, 'Stuart Julianne', '52', '10682326', 'America', NULL, NULL);
INSERT INTO `donators` VALUES (96, 'Agnes Kaylie', '60', '1715567', 'Singapore', NULL, NULL);
INSERT INTO `donators` VALUES (97, 'Lorna Sally', '45', '13154160', 'Switzerland', NULL, NULL);
INSERT INTO `donators` VALUES (98, 'Helena Gianna', '45', '18442948', 'Australia', NULL, NULL);
INSERT INTO `donators` VALUES (99, 'Chip Jazlyn', '40', '9084898', 'Germany', NULL, NULL);
INSERT INTO `donators` VALUES (100, 'tom', '23', '10000', 'Chiana', '2018-06-03 02:57:57', '2018-06-03 02:57:57');

-- ----------------------------
-- Table structure for menu_items
-- ----------------------------
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `menu_items_menu_id_foreign`(`menu_id`) USING BTREE,
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_items
-- ----------------------------
INSERT INTO `menu_items` VALUES (1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2018-06-02 08:54:02', '2018-06-02 08:54:02', 'voyager.dashboard', NULL);
INSERT INTO `menu_items` VALUES (2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2018-06-02 08:54:02', '2018-06-02 08:54:02', 'voyager.media.index', NULL);
INSERT INTO `menu_items` VALUES (3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2018-06-02 08:54:02', '2018-06-02 08:54:02', 'voyager.users.index', NULL);
INSERT INTO `menu_items` VALUES (4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2018-06-02 08:54:02', '2018-06-02 08:54:02', 'voyager.roles.index', NULL);
INSERT INTO `menu_items` VALUES (5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2018-06-02 08:54:02', '2018-06-02 08:54:02', NULL, NULL);
INSERT INTO `menu_items` VALUES (6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2018-06-02 08:54:02', '2018-06-02 08:54:02', 'voyager.menus.index', NULL);
INSERT INTO `menu_items` VALUES (7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2018-06-02 08:54:02', '2018-06-02 08:54:02', 'voyager.database.index', NULL);
INSERT INTO `menu_items` VALUES (8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2018-06-02 08:54:02', '2018-06-02 08:54:02', 'voyager.compass.index', NULL);
INSERT INTO `menu_items` VALUES (9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2018-06-02 08:54:02', '2018-06-02 08:54:02', 'voyager.bread.index', NULL);
INSERT INTO `menu_items` VALUES (10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2018-06-02 08:54:02', '2018-06-02 08:54:02', 'voyager.settings.index', NULL);
INSERT INTO `menu_items` VALUES (11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2018-06-02 08:54:02', '2018-06-02 08:54:02', 'voyager.categories.index', NULL);
INSERT INTO `menu_items` VALUES (12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2018-06-02 08:54:02', '2018-06-02 08:54:02', 'voyager.posts.index', NULL);
INSERT INTO `menu_items` VALUES (13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2018-06-02 08:54:02', '2018-06-02 08:54:02', 'voyager.pages.index', NULL);
INSERT INTO `menu_items` VALUES (14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2018-06-02 08:54:03', '2018-06-02 08:54:03', 'voyager.hooks', NULL);
INSERT INTO `menu_items` VALUES (15, 1, 'Donators', '', '_self', NULL, NULL, NULL, 15, '2018-06-03 02:36:52', '2018-06-03 02:36:52', 'voyager.donators.index', NULL);

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `menus_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, 'admin', '2018-06-02 08:54:02', '2018-06-02 08:54:02');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_01_000000_add_voyager_user_fields', 2);
INSERT INTO `migrations` VALUES (4, '2016_01_01_000000_create_data_types_table', 2);
INSERT INTO `migrations` VALUES (5, '2016_05_19_173453_create_menu_table', 2);
INSERT INTO `migrations` VALUES (6, '2016_10_21_190000_create_roles_table', 2);
INSERT INTO `migrations` VALUES (7, '2016_10_21_190000_create_settings_table', 2);
INSERT INTO `migrations` VALUES (8, '2016_11_30_135954_create_permission_table', 2);
INSERT INTO `migrations` VALUES (9, '2016_11_30_141208_create_permission_role_table', 2);
INSERT INTO `migrations` VALUES (10, '2016_12_26_201236_data_types__add__server_side', 2);
INSERT INTO `migrations` VALUES (11, '2017_01_13_000000_add_route_to_menu_items_table', 2);
INSERT INTO `migrations` VALUES (12, '2017_01_14_005015_create_translations_table', 2);
INSERT INTO `migrations` VALUES (13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 2);
INSERT INTO `migrations` VALUES (14, '2017_03_06_000000_add_controller_to_data_types_table', 2);
INSERT INTO `migrations` VALUES (15, '2017_04_21_000000_add_order_to_data_rows_table', 2);
INSERT INTO `migrations` VALUES (16, '2017_07_05_210000_add_policyname_to_data_types_table', 2);
INSERT INTO `migrations` VALUES (17, '2017_08_05_000000_add_group_to_settings_table', 2);
INSERT INTO `migrations` VALUES (18, '2017_11_26_013050_add_user_role_relationship', 2);
INSERT INTO `migrations` VALUES (19, '2017_11_26_015000_create_user_roles_table', 2);
INSERT INTO `migrations` VALUES (20, '2018_03_11_000000_add_user_settings', 2);
INSERT INTO `migrations` VALUES (21, '2018_03_14_000000_add_details_to_data_types_table', 2);
INSERT INTO `migrations` VALUES (22, '2018_03_16_000000_make_settings_value_nullable', 2);
INSERT INTO `migrations` VALUES (23, '2016_01_01_000000_create_pages_table', 3);
INSERT INTO `migrations` VALUES (24, '2016_01_01_000000_create_posts_table', 3);
INSERT INTO `migrations` VALUES (25, '2016_02_15_204651_create_categories_table', 3);
INSERT INTO `migrations` VALUES (26, '2017_04_11_000000_alter_post_nullable_fields_table', 3);

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` enum('ACTIVE','INACTIVE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pages_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES (1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2018-06-02 08:54:02', '2018-06-02 08:54:02');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role`  (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `permission_role_permission_id_index`(`permission_id`) USING BTREE,
  INDEX `permission_role_role_id_index`(`role_id`) USING BTREE,
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES (1, 1);
INSERT INTO `permission_role` VALUES (1, 2);
INSERT INTO `permission_role` VALUES (2, 1);
INSERT INTO `permission_role` VALUES (2, 2);
INSERT INTO `permission_role` VALUES (3, 1);
INSERT INTO `permission_role` VALUES (3, 2);
INSERT INTO `permission_role` VALUES (4, 1);
INSERT INTO `permission_role` VALUES (4, 2);
INSERT INTO `permission_role` VALUES (5, 1);
INSERT INTO `permission_role` VALUES (5, 2);
INSERT INTO `permission_role` VALUES (6, 1);
INSERT INTO `permission_role` VALUES (6, 2);
INSERT INTO `permission_role` VALUES (7, 1);
INSERT INTO `permission_role` VALUES (7, 2);
INSERT INTO `permission_role` VALUES (8, 1);
INSERT INTO `permission_role` VALUES (8, 2);
INSERT INTO `permission_role` VALUES (9, 1);
INSERT INTO `permission_role` VALUES (9, 2);
INSERT INTO `permission_role` VALUES (10, 1);
INSERT INTO `permission_role` VALUES (10, 2);
INSERT INTO `permission_role` VALUES (11, 1);
INSERT INTO `permission_role` VALUES (11, 2);
INSERT INTO `permission_role` VALUES (12, 1);
INSERT INTO `permission_role` VALUES (12, 2);
INSERT INTO `permission_role` VALUES (13, 1);
INSERT INTO `permission_role` VALUES (13, 2);
INSERT INTO `permission_role` VALUES (14, 1);
INSERT INTO `permission_role` VALUES (14, 2);
INSERT INTO `permission_role` VALUES (15, 1);
INSERT INTO `permission_role` VALUES (15, 2);
INSERT INTO `permission_role` VALUES (16, 1);
INSERT INTO `permission_role` VALUES (16, 2);
INSERT INTO `permission_role` VALUES (17, 1);
INSERT INTO `permission_role` VALUES (17, 2);
INSERT INTO `permission_role` VALUES (18, 1);
INSERT INTO `permission_role` VALUES (18, 2);
INSERT INTO `permission_role` VALUES (19, 1);
INSERT INTO `permission_role` VALUES (19, 2);
INSERT INTO `permission_role` VALUES (20, 1);
INSERT INTO `permission_role` VALUES (20, 2);
INSERT INTO `permission_role` VALUES (21, 1);
INSERT INTO `permission_role` VALUES (22, 1);
INSERT INTO `permission_role` VALUES (23, 1);
INSERT INTO `permission_role` VALUES (24, 1);
INSERT INTO `permission_role` VALUES (25, 1);
INSERT INTO `permission_role` VALUES (26, 1);
INSERT INTO `permission_role` VALUES (26, 2);
INSERT INTO `permission_role` VALUES (27, 1);
INSERT INTO `permission_role` VALUES (27, 2);
INSERT INTO `permission_role` VALUES (28, 1);
INSERT INTO `permission_role` VALUES (28, 2);
INSERT INTO `permission_role` VALUES (29, 1);
INSERT INTO `permission_role` VALUES (29, 2);
INSERT INTO `permission_role` VALUES (30, 1);
INSERT INTO `permission_role` VALUES (30, 2);
INSERT INTO `permission_role` VALUES (31, 1);
INSERT INTO `permission_role` VALUES (32, 1);
INSERT INTO `permission_role` VALUES (33, 1);
INSERT INTO `permission_role` VALUES (34, 1);
INSERT INTO `permission_role` VALUES (35, 1);
INSERT INTO `permission_role` VALUES (36, 1);
INSERT INTO `permission_role` VALUES (37, 1);
INSERT INTO `permission_role` VALUES (38, 1);
INSERT INTO `permission_role` VALUES (39, 1);
INSERT INTO `permission_role` VALUES (40, 1);
INSERT INTO `permission_role` VALUES (41, 2);
INSERT INTO `permission_role` VALUES (42, 1);
INSERT INTO `permission_role` VALUES (42, 2);
INSERT INTO `permission_role` VALUES (43, 1);
INSERT INTO `permission_role` VALUES (43, 2);
INSERT INTO `permission_role` VALUES (44, 1);
INSERT INTO `permission_role` VALUES (44, 2);
INSERT INTO `permission_role` VALUES (45, 1);
INSERT INTO `permission_role` VALUES (45, 2);
INSERT INTO `permission_role` VALUES (46, 1);
INSERT INTO `permission_role` VALUES (46, 2);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `permissions_key_index`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'browse_admin', NULL, '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (2, 'browse_bread', NULL, '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (3, 'browse_database', NULL, '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (4, 'browse_media', NULL, '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (5, 'browse_compass', NULL, '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (6, 'browse_menus', 'menus', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (7, 'read_menus', 'menus', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (8, 'edit_menus', 'menus', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (9, 'add_menus', 'menus', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (10, 'delete_menus', 'menus', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (11, 'browse_roles', 'roles', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (12, 'read_roles', 'roles', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (13, 'edit_roles', 'roles', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (14, 'add_roles', 'roles', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (15, 'delete_roles', 'roles', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (16, 'browse_users', 'users', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (17, 'read_users', 'users', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (18, 'edit_users', 'users', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (19, 'add_users', 'users', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (20, 'delete_users', 'users', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (21, 'browse_settings', 'settings', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (22, 'read_settings', 'settings', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (23, 'edit_settings', 'settings', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (24, 'add_settings', 'settings', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (25, 'delete_settings', 'settings', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (26, 'browse_categories', 'categories', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (27, 'read_categories', 'categories', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (28, 'edit_categories', 'categories', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (29, 'add_categories', 'categories', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (30, 'delete_categories', 'categories', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (31, 'browse_posts', 'posts', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (32, 'read_posts', 'posts', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (33, 'edit_posts', 'posts', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (34, 'add_posts', 'posts', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (35, 'delete_posts', 'posts', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (36, 'browse_pages', 'pages', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (37, 'read_pages', 'pages', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (38, 'edit_pages', 'pages', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (39, 'add_pages', 'pages', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (40, 'delete_pages', 'pages', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `permissions` VALUES (41, 'browse_hooks', NULL, '2018-06-02 08:54:03', '2018-06-02 08:54:03');
INSERT INTO `permissions` VALUES (42, 'browse_donators', 'donators', '2018-06-03 02:36:52', '2018-06-03 02:36:52');
INSERT INTO `permissions` VALUES (43, 'read_donators', 'donators', '2018-06-03 02:36:52', '2018-06-03 02:36:52');
INSERT INTO `permissions` VALUES (44, 'edit_donators', 'donators', '2018-06-03 02:36:52', '2018-06-03 02:36:52');
INSERT INTO `permissions` VALUES (45, 'add_donators', 'donators', '2018-06-03 02:36:52', '2018-06-03 02:36:52');
INSERT INTO `permissions` VALUES (46, 'delete_donators', 'donators', '2018-06-03 02:36:52', '2018-06-03 02:36:52');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `posts_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `posts` VALUES (2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `posts` VALUES (3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `posts` VALUES (4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-06-02 08:54:02', '2018-06-02 08:54:02');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'admin', 'Administrator', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `roles` VALUES (2, 'user', 'Normal User', '2018-06-02 08:54:02', '2018-06-02 08:54:02');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `settings_key_unique`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site');
INSERT INTO `settings` VALUES (2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site');
INSERT INTO `settings` VALUES (3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site');
INSERT INTO `settings` VALUES (4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site');
INSERT INTO `settings` VALUES (5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin');
INSERT INTO `settings` VALUES (6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin');
INSERT INTO `settings` VALUES (7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin');
INSERT INTO `settings` VALUES (8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin');
INSERT INTO `settings` VALUES (9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin');
INSERT INTO `settings` VALUES (10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- ----------------------------
-- Table structure for translations
-- ----------------------------
DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `translations_table_name_column_name_foreign_key_locale_unique`(`table_name`, `column_name`, `foreign_key`, `locale`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of translations
-- ----------------------------
INSERT INTO `translations` VALUES (1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (21, 'menu_items', 'title', 2, 'pt', 'Media', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (26, 'menu_items', 'title', 4, 'pt', 'Funções', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (28, 'menu_items', 'title', 6, 'pt', 'Menus', '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `translations` VALUES (29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2018-06-02 08:54:03', '2018-06-02 08:54:03');
INSERT INTO `translations` VALUES (30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2018-06-02 08:54:03', '2018-06-02 08:54:03');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `user_roles_user_id_index`(`user_id`) USING BTREE,
  INDEX `user_roles_role_id_index`(`role_id`) USING BTREE,
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'users/default.png',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  INDEX `users_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 1, 'Admin', 'admin@admin.com', 'users/default.png', '$2y$10$f5syYIOYq9yoy9/hHXmIz.mVGubkHWaTKffEPpQcPAp3ePHUwf45G', '84FNOTLktQAN8j8KSHFJhbFC8eJShKaHR0lHh1bZxp3u36ocMV2PFLXP4i7B', NULL, '2018-06-02 08:54:02', '2018-06-02 08:54:02');
INSERT INTO `users` VALUES (2, 1, 'tianhaoo', '360726539@qq.com', 'users/default.png', '$2y$10$EjjLuglswqA7K2IHRdbctOS9r.VhVS9SKLHblIETroz0gcJeSatIi', 'dpMOJnGLuCZJLJgpjwNkRac8EKZMXnfRUxsYfzKfVY1sw0Bjd1JKOpLL5sEc', '{\"locale\":\"en\"}', '2018-06-03 02:45:47', '2018-06-03 02:46:33');

SET FOREIGN_KEY_CHECKS = 1;
