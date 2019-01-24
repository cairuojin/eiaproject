package com.gjsyoung.eiaproject.service.Impl;

import com.gjsyoung.eiaproject.domain.Role;
import com.gjsyoung.eiaproject.mapper.RoleMapper;
import com.gjsyoung.eiaproject.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * create by cairuojin on 2019/01/23
 */
@Service
public class RoleServiceImpl implements RoleService {

    private Map roleMap = new HashMap(); //身份导航内容

    @Autowired
    RoleMapper roleMapper;

    /**
     * 加载角色表到内存中
     */
    @Override
    public void loadRole() {
        List<Role> roleList = roleMapper.selectAll();
        roleList.forEach(role ->{
            this.roleMap.put(role.getId(),role);
        });
    }

    /**
     * 根据role ID获得其role
     * @param id
     * @return
     */
    @Override
    public Role selectByRoleID(Integer id) {
        Role role = (Role) this.roleMap.get(id);
        return role;
    }




}
