package com.gjsyoung.eiaproject.controller;

import com.gjsyoung.eiaproject.domain.Department;
import com.gjsyoung.eiaproject.mapper.DepartmentMapper;
import com.gjsyoung.eiaproject.utils.RedisCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author cairuojin
 * @create 2019-01-27 19:28
 */
@Controller
@RequestMapping("/${authentication}/system")
public class adminSystemController {


    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    RedisCache redisCache;

    /**
     * 修改部门信息
     * @param department
     * @return
     */
    @RequestMapping("/updateDepartment")
    @ResponseBody
    public String updateDepartment(Department department){
        departmentMapper.updateByPrimaryKeySelective(department);
        redisCache.removeObject("departments");
        redisCache.removeObject("department_" + department.getId());    //清除缓存
        return "OK";
    }

}