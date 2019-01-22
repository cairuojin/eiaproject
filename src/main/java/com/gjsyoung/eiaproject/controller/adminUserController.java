package com.gjsyoung.eiaproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * create by cairuojin on 2019/01/22
 */
@Controller
@RequestMapping("/${authentication}/user")
public class adminUserController {


    @RequestMapping("/usernameExist")
    public Boolean usernameExist(){
        return true;//存在返回true  不存在false
    }

}
