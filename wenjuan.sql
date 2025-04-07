/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306-80
 Source Server Type    : MySQL
 Source Server Version : 80400
 Source Host           : localhost:3306
 Source Schema         : wenjuan

 Target Server Type    : MySQL
 Target Server Version : 80400
 File Encoding         : 65001

 Date: 07/04/2025 21:43:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ac_user
-- ----------------------------
DROP TABLE IF EXISTS `ac_user`;
CREATE TABLE `ac_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `avatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `gender` tinyint(1) NOT NULL DEFAULT 0 COMMENT '性别0未知 1男2女',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone_number` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `reg_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '注册渠道',
  `last_login_channel` tinyint NULL DEFAULT NULL COMMENT '最后登录渠道',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录Ip',
  `password_type` tinyint(1) NULL DEFAULT 0 COMMENT '密码类型',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '状态',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15672 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ac_user
-- ----------------------------
INSERT INTO `ac_user` VALUES (1, 'admin', 'http://localhost:8999/u/c4ca4238a0b923820dcc509a6f75849b/4db100f1b994494ca5093439f269bfad.png', 1, '1234@qq.com', NULL, '$2a$10$FgOTdkh3qVLE9DNgD4XzDu2PCJB3QtnGbriBPaMhMKTVWM9XYsiIm', '1', 2, '2025-04-07 21:37:52', '127.0.0.1', 1, 0, '2021-06-13 13:49:25', '2025-04-07 21:37:52');
INSERT INTO `ac_user` VALUES (15672, '环书南', 'https://s1.locimg.com/2023/05/16/17db376b12ec4.png', 0, '21323123@qq.com', NULL, '$2a$10$f3gwUVHNt/WpTq6NDH//KuR5KJAP9QPK5Bb/0UOKqDy6wVBsIr2FC', '2', NULL, NULL, NULL, 1, 0, '2025-04-07 04:50:35', '2025-04-07 04:50:35');
INSERT INTO `ac_user` VALUES (15673, '硕成天', 'https://s1.locimg.com/2023/05/16/17db376b12ec4.png', 0, '123987@qq.com', NULL, '$2a$10$lMYn/v1qolm78muDq4Y4mOCCnbqtAo2LFPKuBBir91f.L5V5LroE6', '2', NULL, NULL, NULL, 1, 0, '2025-04-07 04:51:54', '2025-04-07 04:51:54');
INSERT INTO `ac_user` VALUES (15674, '郸俊杰', 'https://s1.locimg.com/2023/05/16/17db376b12ec4.png', 0, '12345@qq.com', NULL, '$2a$10$l/dCVy1LHP.HeG3vaWPtQ.ul/ClqR4eshUSMgnK40idmLskLfqSW6', '2', 2, '2025-04-07 04:52:46', '127.0.0.1', 1, 0, '2025-04-07 04:52:27', '2025-04-07 04:52:46');
INSERT INTO `ac_user` VALUES (15675, '慕容半双', 'https://s1.locimg.com/2023/05/16/17db376b12ec4.png', 0, '123@qq.com', NULL, '$2a$10$qXxyLFJHcBWhwqe75gVuoOYspQGtTXW9AtnEGlZmVu61bDheSWtDe', '2', 2, '2025-04-07 18:42:53', '127.0.0.1', 1, 0, '2025-04-07 05:32:48', '2025-04-07 18:42:53');

-- ----------------------------
-- Table structure for ac_user_authorize
-- ----------------------------
DROP TABLE IF EXISTS `ac_user_authorize`;
CREATE TABLE `ac_user_authorize`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '第三方平台类型',
  `app_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台AppId',
  `open_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台OpenId',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台用户名',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户Id',
  `user_info` json NULL COMMENT '平台用户信息',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `open_id`(`open_id`, `type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '第三方用户授权信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ac_user_authorize
-- ----------------------------

-- ----------------------------
-- Table structure for ac_user_token
-- ----------------------------
DROP TABLE IF EXISTS `ac_user_token`;
CREATE TABLE `ac_user_token`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL DEFAULT 0 COMMENT '类型',
  `user_id` bigint NOT NULL COMMENT '用户Id',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ac_user_token
-- ----------------------------
INSERT INTO `ac_user_token` VALUES (26, 0, 15674, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxNTY3NCIsImlhdCI6MTc0Mzk3Mjc2NiwiZXhwIjoxNzQ0NTc3NTY2fQ.StWR4xukNlrtvMuNV9ftUKoqz8Hf_yGBZnJEAZKajULngjUkbh6SHU2zo2bQIXXzaMx1jPEy8VfZu8igA2-SAQ', '2025-04-14 04:52:48', '2025-04-07 04:52:48', '2025-04-07 04:52:48');
INSERT INTO `ac_user_token` VALUES (27, 0, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzQzOTczMTUxLCJleHAiOjE3NDQ1Nzc5NTF9.Ia3N659ljZjLpyefSTsAkK7mEj80UkghqQFkb1N23a1BdtmaQ-WE1aq4QnVFlCMUTR-c-ngwlqii6emxntK9TQ', '2025-04-14 04:59:11', '2025-04-07 04:59:11', '2025-04-07 04:59:11');
INSERT INTO `ac_user_token` VALUES (28, 0, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzQzOTc0NDIyLCJleHAiOjE3NDQ1NzkyMjJ9.SSCTc5ITAqQaTd-qBIv9x80PMKPEHGi9zHiFysCuykf6MCEGSancAgmB4iTvv3-EE1NQ14QVcQHnIvTe8NAZTQ', '2025-04-14 05:20:23', '2025-04-07 05:20:23', '2025-04-07 05:20:23');
INSERT INTO `ac_user_token` VALUES (29, 0, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzQzOTc1MzA4LCJleHAiOjE3NDQ1ODAxMDh9.Ndl6C1CgnRGY1xNaeyHFs0SVl5M2pJjJ3j_QiPD5KAkF3fX-Jeoir_LTQ2bEJNTaVJGLMgG7nEclDrsEYZ--gg', '2025-04-14 05:35:09', '2025-04-07 05:35:09', '2025-04-07 05:35:09');
INSERT INTO `ac_user_token` VALUES (30, 0, 15675, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxNTY3NSIsImlhdCI6MTc0Mzk3Njc0NCwiZXhwIjoxNzQ0NTgxNTQ0fQ.RPW6JRuB3xPmB4YiF0nXUwqODXCVDm-ACuDFUkQfKeut2uoKjulcdBxNDBSbRpioB9IilVcd_RJHhEJPcT4g6A', '2025-04-14 05:59:06', '2025-04-07 05:59:06', '2025-04-07 05:59:06');
INSERT INTO `ac_user_token` VALUES (31, 0, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzQzOTc3Mjk3LCJleHAiOjE3NDQ1ODIwOTd9.MIbOdSFSZfghI79cu2R4FxB0AmuaCF2XxTpMGRVREF1ZuKox0grOQiMjtwWxaZ0LwGwzKIYdGFL2Bjs4mpZS1w', '2025-04-14 06:08:17', '2025-04-07 06:08:17', '2025-04-07 06:08:17');
INSERT INTO `ac_user_token` VALUES (32, 0, 15675, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxNTY3NSIsImlhdCI6MTc0Mzk4NDY1NywiZXhwIjoxNzQ0NTg5NDU3fQ.vRA3gczc4vtYMQE1gKtNpG1iGntZlVpRlULYfzmThttrrS6Mtl6io6-xi5vxZkfncx-usp5bsn1tEqkhD8hOLA', '2025-04-14 08:10:59', '2025-04-07 08:11:00', '2025-04-07 08:11:00');
INSERT INTO `ac_user_token` VALUES (33, 0, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzQ0MDEyMjcwLCJleHAiOjE3NDQ2MTcwNzB9.v6p2GojTcvpV3XxTcXXbIlrbFOku6GxdSRuYH7GI554EQWBhLBbS7rxGxt4YSmLba_qPI-AUbbM4jRwMso02qg', '2025-04-14 15:51:11', '2025-04-07 15:51:11', '2025-04-07 15:51:11');
INSERT INTO `ac_user_token` VALUES (34, 0, 15675, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxNTY3NSIsImlhdCI6MTc0NDAxMjMwMSwiZXhwIjoxNzQ0NjE3MTAxfQ.rAEBKrvf-hLIaoHgZK1O_mfPRm7171chaal5ib_PzHzmfOsBOpRGGgATJHaFypXyyLDM1rw559WAtdjQv3GcSQ', '2025-04-14 15:51:42', '2025-04-07 15:51:42', '2025-04-07 15:51:42');
INSERT INTO `ac_user_token` VALUES (35, 0, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzQ0MDEyMzgyLCJleHAiOjE3NDQ2MTcxODJ9.vnNmdo5hI799mNcrsl8Glj1yD5aBDsm-FWVULpRe7ZVUIc7QfRSEH2eyozm_ZcxYRKhzdRmzmaw05XYt_Osh3Q', '2025-04-14 15:53:02', '2025-04-07 15:53:02', '2025-04-07 15:53:02');
INSERT INTO `ac_user_token` VALUES (36, 0, 15675, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxNTY3NSIsImlhdCI6MTc0NDAxNTQ4NCwiZXhwIjoxNzQ0NjIwMjg0fQ.TzJPML--II3XPDcrktV7Dq1twV3usZclX2mWM2AWu6mF67SjQjAcyN-kvrbFm4FNQGSeRr12HeMunGQE_yyIKA', '2025-04-14 16:44:45', '2025-04-07 16:44:45', '2025-04-07 16:44:45');
INSERT INTO `ac_user_token` VALUES (37, 0, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzQ0MDE5OTEwLCJleHAiOjE3NDQ2MjQ3MTB9.MrJaSTgWUQ2twXgRpOMCLRn8Oyfvn1E1y3Q726fqIPMyFaxp7jh4q0loxesXI4ZPypUL2xlxat1scbxCXkMkxg', '2025-04-14 17:58:31', '2025-04-07 17:58:31', '2025-04-07 17:58:31');
INSERT INTO `ac_user_token` VALUES (38, 0, 15675, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxNTY3NSIsImlhdCI6MTc0NDAyMjU3MiwiZXhwIjoxNzQ0NjI3MzcyfQ.iuzxO5zFW7_upJ0GCPbNiPDkb-3qrtxgk2M5LC-B_HtHBH9m9Q43T06HsU13Cu3scMGAJJkL6Apb0whS02cFtw', '2025-04-14 18:42:53', '2025-04-07 18:42:53', '2025-04-07 18:42:53');
INSERT INTO `ac_user_token` VALUES (39, 0, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzQ0MDIzMTI5LCJleHAiOjE3NDQ2Mjc5Mjl9.qxWpa4_C4PclhDh2-fBS58HeKccenm9V_HuuQXFaL4r1C1jmGGrWmG8MYXqysIc-KW6lyccwpTcAh-mwT6Heiw', '2025-04-14 18:52:09', '2025-04-07 18:52:09', '2025-04-07 18:52:09');
INSERT INTO `ac_user_token` VALUES (40, 0, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzQ0MDMzMDcxLCJleHAiOjE3NDQ2Mzc4NzF9.hJaf_uhkMNXpTtx7N1cUiUO0w00ljMwsQyoFk7D-PZvgzUlHA4BIZHc-6A_rc8rz6sjjt252I_2spMuZpdDRnw', '2025-04-14 21:37:52', '2025-04-07 21:37:52', '2025-04-07 21:37:52');

-- ----------------------------
-- Table structure for fm_form_template
-- ----------------------------
DROP TABLE IF EXISTS `fm_form_template`;
CREATE TABLE `fm_form_template`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '模板Id',
  `form_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '模板唯一标识',
  `cover_img` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '封面图',
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '模板名称',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '模板I描述',
  `category_id` int NOT NULL COMMENT '模板类型',
  `scheme` json NULL COMMENT '模板定义',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3613 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '表单模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_form_template
-- ----------------------------
INSERT INTO `fm_form_template` VALUES (3614, 'J8NtXyZQ', 'http://localhost:8999/u/c4ca4238a0b923820dcc509a6f75849b/89634bb66b6142b3a1195f8e8c44619d.png', '1231', '123123', 54, '{\"formType\": 1, \"formItems\": [{\"id\": 59060, \"sort\": 196608, \"span\": 24, \"type\": \"RADIO\", \"label\": \"单选框组\", \"scheme\": {\"size\": \"medium\", \"sort\": 196608, \"style\": {}, \"config\": {\"tag\": \"t-radio-group\", \"span\": 24, \"label\": \"单选框组\", \"border\": false, \"formId\": \"radio1743973645013\", \"inline\": true, \"options\": [{\"label\": \"选项一\", \"value\": 1}, {\"label\": \"选项二\", \"value\": 2}, {\"label\": \"3\", \"value\": 3}, {\"label\": \"4\", \"value\": 4}], \"regList\": [], \"tagIcon\": \"radio\", \"required\": true, \"changeTag\": true, \"hideQuota\": false, \"renderKey\": \"radio17439736450131743973645013\", \"showLabel\": true, \"optionType\": \"default\", \"optionsType\": 0, \"showRegList\": false, \"otherRequired\": true, \"dynamicOptions\": {\"url\": \"\", \"dataPath\": \"\", \"labelField\": \"\", \"valueField\": \"\"}, \"quotaCycleRule\": \"fixed\", \"showVoteResult\": false, \"quotaRecoverable\": true, \"quotaBlankWarning\": \"\", \"withExclusiveChoice\": false, \"exclusiveChoiceApiCodes\": [], \"hideChoiceWhenQuotaEmpty\": false}, \"typeId\": \"RADIO\", \"vModel\": \"radio1743973645013\", \"disabled\": false}, \"formKey\": \"wPThgfY5\", \"regList\": [], \"hideType\": false, \"required\": true, \"showLabel\": true, \"textLabel\": \"单选框组\", \"createTime\": \"2025-04-07 19:42:39\", \"formItemId\": \"radio1743973645013\", \"updateTime\": \"2025-04-07 19:42:39\", \"displayType\": false, \"placeholder\": \"\", \"specialType\": false}, {\"id\": 59061, \"sort\": 393216, \"span\": 24, \"type\": \"SELECT\", \"label\": \"下拉选择\", \"scheme\": {\"sort\": 393216, \"style\": {\"width\": \"100%\"}, \"config\": {\"tag\": \"t-select\", \"span\": 24, \"label\": \"下拉选择\", \"formId\": \"select1743973633463\", \"options\": [{\"label\": \"选项一\", \"value\": 1}, {\"label\": \"选项二\", \"value\": 2}, {\"label\": \"3\", \"value\": 3}, {\"label\": \"4\", \"value\": 4}], \"regList\": [], \"tagIcon\": \"select\", \"required\": true, \"changeTag\": true, \"mobileTag\": \"mobile-t-select\", \"renderKey\": \"select17439736334631743973633463\", \"showLabel\": true, \"optionsType\": 0, \"dynamicOptions\": {\"url\": \"\", \"dataPath\": \"\", \"labelField\": \"\", \"valueField\": \"\"}}, \"typeId\": \"SELECT\", \"vModel\": \"select1743973633463\", \"disabled\": false, \"multiple\": false, \"clearable\": true, \"filterable\": false, \"placeholder\": \"请选择下拉选择\"}, \"formKey\": \"wPThgfY5\", \"regList\": [], \"hideType\": false, \"required\": true, \"showLabel\": true, \"textLabel\": \"下拉选择\", \"createTime\": \"2025-04-07 19:42:39\", \"formItemId\": \"select1743973633463\", \"updateTime\": \"2025-04-07 19:42:39\", \"displayType\": false, \"placeholder\": \"请选择下拉选择\", \"specialType\": false}]}', 0, '2025-04-07 21:19:30', '2025-04-07 21:19:30');

-- ----------------------------
-- Table structure for fm_form_template_category
-- ----------------------------
DROP TABLE IF EXISTS `fm_form_template_category`;
CREATE TABLE `fm_form_template_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '分类名称',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '项目模板分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_form_template_category
-- ----------------------------
INSERT INTO `fm_form_template_category` VALUES (53, '123', NULL, '2025-04-07 05:00:14', '2025-04-07 05:00:14');
INSERT INTO `fm_form_template_category` VALUES (54, '1231', 0, '2025-04-07 21:07:15', '2025-04-07 21:07:15');

-- ----------------------------
-- Table structure for fm_form_theme
-- ----------------------------
DROP TABLE IF EXISTS `fm_form_theme`;
CREATE TABLE `fm_form_theme`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主题名称',
  `style` bigint NOT NULL COMMENT '主题风格',
  `head_img_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '头部图片',
  `background_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '背景图片',
  `theme_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主题颜色代码',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 236 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目主题外观模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_form_theme
-- ----------------------------
INSERT INTO `fm_form_theme` VALUES (236, '12312', 32, 'http://localhost:8999/u/9ee5044600ec4a5cbbfb74faaa3a8b76.png', 'http://localhost:8999/u/1d38f396793e4f98abd3025d1a7d6888.png', NULL, '2025-04-07 05:01:05', '2025-04-07 05:01:05');

-- ----------------------------
-- Table structure for fm_form_theme_category
-- ----------------------------
DROP TABLE IF EXISTS `fm_form_theme_category`;
CREATE TABLE `fm_form_theme_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主题名称',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '表单主题分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_form_theme_category
-- ----------------------------
INSERT INTO `fm_form_theme_category` VALUES (32, '123', NULL, '2025-04-07 05:00:51', '2025-04-07 05:00:51');

-- ----------------------------
-- Table structure for fm_user_form
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form`;
CREATE TABLE `fm_user_form`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '表单唯一标识',
  `source_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '来源Id',
  `source_type` tinyint NULL DEFAULT NULL COMMENT '来源类型',
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '表单名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '表单描述',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '表单类型',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `is_folder` tinyint UNSIGNED NULL DEFAULT 0 COMMENT '是文件夹',
  `folder_id` bigint NULL DEFAULT 0 COMMENT '文件夹Id',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8467 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form
-- ----------------------------
INSERT INTO `fm_user_form` VALUES (8467, 'p6Cr5756', NULL, 1, '<h2 style=\"text-align: center;\">对于人工自能的看法</h2>', '1223', 15674, '1', 1, 0, 0, 0, '2025-04-07 04:53:33', '2025-04-07 04:53:33');
INSERT INTO `fm_user_form` VALUES (8468, 'letdJG4N', NULL, 1, '<h2 style=\"text-align: center;\">未命名问卷</h2>', '', 1, '1', 2, 0, 0, 0, '2025-04-07 21:34:17', '2025-04-07 05:03:13');
INSERT INTO `fm_user_form` VALUES (8469, 'r5CJnD52', NULL, 1, '<h2 style=\"text-align: center;\">23</h2>', '', 15675, '1', 2, 0, 0, 0, '2025-04-07 16:45:09', '2025-04-07 16:44:59');
INSERT INTO `fm_user_form` VALUES (8470, 'wPThgfY5', '3613', 2, '123', '1231', 1, '1', 3, 0, 0, 0, '2025-04-07 21:34:10', '2025-04-07 19:42:39');
INSERT INTO `fm_user_form` VALUES (8471, 'uPdz9qqx', NULL, 1, '<h2 style=\"text-align: center;\">12</h2>', '', 1, '1', 2, 0, 0, 0, '2025-04-07 21:41:07', '2025-04-07 21:07:00');

-- ----------------------------
-- Table structure for fm_user_form_auth
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_auth`;
CREATE TABLE `fm_user_form_auth`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '项目key',
  `auth_group_id` bigint NULL DEFAULT NULL COMMENT '授权组id',
  `user_id_list` json NULL COMMENT '用户Id列表',
  `role_id_list` json NULL COMMENT '角色Id列表',
  `dept_id_list` json NULL COMMENT '部门Id列表',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key`, `auth_group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 159 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '表单授权对象' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_auth
-- ----------------------------

-- ----------------------------
-- Table structure for fm_user_form_data
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_data`;
CREATE TABLE `fm_user_form_data`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '表单key',
  `serial_number` int NULL DEFAULT NULL COMMENT '序号',
  `original_data` json NULL COMMENT '填写结果',
  `submit_ua` json NULL COMMENT '提交ua',
  `submit_os` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '提交系统',
  `submit_browser` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '提交浏览器',
  `submit_request_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '请求ip',
  `submit_address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '提交地址',
  `complete_time` int NULL DEFAULT NULL COMMENT '完成时间 毫秒',
  `wx_open_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '微信openId',
  `wx_user_info` json NULL COMMENT '微信用户信息',
  `ext_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '扩展字段记录来源等',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 211738 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '表单收集数据结果' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_data
-- ----------------------------
INSERT INTO `fm_user_form_data` VALUES (211738, 'letdJG4N', 1, '{\"rate1743973397142\": 5, \"number1743973394500\": 4}', '{\"os\": {\"name\": \"Windows\", \"version\": \"10\"}, \"ua\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0\", \"cpu\": {\"architecture\": \"amd64\"}, \"device\": {}, \"engine\": {\"name\": \"Blink\", \"version\": \"135.0.0.0\"}, \"browser\": {\"name\": \"Edge\", \"major\": \"135\", \"version\": \"135.0.0.0\"}}', 'Windows', 'Edge', '127.0.0.1', '内网IP', 5436, NULL, '{}', NULL, '2025-04-07 05:03:37', NULL, '2025-04-07 05:03:37', NULL);
INSERT INTO `fm_user_form_data` VALUES (211739, 'letdJG4N', 2, '{\"rate1743973397142\": 5, \"number1743973394500\": 3}', '{\"os\": {\"name\": \"Windows\", \"version\": \"10\"}, \"ua\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36\", \"cpu\": {\"architecture\": \"amd64\"}, \"device\": {}, \"engine\": {\"name\": \"Blink\", \"version\": \"134.0.0.0\"}, \"browser\": {\"name\": \"Chrome\", \"major\": \"134\", \"version\": \"134.0.0.0\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 5261, NULL, '{}', NULL, '2025-04-07 05:06:17', NULL, '2025-04-07 05:06:17', NULL);
INSERT INTO `fm_user_form_data` VALUES (211740, 'letdJG4N', 3, '{\"radio1743973645013\": 4, \"select1743973633463\": 2, \"radio1743973645013label\": \"4\", \"select1743973633463label\": \"选项二\"}', '{\"os\": {\"name\": \"Windows\", \"version\": \"10\"}, \"ua\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0\", \"cpu\": {\"architecture\": \"amd64\"}, \"device\": {}, \"engine\": {\"name\": \"Blink\", \"version\": \"135.0.0.0\"}, \"browser\": {\"name\": \"Edge\", \"major\": \"135\", \"version\": \"135.0.0.0\"}}', 'Windows', 'Edge', '127.0.0.1', '内网IP', 5945, NULL, '{}', NULL, '2025-04-07 05:12:08', NULL, '2025-04-07 05:12:08', NULL);
INSERT INTO `fm_user_form_data` VALUES (211741, 'letdJG4N', 4, '{\"radio1743973645013\": 1, \"select1743973633463\": 1, \"radio1743973645013label\": \"选项一\", \"select1743973633463label\": \"选项一\"}', '{\"os\": {\"name\": \"Windows\", \"version\": \"10\"}, \"ua\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0\", \"cpu\": {\"architecture\": \"amd64\"}, \"device\": {}, \"engine\": {\"name\": \"Blink\", \"version\": \"135.0.0.0\"}, \"browser\": {\"name\": \"Edge\", \"major\": \"135\", \"version\": \"135.0.0.0\"}}', 'Windows', 'Edge', '127.0.0.1', '内网IP', 5160, NULL, '{}', NULL, '2025-04-07 05:12:45', NULL, '2025-04-07 05:12:45', NULL);
INSERT INTO `fm_user_form_data` VALUES (211742, 'letdJG4N', 5, '{\"radio1743973645013\": 1, \"select1743973633463\": 1, \"radio1743973645013label\": \"A.苹果\", \"select1743973633463label\": \"选项一\"}', '{\"os\": {\"name\": \"Windows\", \"version\": \"10\"}, \"ua\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0\", \"cpu\": {\"architecture\": \"amd64\"}, \"device\": {}, \"engine\": {\"name\": \"Blink\", \"version\": \"135.0.0.0\"}, \"browser\": {\"name\": \"Edge\", \"major\": \"135\", \"version\": \"135.0.0.0\"}}', 'Windows', 'Edge', '127.0.0.1', '内网IP', 6819, NULL, '{}', NULL, '2025-04-07 06:10:19', NULL, '2025-04-07 06:10:19', NULL);
INSERT INTO `fm_user_form_data` VALUES (211743, 'letdJG4N', 1, '{\"rate1743978167748\": 5, \"radio1743973645013\": 1, \"select1743973633463\": 3, \"slider1743978170396\": 43, \"cascader1743978172133\": [1, 2], \"checkbox1743978171178\": [1], \"radio1743973645013label\": \"A.苹果\", \"select1743973633463label\": \"3\", \"image_select1743978169717\": 1, \"image_upload1743978168941\": [{\"url\": \"http://localhost:8999/u/004e2d139dd9b29e7d0aab17d233585f/dbcdcceed3934cf88002c73aafe61d30.jpg\", \"name\": \"c74addb8-89e2-4f83-91eb-40b5cda9f74e.jpg\"}], \"cascader1743978172133label\": [\"选项1\", \"选项1-1\"], \"checkbox1743978171178label\": [\"选项一\"], \"image_select1743978169717label\": \"选项一\"}', '{\"os\": {\"name\": \"Windows\", \"version\": \"10\"}, \"ua\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0\", \"cpu\": {\"architecture\": \"amd64\"}, \"device\": {}, \"engine\": {\"name\": \"Blink\", \"version\": \"135.0.0.0\"}, \"browser\": {\"name\": \"Edge\", \"major\": \"135\", \"version\": \"135.0.0.0\"}}', 'Windows', 'Edge', '127.0.0.1', '内网IP', 16254, NULL, '{}', NULL, '2025-04-07 16:19:51', NULL, '2025-04-07 16:19:51', NULL);
INSERT INTO `fm_user_form_data` VALUES (211744, 'r5CJnD52', 1, '{\"radio1744015504752\": 1, \"radio1744015504752label\": \"选项一\"}', '{\"os\": {\"name\": \"Windows\", \"version\": \"10\"}, \"ua\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0\", \"cpu\": {\"architecture\": \"amd64\"}, \"device\": {}, \"engine\": {\"name\": \"Blink\", \"version\": \"135.0.0.0\"}, \"browser\": {\"name\": \"Edge\", \"major\": \"135\", \"version\": \"135.0.0.0\"}}', 'Windows', 'Edge', '127.0.0.1', '内网IP', 2872, NULL, '{}', NULL, '2025-04-07 16:45:44', NULL, '2025-04-07 16:45:44', NULL);
INSERT INTO `fm_user_form_data` VALUES (211745, 'uPdz9qqx', 1, '{\"input1744031287399\": \"12323123\"}', '{\"os\": {\"name\": \"Windows\", \"version\": \"10\"}, \"ua\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0\", \"cpu\": {\"architecture\": \"amd64\"}, \"device\": {}, \"engine\": {\"name\": \"Blink\", \"version\": \"135.0.0.0\"}, \"browser\": {\"name\": \"Edge\", \"major\": \"135\", \"version\": \"135.0.0.0\"}}', 'Windows', 'Edge', '127.0.0.1', '内网IP', 4968, NULL, '{}', NULL, '2025-04-07 21:41:19', NULL, '2025-04-07 21:41:19', NULL);

-- ----------------------------
-- Table structure for fm_user_form_item
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_item`;
CREATE TABLE `fm_user_form_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '项目key',
  `form_item_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '表单项Id',
  `type` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '表单项类型 ',
  `label` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '表单项标题',
  `is_display_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '展示类型组件',
  `is_hide_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '隐藏类型组件',
  `is_special_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '特殊处理类型',
  `show_label` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示标签',
  `default_value` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '表单项默认值',
  `required` tinyint(1) NOT NULL COMMENT '是否必填',
  `placeholder` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '输入型提示文字',
  `sort` bigint NULL DEFAULT 0 COMMENT '排序',
  `span` int NOT NULL DEFAULT 24 COMMENT '栅格宽度',
  `scheme` json NULL COMMENT '表表单原始JSON',
  `reg_list` json NULL COMMENT '正则表达式 ',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59044 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '表单项' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_item
-- ----------------------------
INSERT INTO `fm_user_form_item` VALUES (59044, 'p6Cr5756', 'radio1743972817328', 'RADIO', '<p>单选框组</p>', 0, 0, 0, 1, NULL, 1, '', 16384, 24, '{\"size\": \"medium\", \"sort\": 16384, \"style\": {}, \"config\": {\"tag\": \"t-radio-group\", \"span\": 24, \"label\": \"<p>单选框组</p>\", \"border\": false, \"formId\": \"radio1743972817328\", \"inline\": true, \"options\": [{\"label\": \"选项一\", \"value\": 1}, {\"label\": \"选项二\", \"value\": 2}], \"regList\": [], \"tagIcon\": \"radio\", \"required\": true, \"changeTag\": true, \"hideQuota\": false, \"renderKey\": \"radio17439728173281743972817328\", \"showLabel\": true, \"optionType\": \"default\", \"optionsType\": 0, \"showRegList\": false, \"otherRequired\": true, \"dynamicOptions\": {\"url\": \"\", \"dataPath\": \"\", \"labelField\": \"\", \"valueField\": \"\"}, \"quotaCycleRule\": \"fixed\", \"showVoteResult\": false, \"quotaRecoverable\": true, \"quotaBlankWarning\": \"\", \"withExclusiveChoice\": false, \"exclusiveChoiceApiCodes\": [], \"hideChoiceWhenQuotaEmpty\": false}, \"typeId\": \"RADIO\", \"vModel\": \"radio1743972817328\", \"disabled\": false}', '[]', '2025-04-07 04:54:01', '2025-04-07 04:53:38');
INSERT INTO `fm_user_form_item` VALUES (59045, 'p6Cr5756', 'radio1743972819454', 'RADIO', '单选框组', 0, 0, 0, 1, NULL, 1, '', 196608, 24, '{\"size\": \"medium\", \"style\": {}, \"config\": {\"tag\": \"t-radio-group\", \"span\": 24, \"label\": \"单选框组\", \"border\": false, \"formId\": \"radio1743972819454\", \"inline\": true, \"options\": [{\"label\": \"选项一\", \"value\": 1}, {\"label\": \"选项二\", \"value\": 2}], \"regList\": [], \"tagIcon\": \"radio\", \"required\": true, \"changeTag\": true, \"hideQuota\": false, \"renderKey\": \"radio17439728194541743972819454\", \"showLabel\": true, \"optionType\": \"default\", \"optionsType\": 0, \"showRegList\": false, \"otherRequired\": true, \"dynamicOptions\": {\"url\": \"\", \"dataPath\": \"\", \"labelField\": \"\", \"valueField\": \"\"}, \"quotaCycleRule\": \"fixed\", \"showVoteResult\": false, \"quotaRecoverable\": true, \"quotaBlankWarning\": \"\", \"hideChoiceWhenQuotaEmpty\": false}, \"typeId\": \"RADIO\", \"vModel\": \"radio1743972819454\", \"disabled\": false}', '[]', '2025-04-07 04:53:40', '2025-04-07 04:53:40');
INSERT INTO `fm_user_form_item` VALUES (59046, 'p6Cr5756', 'image_upload1743972826139', 'IMAGE_UPLOAD', '图片上传', 0, 0, 0, 1, '[]', 1, '', 32768, 24, '{\"name\": \"file\", \"limit\": 2, \"accept\": \"image/*\", \"action\": \"/form/file/upload/p6Cr5756\", \"config\": {\"tag\": \"t-image-upload\", \"span\": 24, \"label\": \"图片上传\", \"formId\": \"image_upload1743972826139\", \"regList\": [], \"showTip\": false, \"tagIcon\": \"image-upload\", \"fileSize\": 10, \"required\": true, \"sizeUnit\": \"MB\", \"changeTag\": true, \"renderKey\": \"image_upload17439728261391743972826139\", \"showLabel\": true, \"buttonText\": \"点击上传\", \"showRegList\": false, \"defaultValue\": []}, \"typeId\": \"IMAGE_UPLOAD\", \"vModel\": \"image_upload1743972826139\", \"disabled\": false, \"multiple\": false, \"auto-upload\": true}', '[]', '2025-04-07 04:53:52', '2025-04-07 04:53:51');
INSERT INTO `fm_user_form_item` VALUES (59050, 'letdJG4N', 'select1743973633463', 'SELECT', '下拉选择', 0, 0, 0, 1, NULL, 1, '请选择下拉选择', 393216, 24, '{\"sort\": 393216, \"style\": {\"width\": \"100%\"}, \"config\": {\"tag\": \"t-select\", \"span\": 24, \"label\": \"下拉选择\", \"formId\": \"select1743973633463\", \"options\": [{\"label\": \"选项一\", \"value\": 1}, {\"label\": \"选项二\", \"value\": 2}, {\"label\": \"3\", \"value\": 3}, {\"label\": \"4\", \"value\": 4}], \"regList\": [], \"tagIcon\": \"select\", \"required\": true, \"changeTag\": true, \"mobileTag\": \"mobile-t-select\", \"renderKey\": \"select17439736334631743973633463\", \"showLabel\": true, \"optionsType\": 0, \"dynamicOptions\": {\"url\": \"\", \"dataPath\": \"\", \"labelField\": \"\", \"valueField\": \"\"}}, \"typeId\": \"SELECT\", \"vModel\": \"select1743973633463\", \"disabled\": false, \"multiple\": false, \"clearable\": true, \"filterable\": false, \"placeholder\": \"请选择下拉选择\"}', '[]', '2025-04-07 05:07:22', '2025-04-07 05:07:14');
INSERT INTO `fm_user_form_item` VALUES (59051, 'letdJG4N', 'radio1743973645013', 'RADIO', '<p>你最喜欢的水果</p>', 0, 0, 0, 1, NULL, 1, '此题为必填项目', 196608, 24, '{\"dId\": 59051, \"key\": \"radio1743973645013174397731797559051\", \"size\": \"medium\", \"sort\": 196608, \"style\": {}, \"action\": \"/tduck-apiundefined\", \"config\": {\"tag\": \"t-radio-group\", \"span\": 24, \"label\": \"<p>你最喜欢的水果</p>\", \"border\": false, \"formId\": \"radio1743973645013\", \"inline\": true, \"options\": [{\"label\": \"A.苹果\", \"value\": 1}, {\"label\": \"B.香蕉\", \"value\": 2}, {\"label\": \"C.草莓\", \"value\": 3}, {\"label\": \"D.火龙果\", \"value\": 4}], \"regList\": [], \"tagIcon\": \"radio\", \"required\": true, \"changeTag\": true, \"hideQuota\": false, \"renderKey\": \"radio17439736450131743973645013\", \"showLabel\": true, \"optionType\": \"default\", \"optionsType\": 0, \"showRegList\": false, \"otherRequired\": true, \"dynamicOptions\": {\"url\": \"\", \"dataPath\": \"\", \"labelField\": \"\", \"valueField\": \"\"}, \"quotaCycleRule\": \"fixed\", \"showVoteResult\": false, \"quotaRecoverable\": true, \"quotaBlankWarning\": \"\", \"withExclusiveChoice\": false, \"exclusiveChoiceApiCodes\": [], \"hideChoiceWhenQuotaEmpty\": false}, \"typeId\": \"RADIO\", \"vModel\": \"radio1743973645013\", \"regList\": [], \"disabled\": false, \"formItemId\": \"radio1743973645013\", \"displayType\": false, \"placeholder\": \"此题为必填项目\"}', '[]', '2025-04-07 06:09:44', '2025-04-07 05:07:25');
INSERT INTO `fm_user_form_item` VALUES (59052, 'letdJG4N', 'rate1743978167748', 'RATE', '评分组件', 0, 0, 0, 1, '0', 1, '', 589824, 24, '{\"max\": 5, \"style\": {}, \"config\": {\"tag\": \"t-rate\", \"span\": 24, \"label\": \"评分组件\", \"formId\": \"rate1743978167748\", \"regList\": [], \"tagIcon\": \"rate\", \"required\": true, \"changeTag\": true, \"renderKey\": \"rate17439781677481743978167748\", \"showLabel\": true, \"showRegList\": false, \"defaultValue\": 0}, \"typeId\": \"RATE\", \"vModel\": \"rate1743978167748\", \"disabled\": false, \"show-text\": false, \"allow-half\": false, \"show-score\": false}', '[]', '2025-04-07 06:22:49', '2025-04-07 06:22:48');
INSERT INTO `fm_user_form_item` VALUES (59053, 'letdJG4N', 'image_upload1743978168941', 'IMAGE_UPLOAD', '图片上传', 0, 0, 0, 1, '[]', 1, '', 720896, 24, '{\"name\": \"file\", \"limit\": 2, \"accept\": \"image/*\", \"action\": \"/form/file/upload/letdJG4N\", \"config\": {\"tag\": \"t-image-upload\", \"span\": 24, \"label\": \"图片上传\", \"formId\": \"image_upload1743978168941\", \"regList\": [], \"showTip\": false, \"tagIcon\": \"image-upload\", \"fileSize\": 10, \"required\": true, \"sizeUnit\": \"MB\", \"changeTag\": true, \"renderKey\": \"image_upload17439781689411743978168941\", \"showLabel\": true, \"buttonText\": \"点击上传\", \"showRegList\": false, \"defaultValue\": []}, \"typeId\": \"IMAGE_UPLOAD\", \"vModel\": \"image_upload1743978168941\", \"disabled\": false, \"multiple\": false, \"auto-upload\": true}', '[]', '2025-04-07 06:22:50', '2025-04-07 06:22:49');
INSERT INTO `fm_user_form_item` VALUES (59054, 'letdJG4N', 'image_select1743978169717', 'IMAGE_SELECT', '图片选择', 0, 0, 0, 1, NULL, 1, '', 655360, 24, '{\"style\": {\"width\": \"100%\"}, \"config\": {\"tag\": \"t-image-select\", \"span\": 24, \"label\": \"图片选择\", \"formId\": \"image_select1743978169717\", \"options\": [{\"label\": \"选项一\", \"value\": 1}], \"regList\": [], \"tagIcon\": \"image-select\", \"required\": true, \"changeTag\": true, \"renderKey\": \"image_select17439781697171743978169717\", \"showLabel\": true, \"showRegList\": false, \"showRequired\": true, \"showClearable\": false, \"showVoteResult\": false, \"showDefaultValue\": true}, \"typeId\": \"IMAGE_SELECT\", \"vModel\": \"image_select1743978169717\", \"multiple\": false}', '[]', '2025-04-07 06:22:50', '2025-04-07 06:22:50');
INSERT INTO `fm_user_form_item` VALUES (59055, 'letdJG4N', 'slider1743978170396', 'SLIDER', '滑块组件', 0, 0, 0, 1, '0', 1, '', 688128, 24, '{\"max\": 100, \"min\": 0, \"step\": 1, \"style\": {}, \"config\": {\"tag\": \"t-slider\", \"span\": 24, \"label\": \"滑块组件\", \"formId\": \"slider1743978170396\", \"regList\": [], \"tagIcon\": \"slider\", \"required\": true, \"changeTag\": true, \"renderKey\": \"slider17439781703961743978170396\", \"showLabel\": true, \"showRegList\": false, \"defaultValue\": 0}, \"typeId\": \"SLIDER\", \"vModel\": \"slider1743978170396\"}', '[]', '2025-04-07 06:22:51', '2025-04-07 06:22:51');
INSERT INTO `fm_user_form_item` VALUES (59056, 'letdJG4N', 'checkbox1743978171178', 'CHECKBOX', '多选框组', 0, 0, 0, 1, '[]', 1, '', 622592, 24, '{\"size\": \"medium\", \"sort\": 622592, \"style\": {}, \"config\": {\"tag\": \"t-checkbox-group\", \"span\": 24, \"label\": \"多选框组\", \"border\": false, \"formId\": \"checkbox1743978171178\", \"inline\": false, \"options\": [{\"label\": \"选项一\", \"value\": 1}, {\"label\": \"选项二\", \"value\": 2}], \"regList\": [], \"tagIcon\": \"checkbox\", \"required\": true, \"changeTag\": true, \"hideQuota\": false, \"renderKey\": \"checkbox17439781711781743978171178\", \"showLabel\": true, \"optionType\": \"default\", \"optionsType\": 0, \"showRegList\": true, \"defaultValue\": [], \"otherRequired\": true, \"dynamicOptions\": {\"url\": \"\", \"dataPath\": \"\", \"labelField\": \"\", \"valueField\": \"\"}, \"quotaCycleRule\": \"fixed\", \"showVoteResult\": false, \"quotaRecoverable\": true, \"quotaBlankWarning\": \"\", \"withExclusiveChoice\": false, \"exclusiveChoiceApiCodes\": [], \"hideChoiceWhenQuotaEmpty\": false}, \"typeId\": \"CHECKBOX\", \"vModel\": \"checkbox1743978171178\", \"disabled\": false}', '[]', '2025-04-07 06:22:52', '2025-04-07 06:22:51');
INSERT INTO `fm_user_form_item` VALUES (59057, 'letdJG4N', 'cascader1743978172133', 'CASCADER', '级联选择', 0, 0, 0, 1, '[]', 1, '请选择级联选择', 606208, 24, '{\"props\": {\"props\": {\"label\": \"label\", \"value\": \"value\", \"children\": \"children\", \"multiple\": false}}, \"style\": {\"width\": \"100%\"}, \"config\": {\"tag\": \"t-cascader\", \"url\": \"\", \"span\": 24, \"label\": \"级联选择\", \"formId\": \"cascader1743978172133\", \"method\": \"get\", \"dataKey\": \"list\", \"options\": [{\"id\": 1, \"label\": \"选项1\", \"value\": 1, \"children\": [{\"id\": 2, \"label\": \"选项1-1\", \"value\": 2}]}], \"regList\": [], \"tagIcon\": \"cascader\", \"required\": true, \"changeTag\": true, \"renderKey\": \"cascader17439781721331743978172133\", \"showLabel\": true, \"optionsType\": 0, \"defaultValue\": [], \"dynamicOptions\": {\"url\": \"\", \"dataPath\": \"\", \"labelField\": \"\", \"valueField\": \"\", \"childrenField\": \"\"}}, \"typeId\": \"CASCADER\", \"vModel\": \"cascader1743978172133\", \"disabled\": false, \"clearable\": true, \"separator\": \"/\", \"filterable\": false, \"placeholder\": \"请选择级联选择\", \"show-all-levels\": true}', '[]', '2025-04-07 06:22:53', '2025-04-07 06:22:53');
INSERT INTO `fm_user_form_item` VALUES (59059, 'r5CJnD52', 'radio1744015504752', 'RADIO', '单选框组', 0, 0, 0, 1, NULL, 1, '', 131072, 24, '{\"size\": \"medium\", \"style\": {}, \"config\": {\"tag\": \"t-radio-group\", \"span\": 24, \"label\": \"单选框组\", \"border\": false, \"formId\": \"radio1744015504752\", \"inline\": true, \"options\": [{\"label\": \"选项一\", \"value\": 1}, {\"label\": \"选项二\", \"value\": 2}], \"regList\": [], \"tagIcon\": \"radio\", \"required\": true, \"changeTag\": true, \"hideQuota\": false, \"renderKey\": \"radio17440155047521744015504752\", \"showLabel\": true, \"optionType\": \"default\", \"optionsType\": 0, \"showRegList\": false, \"otherRequired\": true, \"dynamicOptions\": {\"url\": \"\", \"dataPath\": \"\", \"labelField\": \"\", \"valueField\": \"\"}, \"quotaCycleRule\": \"fixed\", \"showVoteResult\": false, \"quotaRecoverable\": true, \"quotaBlankWarning\": \"\", \"hideChoiceWhenQuotaEmpty\": false}, \"typeId\": \"RADIO\", \"vModel\": \"radio1744015504752\", \"disabled\": false}', '[]', '2025-04-07 16:45:05', '2025-04-07 16:45:05');
INSERT INTO `fm_user_form_item` VALUES (59060, 'wPThgfY5', 'radio1743973645013', 'RADIO', '单选框组', 0, 0, 0, 1, NULL, 1, '', 196608, 24, '{\"size\": \"medium\", \"sort\": 196608, \"style\": {}, \"config\": {\"tag\": \"t-radio-group\", \"span\": 24, \"label\": \"单选框组\", \"border\": false, \"formId\": \"radio1743973645013\", \"inline\": true, \"options\": [{\"label\": \"选项一\", \"value\": 1}, {\"label\": \"选项二\", \"value\": 2}, {\"label\": \"3\", \"value\": 3}, {\"label\": \"4\", \"value\": 4}], \"regList\": [], \"tagIcon\": \"radio\", \"required\": true, \"changeTag\": true, \"hideQuota\": false, \"renderKey\": \"radio17439736450131743973645013\", \"showLabel\": true, \"optionType\": \"default\", \"optionsType\": 0, \"showRegList\": false, \"otherRequired\": true, \"dynamicOptions\": {\"url\": \"\", \"dataPath\": \"\", \"labelField\": \"\", \"valueField\": \"\"}, \"quotaCycleRule\": \"fixed\", \"showVoteResult\": false, \"quotaRecoverable\": true, \"quotaBlankWarning\": \"\", \"withExclusiveChoice\": false, \"exclusiveChoiceApiCodes\": [], \"hideChoiceWhenQuotaEmpty\": false}, \"typeId\": \"RADIO\", \"vModel\": \"radio1743973645013\", \"disabled\": false}', '[]', '2025-04-07 19:42:39', '2025-04-07 19:42:39');
INSERT INTO `fm_user_form_item` VALUES (59061, 'wPThgfY5', 'select1743973633463', 'SELECT', '下拉选择', 0, 0, 0, 1, NULL, 1, '请选择下拉选择', 393216, 24, '{\"sort\": 393216, \"style\": {\"width\": \"100%\"}, \"config\": {\"tag\": \"t-select\", \"span\": 24, \"label\": \"下拉选择\", \"formId\": \"select1743973633463\", \"options\": [{\"label\": \"选项一\", \"value\": 1}, {\"label\": \"选项二\", \"value\": 2}, {\"label\": \"3\", \"value\": 3}, {\"label\": \"4\", \"value\": 4}], \"regList\": [], \"tagIcon\": \"select\", \"required\": true, \"changeTag\": true, \"mobileTag\": \"mobile-t-select\", \"renderKey\": \"select17439736334631743973633463\", \"showLabel\": true, \"optionsType\": 0, \"dynamicOptions\": {\"url\": \"\", \"dataPath\": \"\", \"labelField\": \"\", \"valueField\": \"\"}}, \"typeId\": \"SELECT\", \"vModel\": \"select1743973633463\", \"disabled\": false, \"multiple\": false, \"clearable\": true, \"filterable\": false, \"placeholder\": \"请选择下拉选择\"}', '[]', '2025-04-07 19:42:39', '2025-04-07 19:42:39');
INSERT INTO `fm_user_form_item` VALUES (59062, 'uPdz9qqx', 'input1744031287399', 'INPUT', '单行文本', 0, 0, 0, 1, NULL, 1, '请输入单行文本', 65536, 24, '{\"style\": {\"width\": \"100%\"}, \"config\": {\"tag\": \"t-input\", \"span\": 24, \"label\": \"单行文本\", \"append\": \"\", \"formId\": \"input1744031287399\", \"prepend\": \"\", \"regList\": [], \"tagIcon\": \"input\", \"dataType\": {\"type\": \"\", \"message\": \"\"}, \"required\": true, \"changeTag\": true, \"renderKey\": \"input17440312873991744031287399\", \"showLabel\": true}, \"typeId\": \"INPUT\", \"vModel\": \"input1744031287399\", \"disabled\": false, \"readonly\": false, \"clearable\": true, \"notRepeat\": false, \"placeholder\": \"请输入单行文本\", \"prefix-icon\": \"\", \"suffix-icon\": \"\", \"show-word-limit\": false}', '[]', '2025-04-07 21:08:08', '2025-04-07 21:08:08');

-- ----------------------------
-- Table structure for fm_user_form_logic
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_logic`;
CREATE TABLE `fm_user_form_logic`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '逻辑Id',
  `form_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '表单key',
  `scheme` json NULL COMMENT '逻辑定义',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1707 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '项目逻辑' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_logic
-- ----------------------------
INSERT INTO `fm_user_form_logic` VALUES (1707, 'p6Cr5756', '[{\"triggerList\": [{\"type\": \"show\"}], \"conditionList\": [{\"relation\": \"AND\"}]}]', '2025-04-07 04:54:40', '2025-04-07 04:54:40');

-- ----------------------------
-- Table structure for fm_user_form_setting
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_setting`;
CREATE TABLE `fm_user_form_setting`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '表单key',
  `settings` json NULL COMMENT '设置内容 ',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 491 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '表单设置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_setting
-- ----------------------------

-- ----------------------------
-- Table structure for fm_user_form_theme
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_theme`;
CREATE TABLE `fm_user_form_theme`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '表单key',
  `submit_btn_text` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '提交按钮文字',
  `logo_img` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'logo图片',
  `logo_position` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'logo位置',
  `background_color` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '背景颜色',
  `background_img` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '背景图片',
  `show_title` tinyint(1) NULL DEFAULT 1 COMMENT '是否显示标题',
  `show_describe` tinyint(1) NULL DEFAULT 1 COMMENT '是否显示描述语',
  `theme_color` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '主题颜色\r\n',
  `show_number` tinyint(1) NULL DEFAULT 0 COMMENT '显示序号',
  `show_submit_btn` tinyint(1) NULL DEFAULT 1 COMMENT '显示提交按钮',
  `head_img_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头部图片',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1772 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '项目表单项' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_theme
-- ----------------------------

-- ----------------------------
-- Table structure for fm_user_form_view_count
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_view_count`;
CREATE TABLE `fm_user_form_view_count`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '表单唯一标识',
  `count` int NOT NULL DEFAULT 0,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `form_key`(`form_key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表单查看次数' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_view_count
-- ----------------------------
INSERT INTO `fm_user_form_view_count` VALUES (1, 'letdJG4N', 13, '2025-04-07 16:35:03', '2025-04-07 05:03:32');
INSERT INTO `fm_user_form_view_count` VALUES (2, 'r5CJnD52', 2, '2025-04-07 16:45:41', '2025-04-07 16:45:39');
INSERT INTO `fm_user_form_view_count` VALUES (3, 'uPdz9qqx', 1, '2025-04-07 21:41:14', '2025-04-07 21:41:14');

-- ----------------------------
-- Table structure for sys_env_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_env_config`;
CREATE TABLE `sys_env_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `env_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '配置key',
  `env_value` json NOT NULL COMMENT '参数键值',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '系统环境配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_env_config
-- ----------------------------
INSERT INTO `sys_env_config` VALUES (9, 'systemInfoConfig', '{\"webBaseUrl\": \"\", \"openWxMpLogin\": false}', '2023-04-04 14:33:29', '2023-04-06 21:19:21');
INSERT INTO `sys_env_config` VALUES (14, 'fileEnvConfig', '{\"ossType\": \"LOCAL\"}', '2023-03-26 14:34:38', '2023-04-04 22:48:43');

-- ----------------------------
-- Table structure for webhook_config
-- ----------------------------
DROP TABLE IF EXISTS `webhook_config`;
CREATE TABLE `webhook_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `hook_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Webhook配置名称',
  `source_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置的来源类型',
  `source_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '来源Id',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Webhook的URL地址',
  `request_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Webhook请求类型，如POST、GET等',
  `enabled` tinyint(1) NOT NULL COMMENT '是否启用',
  `other_options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '其他Webhook配置，例如请求头等。以JSON格式存储',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_type`(`source_type`, `source_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Webhook配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of webhook_config
-- ----------------------------

-- ----------------------------
-- Table structure for webhook_event
-- ----------------------------
DROP TABLE IF EXISTS `webhook_event`;
CREATE TABLE `webhook_event`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `webhook_config_id` bigint NOT NULL COMMENT '关联的Webhook配置ID',
  `source_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '来源的数据Id',
  `event_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Webhook事件类型',
  `event_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Webhook事件数据',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Webhook事件状态，如pending、success、failed等',
  `retry_times` int NOT NULL DEFAULT 0 COMMENT 'Webhook事件重试次数',
  `last_error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Webhook事件最后一次错误信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Webhook事件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of webhook_event
-- ----------------------------

-- ----------------------------
-- Table structure for wx_mp_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_mp_user`;
CREATE TABLE `wx_mp_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `appid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公众号AppId',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '性别',
  `head_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像',
  `union_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `open_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `is_subscribe` tinyint(1) NULL DEFAULT 1 COMMENT '是否关注',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户Id',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wx_union_id`(`head_img_url`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15651 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信公众号用户 ' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wx_mp_user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
