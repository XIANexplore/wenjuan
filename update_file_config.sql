-- 更新文件存储配置
UPDATE `sys_env_config`
SET `env_value` = JSON_SET(
    `env_value`,
    '$.ossType', 'LOCAL',
    '$.uploadFolder', 'F:/wechat/success/wenjuan/wenjuan/images',  -- 设置为项目根目录下的images文件夹
    '$.accessPathPattern', '/images/**',
    '$.domain', NULL  -- 设置为NULL，让系统自动生成域名
)
WHERE `env_key` = 'fileEnvConfig';
