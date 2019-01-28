package com.gjsyoung.eiaproject.service.Impl;

import com.gjsyoung.eiaproject.domain.Department;
import com.gjsyoung.eiaproject.domain.Role;
import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.mapper.UserMapper;
import com.gjsyoung.eiaproject.service.DepartmentService;
import com.gjsyoung.eiaproject.service.RoleService;
import com.gjsyoung.eiaproject.service.UserService;
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

    /**
     * 查询departmentName 和 roleName
     */
    @Override
    public List<User> selectAndQueryOtherName(String orderString, String name, String departmentString, Integer roleId) {
        List<User> users = userMapper.selectAllLikeAndOrderBy(orderString, name, departmentString, roleId);
        for (User user : users){
            Role role = roleService.selectByRoleID(user.getRole());
            user.setRoleName(role == null ? "未设定" : role.getRolename());
            Department department = departmentService.getDepartmentById(user.getDepartment());
            user.setDepartmentName(department == null ? "未设定" : department.getName());
        }
        return users;
    }
}
