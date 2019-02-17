package com.gjsyoung.eiaproject.controller;

import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.mapper.UserMapper;
import com.gjsyoung.eiaproject.service.UserService;
import com.gjsyoung.eiaproject.utils.RedisCache;
import com.gjsyoung.eiaproject.utils.UploadUtil;
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
import java.util.List;
import java.util.concurrent.TimeUnit;

import static com.gjsyoung.eiaproject.vo.CacheKey.UserListByDepartmentId;

/** 用户信息controller
 * @author cairuojin
 * @create 2019-01-25 12:56
 */
@Controller
@RequestMapping("/${authentication}/user")
public class adminUserController {

    @Autowired
    UserMapper userMapper;

    @Autowired
    RedisCache redisCache;

    @Autowired
    UserService userService;

    @Autowired
    UploadUtil uploadUtil;

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
        if(file != null)    //有图片上传图片
            user.setImgurl(uploadUtil.uploadPic(file, "images/personalImg/"));
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

    /**
     * 传入部门，从缓存中获取该部门员工列表（缓存有效期1分钟，因为可能会修改了用户的部门属性）
     * @param departmentId
     * @return
     */
    @RequestMapping("/getUsersListByDepartment")
    @ResponseBody
    public List<User> getUsersListByDepartment(String departmentId){
        List<User> userList = userService.getUserListByDepartment(departmentId);
        return userList;
    }

}