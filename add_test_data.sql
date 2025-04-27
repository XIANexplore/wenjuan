-- 添加测试问卷数据
INSERT INTO `fm_user_form` 
(`form_key`, `source_id`, `source_type`, `name`, `description`, `user_id`, `type`, `status`, `is_deleted`, `is_folder`, `folder_id`, `update_time`, `create_time`) 
VALUES 
('test001', NULL, NULL, '测试问卷1', '这是一个测试问卷描述', 1, 'GENERAL', 2, 0, 0, 0, NOW(), NOW()),
('test002', NULL, NULL, '测试问卷2', '这是第二个测试问卷', 1, 'GENERAL', 2, 0, 0, 0, NOW(), NOW()),
('test003', NULL, NULL, '测试问卷3', '这是第三个测试问卷', 1, 'GENERAL', 2, 0, 0, 0, NOW(), NOW());

-- 添加问卷项目数据
INSERT INTO `fm_user_form_item` 
(`form_key`, `form_item_id`, `type`, `label`, `is_display_type`, `is_hide_type`, `show_label`, `default_value`, `required`, `placeholder`, `sort`, `span`, `scheme`, `update_time`, `create_time`) 
VALUES 
('test001', 'field1', 'input', '姓名', 0, 0, 1, '', 1, '请输入姓名', 1, 24, '{"name":"姓名","type":"input","show":true,"label":"姓名","value":"","hidden":false,"disabled":false,"required":true,"validator":"","maxLength":null,"clearable":true,"placeholder":"请输入姓名","showPassword":false}', NOW(), NOW()),
('test001', 'field2', 'input', '邮箱', 0, 0, 1, '', 1, '请输入邮箱', 2, 24, '{"name":"邮箱","type":"input","show":true,"label":"邮箱","value":"","hidden":false,"disabled":false,"required":true,"validator":"","maxLength":null,"clearable":true,"placeholder":"请输入邮箱","showPassword":false}', NOW(), NOW()),
('test001', 'field3', 'date', '填写日期', 0, 0, 1, '', 1, '请选择日期', 3, 24, '{"name":"填写日期","type":"date","show":true,"label":"填写日期","value":"","hidden":false,"disabled":false,"required":true,"validator":"","clearable":true,"placeholder":"请选择日期","rangeSeparator":"至","startPlaceholder":"开始日期","endPlaceholder":"结束日期"}', NOW(), NOW());
