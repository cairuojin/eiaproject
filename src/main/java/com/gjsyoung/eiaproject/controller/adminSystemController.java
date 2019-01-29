package com.gjsyoung.eiaproject.controller;

import com.gjsyoung.eiaproject.domain.Department;
import com.gjsyoung.eiaproject.mapper.DepartmentMapper;
import com.gjsyoung.eiaproject.service.DepartmentService;
import com.gjsyoung.eiaproject.utils.RedisCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

    @Autowired
    DepartmentService departmentService;



//    @RequestMapping("sortUserList")
//    public ModelAndView sortUserList(String name, String department, Integer roleId,  String orderString){
//        ModelAndView mav = new ModelAndView("")
//    }





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

    /**
     * 添加部门信息
     * @param department
     * @return
     */
    @RequestMapping("/addDepartment")
    @ResponseBody
    public String addDepartment(Department department){
        Department fatherDepartment = departmentService.getDepartmentById(department.getParentId());//查找父对象

        department.setStatus(0);
        department.setIsParent(fatherDepartment.getIsParent() + 1);
        department.setSortOrder(departmentMapper.selectSortOrderByParentId(department.getParentId()));
        departmentMapper.insert(department);
        redisCache.putObject("department_" + department.getId(),department);
        redisCache.removeObject("departments");    //清除导航缓存
        return "OK";
    }

}