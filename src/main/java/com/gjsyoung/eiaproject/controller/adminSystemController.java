package com.gjsyoung.eiaproject.controller;

import com.gjsyoung.eiaproject.domain.Department;
import com.gjsyoung.eiaproject.domain.Role;
import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.domain.assist.ProjectInfoFileType;
import com.gjsyoung.eiaproject.domain.assist.ProjectInfoFileTypeDocument;
import com.gjsyoung.eiaproject.mapper.DepartmentMapper;
import com.gjsyoung.eiaproject.mapper.UserMapper;
import com.gjsyoung.eiaproject.mapper.assist.ProjectInfoFileTypeDocumentMapper;
import com.gjsyoung.eiaproject.mapper.assist.ProjectInfoFileTypeMapper;
import com.gjsyoung.eiaproject.service.DepartmentService;
import com.gjsyoung.eiaproject.service.RoleService;
import com.gjsyoung.eiaproject.service.UserService;
import com.gjsyoung.eiaproject.service.assist.ProjectInfoAssistService;
import com.gjsyoung.eiaproject.utils.RedisCache;
import com.gjsyoung.eiaproject.utils.UploadUtil;
import com.gjsyoung.eiaproject.vo.BaseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import static com.gjsyoung.eiaproject.vo.CacheKey.fileTypeDocument;

/** 系统管理controller
 * @author cairuojin
 * @create 2019-01-27 19:28
 */
@Controller
@RequestMapping("/${authentication}/system")
public class adminSystemController {

    public final static String SYSTEM = "SYSTEM_";

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    RedisCache redisCache;

    @Autowired
    DepartmentService departmentService;

    @Autowired
    UserMapper userMapper;

    @Autowired
    RoleService roleService;

    @Autowired
    UploadUtil uploadUtil;

    @Autowired
    ProjectInfoAssistService projectInfoAssistService;

    @Autowired
    ProjectInfoFileTypeDocumentMapper projectInfoFileTypeDocumentMapper;

    @Autowired
    UserService userService;


    /**
     * 跳转到添加用户页面
     * @return
     */
    @RequestMapping("/addUserView")
    public ModelAndView addUserView(){
        ModelAndView mav = new ModelAndView(SYSTEM + "addUser");
        List<Role> list = roleService.getList();
        List<Department> departments = departmentService.getDepartments();
        departmentService.queryParentName(departments);   //需要展示父name
        mav.addObject("roleList",list );
        mav.addObject("departments",departments);
        return mav;
    }

    /**
     * 管理员添加用户
     * @return
     */
    @RequestMapping("/addUser")
    @ResponseBody
    public String addUser(MultipartFile file, User user) throws BaseException, IOException {
        user.setImgurl(uploadUtil.uploadPic(file,"images/personalImg/"));
        user.setCreatetime(new Date());
        user.setUpdatetime(new Date());
        userMapper.insert(user);    //添加用户
        return "OK";
    }


    /**
     * 管理员根据id进入相应的用户页面
     * @param id
     * @return
     * @throws BaseException
     */
    @RequestMapping("/editUser")
    public ModelAndView editUser(@RequestParam( required = true ) Integer id) throws BaseException {
        ModelAndView mav = new ModelAndView(SYSTEM + "editUser");
        User user = userMapper.selectByPrimaryKey(id);  //根据id查用户
        if(user == null)
            throw BaseException.FAILED(404,"找不到该用户");
        mav.addObject("user",user);
        List<Role> roles = roleService.getList();        // 身份表和部门表
        List<Department> departments = departmentService.getDepartments();
        departmentService.queryParentName(departments);
        mav.addObject("roleList",roles);
        mav.addObject("departments",departments);
        return mav;
    }


    /**
     * 更新相应个人信息
     * @param file
     * @param request
     * @param user
     * @return
     * @throws BaseException
     * @throws IOException
     */
    @RequestMapping("/updatePersonalInfo")
    @ResponseBody
    public String updatePersonalInfo(MultipartFile file, HttpServletRequest request, User user) throws BaseException, IOException {
        user.setUsername(null);                 //防止接口攻击
        if(file != null)
            user.setImgurl(uploadUtil.uploadPic(file,"images/personalImg/"));
        userMapper.updateByPrimaryKeySelective(user);
        return "OK";
    }



    /**
     * 管理员删除用户
     * @param userIdList
     * @param session
     * @return
     */
    @RequestMapping("/deleteUsers")
    @ResponseBody
    public String deleteUsers(@RequestParam("userIdList[]") List<Integer> userIdList, HttpSession session){
        User user = (User) session.getAttribute("user");
        if (userIdList.contains(user.getId())){
            return "您不能删除您自己";
        }
        userMapper.deleteByListId(userIdList);
        return "OK";
    }




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

        department.setStatus(1);    //待分配人员状态
        department.setIsParent(fatherDepartment.getIsParent() + 1);
        department.setSortOrder(departmentMapper.selectSortOrderByParentId(department.getParentId()));
        departmentMapper.insert(department);
        redisCache.putObject("department_" + department.getId(),department);
        redisCache.removeObject("departments");    //清除导航缓存
        return "OK";
    }



    /**
     * 添加存档要求
     * @param projectInfoFileTypeDocument
     * @return
     */
    @RequestMapping("/addRequirement")
    @ResponseBody
    public String addDepartment(ProjectInfoFileTypeDocument projectInfoFileTypeDocument, HttpSession session) throws BaseException {

        ProjectInfoFileType fileType = projectInfoAssistService.getFileType(projectInfoFileTypeDocument.getFiletypeid());
        if(fileType == null){
            throw BaseException.FAILED(404,"找不到该文件类型");
        }
        User fromSession = userService.getFromSession(session);
        projectInfoFileTypeDocument.setCreatetime(new Date());
        projectInfoFileTypeDocument.setCreateuserid(fromSession.getId());
        projectInfoFileTypeDocumentMapper.insert(projectInfoFileTypeDocument);
        redisCache.removeObject(fileTypeDocument + projectInfoFileTypeDocument.getFiletypeid());  //添加后清空缓存
        return "OK";
    }

    /**
     * 添加存档要求
     * @param projectInfoFileTypeDocument
     * @return
     */
    @RequestMapping("/updateRequirement")
    @ResponseBody
    public String updateRequirement(ProjectInfoFileTypeDocument projectInfoFileTypeDocument, HttpSession session) throws BaseException {
        if(projectInfoFileTypeDocumentMapper.selectByPrimaryKey(projectInfoFileTypeDocument.getId()) == null){
            throw BaseException.FAILED(404,"找不到该文件类型要求");
        }
        
        projectInfoFileTypeDocumentMapper.updateByPrimaryKeySelective(projectInfoFileTypeDocument);
        projectInfoFileTypeDocument = projectInfoFileTypeDocumentMapper.selectByPrimaryKey(projectInfoFileTypeDocument.getId());
        redisCache.removeObject(fileTypeDocument + projectInfoFileTypeDocument.getFiletypeid());  //添加后清空缓存
        return "OK";
    }


    /**
     * 删除存档要求
     * @param id
     * @return
     */
    @RequestMapping("/deleteRequirement")
    @ResponseBody
    public String deleteRequirement(Integer id){
        ProjectInfoFileTypeDocument projectInfoFileTypeDocument = projectInfoFileTypeDocumentMapper.selectByPrimaryKey(id);
        int i = projectInfoFileTypeDocumentMapper.deleteByPrimaryKey(id);
        redisCache.removeObject(fileTypeDocument + projectInfoFileTypeDocument.getFiletypeid());  //添加后清空缓存
        return "OK";
    }
}