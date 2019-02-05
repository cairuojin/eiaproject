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
import com.gjsyoung.eiaproject.vo.UserListVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    /**
     * 查询departmentName 和 roleName
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
     * 传入UserList 遍历查询其身份名字
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
}
