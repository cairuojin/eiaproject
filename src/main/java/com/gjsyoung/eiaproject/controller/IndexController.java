package com.gjsyoung.eiaproject.controller;

import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.mapper.UserMapper;
import com.gjsyoung.eiaproject.service.DepartmentService;
import com.gjsyoung.eiaproject.service.RoleService;
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

    @Autowired
    DepartmentService departmentService;

    @Autowired
    RoleService roleService;

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
        return count != 0 ? false : true ;//存在返回false  不存在true 满足条件
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
            user.setDepartmentName(departmentService.getDepartmentById(user.getDepartment()).getName());
            user.setRoleName(roleService.selectByRoleID(user.getRole()).getRolename());
            session.setAttribute("user",user);
            return true;
        } else {
            return false;
        }
    }

    @RequestMapping("/${open}/person/logout")
    @ResponseBody
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "OK";
    }
}
