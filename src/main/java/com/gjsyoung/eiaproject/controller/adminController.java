package com.gjsyoung.eiaproject.controller;

import com.alibaba.fastjson.JSON;
import com.gjsyoung.eiaproject.domain.Category;
import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * create by cairuojin on 2019/01/22
 */
@Controller
@RequestMapping("/${authentication}")
public class adminController {

    @Autowired
    CategoryService categoryService;

    /**
     * 重定向到管理页面
     *
     * @return
     */
    @RequestMapping("/")
    public String adminIndex() {
        return "admin";
    }


    @RequestMapping("/getCategory")
    @ResponseBody
    public String getCategory(@RequestParam(defaultValue = "1") String headerPage , HttpSession session) throws Exception {
        Object userObj = session.getAttribute("user");
        User user = null;
        if (userObj == null) {
            throw new Exception("用户未登录");
        } else {
            user = (User)userObj;
        }

        List<Category> categoryByUser = categoryService.getCategoryByUser(headerPage , user);
        String jsonCategory = JSON.toJSONString(categoryByUser);
        return jsonCategory;


    }
}
