package com.gjsyoung.eiaproject.controller;

import com.alibaba.fastjson.JSON;
import com.gjsyoung.eiaproject.domain.Category;
import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.mapper.UserMapper;
import com.gjsyoung.eiaproject.service.CategoryService;
import com.gjsyoung.eiaproject.service.DepartmentService;
import com.gjsyoung.eiaproject.service.RoleService;
import com.gjsyoung.eiaproject.vo.BaseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * create by cairuojin on 2019/01/22
 * 管理页面基础controller
 */
@Controller
@RequestMapping("/${authentication}")
public class adminController {

    @Autowired
    CategoryService categoryService;

    @Autowired
    UserMapper userMapper;

    @Autowired
    RoleService roleService;

    @Autowired
    DepartmentService departmentService;

    /**
     * 重定向到管理页面
     *
     * @return
     */
    @RequestMapping("/")
    public String adminIndex() {
        return "admin";
    }

    /**
     * 根据身份获得左边导航
     * @param headerPage    顶端导航当前位置 默认为1
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/getCategory")
    @ResponseBody
    public String getCategory(@RequestParam(defaultValue = "1") String headerPage , HttpSession session) throws BaseException {
        Object userObj = session.getAttribute("user");
        User user;
        if (userObj == null) {

            user = userMapper.selectByUsername("cairuojin");
            user.setDepartmentName(departmentService.getDepartmentById(user.getDepartment()).getName());
            user.setRoleName(roleService.selectByRoleID(user.getRole()).getRolename());
            session.setAttribute("user",user);

            //throw BaseException.FAILED(400,"用户未登录");  //todo 身份填充
        } else {
            user = (User)userObj;
        }

        List<Category> categoryByUser = categoryService.getCategoryByUser(headerPage , user);   //获得左边导航
        String jsonCategory = JSON.toJSONString(categoryByUser);
        return jsonCategory;
    }
}
