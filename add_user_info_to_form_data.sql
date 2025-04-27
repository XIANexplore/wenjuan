-- 修改fm_user_form_data表，添加用户名和邮箱字段
ALTER TABLE `fm_user_form_data` 
ADD COLUMN `user_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '填写人姓名' AFTER `ext_value`,
ADD COLUMN `user_email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '填写人邮箱' AFTER `user_name`;
