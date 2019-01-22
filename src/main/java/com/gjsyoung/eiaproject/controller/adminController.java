package com.gjsyoung.eiaproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * create by cairuojin on 2019/01/22
 */
@Controller
@RequestMapping("/${authentication}")
public class adminController {

    /**
     * 重定向到管理页面
     * @return
     */
    @RequestMapping("/")
    public String adminIndex(){
        return "admin";//存在返回true  不存在false
    }

}
