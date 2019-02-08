package com.gjsyoung.eiaproject.controller;

import com.gjsyoung.eiaproject.domain.Department;
import com.gjsyoung.eiaproject.domain.ProjectInfo;
import com.gjsyoung.eiaproject.domain.Role;
import com.gjsyoung.eiaproject.domain.assist.ProjectInfoFileType;
import com.gjsyoung.eiaproject.domain.assist.ProjectInfoStatus;
import com.gjsyoung.eiaproject.domain.assist.Provinces;
import com.gjsyoung.eiaproject.mapper.DepartmentMapper;
import com.gjsyoung.eiaproject.mapper.ProjectInfoMapper;
import com.gjsyoung.eiaproject.mapper.UserMapper;
import com.gjsyoung.eiaproject.service.DepartmentService;
import com.gjsyoung.eiaproject.service.ProjectInfoService;
import com.gjsyoung.eiaproject.service.RoleService;
import com.gjsyoung.eiaproject.service.UserService;
import com.gjsyoung.eiaproject.service.assist.AreasService;
import com.gjsyoung.eiaproject.service.assist.ProjectInfoAssistService;
import com.gjsyoung.eiaproject.vo.ProjectListVo;
import com.gjsyoung.eiaproject.vo.UserListVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * create by cairuojin on 2019/01/22
 */
@Controller
@RequestMapping("/${authentication}/iframe")
public class adminIframeController {


    public final static String MATTER = "MATTER_";      //页面前缀
    public final static String PROJECT = "PROJECT_";
    public final static String SYSTEM = "SYSTEM_";
    public final static String USER = "USER_";

    @Autowired
    RoleService roleService;

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    DepartmentService departmentService;

    @Autowired
    UserMapper userMapper;

    @Autowired
    UserService userService;

    @Autowired
    AreasService areasService;

    @Autowired
    ProjectInfoAssistService projectInfoAssistService;

    @Autowired
    ProjectInfoMapper projectInfoMapper;

    @Autowired
    ProjectInfoService projectInfoService;

    /* 2、项目管理 */

    /**
     * 项目列表
     * @return
     */
    @RequestMapping("/projectInfo")
    public ModelAndView projectInfo(ProjectListVo projectListVo){
        ModelAndView mav = new ModelAndView(PROJECT + "projectInfo");
        projectListVo = projectInfoService.selectAndQuery(projectListVo);   //todo 项目高级搜索   项目列表

        List<ProjectInfoFileType> projectInfoFileTypes = projectInfoAssistService.loadFileTypeList();//文件类型列表
        List<ProjectInfoStatus> projectInfoStatuses = projectInfoAssistService.loadStatus();    //状态列表
        List<Department> departments = departmentService.getDepartments();  //部门列表
        departmentService.queryParentName(departments);
        List<Provinces> provinces = areasService.getProvinces();    //省份列表

        mav.addObject("projectListVo",projectListVo);
        mav.addObject("projectInfoFileTypes",projectInfoFileTypes);
        mav.addObject("projectInfoStatuses",projectInfoStatuses);
        mav.addObject("departments",departments);
        mav.addObject("provinces",provinces);
        return mav;
    }

    /**
     * 新增项目
     * @return
     */
    @RequestMapping("/projectInfo_add")
    public ModelAndView projectInfo_add(){
        ModelAndView mav = new ModelAndView(PROJECT + "projectInfo_add");
        List<Provinces> provinces = areasService.getProvinces();    //省份列表
        List fileTypeList = projectInfoAssistService.loadFileTypeList();    //文件类型列表
        List<Department> departments = departmentService.getDepartments();  //部门列表
        departmentService.queryParentName(departments);
        mav.addObject("provinces",provinces);
        mav.addObject("fileTypeList",fileTypeList);
        mav.addObject("departments",departments);
        return mav;
    }



    /* 3、系统管理 */

    /**
     * 用户信息
     * @return
     */
    @RequestMapping("/userList")
    public ModelAndView userList(UserListVo userListVo){
        ModelAndView mav = new ModelAndView(SYSTEM + "userList");
        userListVo = userService.selectAndQueryOtherName(userListVo);//用户列表
        List<Role> roleList = roleService.getList();    //角色列表
        mav.addObject("userListVo",userListVo);
        mav.addObject("roleList",roleList);
        return mav;
    }


    /**
     * 部门信息，获得部门导航
     * @return
     */
    @RequestMapping("/department")
    public ModelAndView department(){
        ModelAndView mav = new ModelAndView(SYSTEM + "department");
        List<Department> departments = departmentService.getDepartments();  //获得部门列表
        mav.addObject("departments", departments);
        return mav;
    }

    /**
     * 部门详细信息
     * @param id 部门id
     * @return
     */
    @RequestMapping("/department/info")
    public ModelAndView departmentInfo(@RequestParam(defaultValue = "1") Integer id){
        ModelAndView mav = new ModelAndView(SYSTEM + "department_info");
        Department department = departmentService.getDepartmentById(id);
        mav.addObject("department", department);
        return mav;
    }

    /**
     * 新增部门
     * @return
     */
    @RequestMapping("/department/add")
    public ModelAndView departmentAdd(){
        ModelAndView mav = new ModelAndView(SYSTEM + "department_add");
        return mav;
    }



    /* 4、个人设置 */

    /**
     * 个人信息设置
     * @param session
     * @return
     */
    @RequestMapping("/personalInfo")
    public ModelAndView personalInfo(HttpSession session){
        ModelAndView mav = new ModelAndView(USER + "personalInfo");
        List<Role> list = roleService.getList();
        List<Department> departments = departmentService.getDepartments();
        departmentService.queryParentName(departments);   //需要展示父name
        mav.addObject("roleList",list );
        mav.addObject("departments",departments);
        return mav;
    }

    /**
     * 修改密码
     * @param session
     * @return
     */
    @RequestMapping("/changepassword")
    public ModelAndView changepassword(HttpSession session){
        ModelAndView mav = new ModelAndView(USER + "changepassword");
        return mav;
    }

}
