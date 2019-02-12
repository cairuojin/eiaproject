package com.gjsyoung.eiaproject.utils;

import com.gjsyoung.eiaproject.vo.BaseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * @Classname UploadUtil
 * @Description TODO
 * @Date 2019/2/12 16:23
 * @Created by cairuojin
 */
@Component
public class UploadUtil {

    @Value("${UploadPath}")
    String UploadPath;

    /**
     * 上传图片
     * @param file
     * @param uploadPath    地址
     * @return
     * @throws BaseException
     * @throws IOException
     */
    public String uploadPic(MultipartFile file, String uploadPath) throws BaseException, IOException {
        //图片上传
        if(file != null && !"undefined".equals(file)){
            String fileName = file.getOriginalFilename();
            String type=fileName.indexOf(".")!=-1?fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()):null;
            if(type == null){
                throw BaseException.FAILED(400,"上传的类型有误！" );
            }else{
                if(("JPEG".equals(type.toUpperCase())||"PNG".equals(type.toUpperCase())||"JPG".equals(type.toUpperCase()))){
                    if(fileName.length()>20)
                        fileName = fileName.substring(fileName.length()-20);
                    String path = uploadPath  + System.currentTimeMillis() + "_" + fileName;
                    File personalFile = new File(UploadPath + path);
                    file.transferTo(personalFile);
                    return path;
                } else {
                    throw BaseException.FAILED(400,"上传的类型有误！");
                }
            }
        }
        return "error";
    }

    /**
     * 上传
     * @param file
     * @param uploadPath
     * @return
     * @throws BaseException
     * @throws IOException
     */
    public String upload(MultipartFile file, String uploadPath) throws BaseException, IOException {
        if (file != null && !"undefined".equals(file)) {
            String fileName = file.getOriginalFilename();
            if (fileName.length() > 20)
                fileName = fileName.substring(fileName.length() - 20);
            String path = uploadPath + System.currentTimeMillis() + "_" + fileName;
            File personalFile = new File(UploadPath + path);
            file.transferTo(personalFile);
            return path;

        }
        return "error";
    }

}
