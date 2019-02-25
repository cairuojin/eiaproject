package com.gjsyoung.eiaproject.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gjsyoung.eiaproject.domain.Department;
import com.gjsyoung.eiaproject.domain.Role;
import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.mapper.UserMapper;
import com.gjsyoung.eiaproject.service.DepartmentService;
import com.gjsyoung.eiaproject.service.RoleService;
import com.gjsyoung.eiaproject.service.UserService;
import com.gjsyoung.eiaproject.utils.RedisCache;
import com.gjsyoung.eiaproject.vo.BaseException;
import com.gjsyoung.eiaproject.vo.UserListVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;

import static com.gjsyoung.eiaproject.vo.CacheKey.UserListByDepartmentId;

/**
 * create by cairuojin on 2019/01/28
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    RoleService roleService;

    @Autowired
    DepartmentService departmentService;

    @Autowired
    UserMapper userMapper;

    @Autowired
    PageHelper pageHelper;

    @Autowired
    RedisCache redisCache;

    /**
     * 筛选用户列表
     */
    @Override
    public UserListVo selectAndQueryOtherName(UserListVo userListVo) {
        if (userListVo.getRoleId() != null && userListVo.getRoleId() == -1)   //无选择身份
            userListVo.setRoleId(null);
        if (userListVo.getName() != null && userListVo.getName().trim().equals("")) //无输入姓名
            userListVo.setName(null);
        if (userListVo.getDepartmentString() != null && userListVo.getDepartmentString().trim().equals("")) //无输入部门
            userListVo.setDepartmentString(null);
        if (userListVo.getOrderString() != null && userListVo.getOrderString().trim().equals("")) //无选择排序
            userListVo.setOrderString(null);

        PageHelper.startPage(userListVo.getPageNow(), userListVo.getPageSize(),true);
        List<User> users = userMapper.selectAllLikeAndOrderBy(userListVo.getOrderString(), userListVo.getName(), userListVo.getDepartmentString(), userListVo.getRoleId());
        PageInfo pageInfo = new PageInfo<>(users,userListVo.getPageSize());  //分页信息

        queryRoleName(users);   //查询RoleName

        userListVo.setUsers(users);
        userListVo.setPageTotal(pageInfo.getPages());
        userListVo.setSizeTotal(pageInfo.getTotal());
        return userListVo;
    }

    /**
     * 传入UserList 遍历查询其身份名字roleName和部门名字departmentName
     * @param users
     */
    @Override
    public void queryRoleName(List<User> users){
        for (User user : users) {
            Role role = roleService.selectByRoleID(user.getRole());
            user.setRoleName(role == null ? "未设定" : role.getRolename());
            Department department = departmentService.getDepartmentById(user.getDepartment());
            String parentDepartmentName = "";
            if(department.getParentId() != -1)
                parentDepartmentName = departmentService.getDepartmentById(department.getParentId()).getName() + " - ";
            user.setDepartmentName(department == null ? "未设定" : parentDepartmentName + department.getName());
        }
    }

    /**
     * 从session中获得用户
     * @param session
     * @return
     */
    @Override
    public User getFromSession(HttpSession session) throws BaseException {
        Object userObj = session.getAttribute("user");
        if (userObj != null){
            return (User)userObj;
        } else {
            throw BaseException.FAILED(500,"您还未登录");
        }
    }

    /**
     * 搜寻该部门下的用户列表(缓存一分钟)
     * @param departmentId
     * @return
     */
    @Override
    public List<User> getUserListByDepartment(String departmentId) {
        List<User> userList = null;
        Object object = redisCache.getObject(UserListByDepartmentId + departmentId);
        if(object == null){
            userList = userMapper.selectByDepartmentId(departmentId);
            queryRoleName(userList);
            redisCache.putObjectWithTimeParam(UserListByDepartmentId + departmentId,userList, 1L , TimeUnit.MINUTES);
        } else {
            userList = (List<User>) object;
        }
        return userList;
    }

    /**
     * 获得该部门用户下  身份为...的用户列表
     * @param departmentId
     * @param roleList
     * @return
     */
    @Override
    public List<User> getUserListByDepartmentAndRole(String departmentId, Integer[]roleList) {
        List<User> userListByDepartment = getUserListByDepartment(departmentId);
        List<Integer> userListRole = Arrays.asList(roleList);
        List<User> userList = new ArrayList<>();
        for(User user : userListByDepartment){
            if(userListRole.contains(user.getRole())){
                userList.add(user);
            }

        }
        return userList;
    }
}
