package com.gjsyoung.eiaproject.controller;

import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.mapper.UserMapper;
import com.gjsyoung.eiaproject.vo.BaseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * @author cairuojin
 * @create 2019-01-25 12:56
 */
@Controller
@RequestMapping("/${authentication}/user")
public class adminUserController {

    @Autowired
    UserMapper userMapper;

    @Value("${UploadPath}")
    String UploadPath;

    /**
     * 更新个人信息
     * @param file
     * @param request
     * @param user
     * @return
     * @throws BaseException
     * @throws IOException
     */
    @RequestMapping("/updatePersonalInfo")
    @ResponseBody
    public String updatePersonalInfo(MultipartFile file, HttpServletRequest request,User user) throws BaseException, IOException {
        Object userObj = request.getSession().getAttribute("user");
        if(userObj == null)
            throw BaseException.FAILED(500,"您还没有登录哦！" );

        user.setId(((User) userObj).getId());   //从session中获得主键
        user.setUsername(null);                 //防止接口攻击
        user.setPassword(null);

        //图片上传
        if(file != null && !"undefined".equals(file)){
            String fileName = file.getOriginalFilename();
            String type=fileName.indexOf(".")!=-1?fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()):null;
            if(type == null){
                throw BaseException.FAILED(400,"上传的类型有误！" );
            }else{
                if(("JPEG".equals(type.toUpperCase())||"PNG".equals(type.toUpperCase())||"JPG".equals(type.toUpperCase()))){
                    if(fileName.length()>8)
                        fileName = fileName.substring(fileName.length()-8);
                    String path ="images/personalImg/"  + System.currentTimeMillis() + fileName;
                    File personalFile = new File(UploadPath + path);
                    file.transferTo(personalFile);
                    user.setImgurl(path);  //设置路径
                } else {
                    throw BaseException.FAILED(400,"上传的类型有误！" );
                }
            }
        }

        user.setUpdatetime(new Date());
        userMapper.updateByPrimaryKeySelective(user);
        user = userMapper.selectByPrimaryKey(user.getId());
        request.getSession().setAttribute("user",user); //更新数据
        return "OK";
    }


    /**
     * 修改密码
     * @param session
     * @param oldPassword
     * @param newPassword
     * @return
     * @throws BaseException
     */
    @RequestMapping("/changePassword")
    @ResponseBody
    public String changePassword(HttpSession session , String oldPassword, String newPassword) throws BaseException {
        Object obj = session.getAttribute("user");
        if(obj == null)
            throw BaseException.FAILED(500,"您还没有登录哦！" );
        User user = (User) obj;
        if(!user.getPassword().equals(oldPassword)){
            return "您输入的密码有误！";
        }
        user.setPassword(newPassword);
        user.setUpdatetime(new Date());
        userMapper.updateByPrimaryKeySelective(user);
        session.removeAttribute("user");
        return "OK" ;
    }


}