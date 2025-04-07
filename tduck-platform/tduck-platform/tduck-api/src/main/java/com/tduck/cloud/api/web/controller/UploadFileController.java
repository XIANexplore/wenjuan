package com.tduck.cloud.api.web.controller;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.CharUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.crypto.SecureUtil;
import com.tduck.cloud.common.util.Result;
import com.tduck.cloud.storage.cloud.OssStorageFactory;
import com.tduck.cloud.api.util.MimeTypeUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.security.PermitAll;
import java.io.IOException;

/**
 * 表单文件上传
 *
 * @author : smalljop
 * @description : 上传文件
 * @create : 2020-11-27 14:00
 **/
@RestController
@RequiredArgsConstructor
@Slf4j
public class UploadFileController {

    /**
     * 上传用户文件
     * <p>
     * 用户Id MD5加密 同一个用户的文件放在一个目录下
     *
     * @param file
     * @param userId
     * @return
     * @throws IOException
     */
    @PostMapping("/user/file/upload")
    public Result<String> uploadUserFile(@RequestParam("file") MultipartFile file,
            @RequestParam(value = "fileType", required = false, defaultValue = "DEFAULT") String fileType,
            @RequestAttribute Long userId) throws IOException {
        try {
            log.info("开始上传用户文件, 用户ID: {}, 文件名: {}, 文件类型: {}",
                    userId, file.getOriginalFilename(), fileType);

            // 构建文件路径
            String path = SecureUtil.md5(String.valueOf(userId)) +
                    CharUtil.SLASH +
                    IdUtil.simpleUUID() +
                    CharUtil.DOT +
                    FileUtil.extName(file.getOriginalFilename());

            log.info("文件存储路径: {}", path);

            // 检查文件类型
            OssStorageFactory.checkAllowedExtension(file, MimeTypeUtils.MimeTypeEnum.valueOf(fileType).getExtensions());

            // 上传文件
            String url = OssStorageFactory.getStorageService().upload(file.getInputStream(), path);
            log.info("文件上传成功, 访问地址: {}", url);

            return Result.success(url);
        } catch (Exception e) {
            log.error("文件上传失败: {}", e.getMessage(), e);
            return Result.failed("文件上传失败: " + e.getMessage());
        }
    }

    /**
     * 表单文件上传
     *
     * @param file    文件
     * @param formKey 表单key
     * @return 文件地址
     * @throws IOException IO异常
     */
    @PostMapping("/form/file/upload/{formKey}")
    @PermitAll
    public Result<String> uploadFormFile(@RequestParam("file") MultipartFile file,
            @RequestParam(value = "fileType", required = false, defaultValue = "DEFAULT") String fileType,
            @PathVariable("formKey") String formKey) throws IOException {
        try {
            log.info("开始上传表单文件, 表单Key: {}, 文件名: {}, 文件类型: {}",
                    formKey, file.getOriginalFilename(), fileType);

            // 构建文件路径
            String path = SecureUtil.md5(formKey) +
                    CharUtil.SLASH +
                    IdUtil.simpleUUID() +
                    CharUtil.DOT +
                    FileUtil.extName(file.getOriginalFilename());

            log.info("表单文件存储路径: {}", path);

            // 检查文件类型
            OssStorageFactory.checkAllowedExtension(file, MimeTypeUtils.MimeTypeEnum.valueOf(fileType).getExtensions());

            // 上传文件
            String url = OssStorageFactory.getStorageService().upload(file.getInputStream(), path);
            log.info("表单文件上传成功, 访问地址: {}", url);

            return Result.success(url);
        } catch (Exception e) {
            log.error("表单文件上传失败: {}", e.getMessage(), e);
            return Result.failed("表单文件上传失败: " + e.getMessage());
        }
    }

}
