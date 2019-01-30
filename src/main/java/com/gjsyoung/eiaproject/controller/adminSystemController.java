package com.gjsyoung.eiaproject.controller;

import com.gjsyoung.eiaproject.domain.Department;
import com.gjsyoung.eiaproject.domain.Role;
import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.mapper.DepartmentMapper;
import com.gjsyoung.eiaproject.mapper.UserMapper;
import com.gjsyoung.eiaproject.service.DepartmentService;
import com.gjsyoung.eiaproject.service.RoleService;
import com.gjsyoung.eiaproject.utils.RedisCache;
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

/**
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

    @Value("${UploadPath}")
    String UploadPath;

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
        //图片上传
        if(file != null && !"undefined".equals(file)){
            String fileName = file.getOriginalFilename();
            String type=fileName.indexOf(".")!=-1?fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()):null;
            if(type == null){
                throw BaseException.FAILED(400,"上传的类型有误！" );
            }else{
                if(("JPEG".equals(type.toUpperCase())||"PNG".equals(type.toUpperCase())||"JPG".equals(type.toUpperCase()))){
                    if(fileName.length()>8)
                        fileName = fileName.substring(fileName.length()-8);
                    String path ="images/personalImg/"  + System.currentTimeMillis() + fileName;
                    File personalFile = new File(UploadPath + path);
                    file.transferTo(personalFile);
                    user.setImgurl(path);  //设置路径
                } else {
                    throw BaseException.FAILED(400,"上传的类型有误！" );
                }
            }
        }

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
        //图片上传
        if(file != null && !"undefined".equals(file)){
            String fileName = file.getOriginalFilename();
            String type=fileName.indexOf(".")!=-1?fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()):null;
            if(type == null){
                throw BaseException.FAILED(400,"上传的类型有误！" );
            }else{
                if(("JPEG".equals(type.toUpperCase())||"PNG".equals(type.toUpperCase())||"JPG".equals(type.toUpperCase()))){
                    if(fileName.length()>8)
                        fileName = fileName.substring(fileName.length()-8);
                    String path ="images/personalImg/"  + System.currentTimeMillis() + fileName;
                    File personalFile = new File(UploadPath + path);
                    file.transferTo(personalFile);
                    user.setImgurl(path);  //设置路径
                } else {
                    throw BaseException.FAILED(400,"上传的类型有误！" );
                }
            }
        }

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

        department.setStatus(0);
        department.setIsParent(fatherDepartment.getIsParent() + 1);
        department.setSortOrder(departmentMapper.selectSortOrderByParentId(department.getParentId()));
        departmentMapper.insert(department);
        redisCache.putObject("department_" + department.getId(),department);
        redisCache.removeObject("departments");    //清除导航缓存
        return "OK";
    }

}