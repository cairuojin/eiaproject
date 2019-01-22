package com.gjsyoung.eiaproject.controller;

import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * create by cairuojin on 2019/01/22
 * 首页控制器
 */
@Controller
public class IndexController {


    @Autowired
    UserMapper userMapper;

    /**
     * 进入首页
     * @return
     */
    @RequestMapping("/")
    public String index(){
        return "index";
    }

    /**
     * 判断用户名是否存在
     * @return
     */
    @RequestMapping("/${open}/person/usernameExist")
    @ResponseBody
    public Boolean usernameExist(String username){
        int count = userMapper.countByUsername(username);
        return count != 0 ? true : false ;//存在返回true  不存在false
    }

    /**
     * 用户登录
     * @param username
     * @param password
     * @return
     */
    @RequestMapping("/${open}/person/login")
    @ResponseBody
    public Boolean login(String username, String password, HttpSession session){
        User user = userMapper.selectByUsername(username);
        if(user.getPassword() .equals(password)){
            session.setAttribute("user",user);
            return true;
        } else {
            return false;
        }
    }
}
