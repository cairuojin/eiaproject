package com.gjsyoung.eiaproject.service.Impl;

import com.gjsyoung.eiaproject.config.ServerStartConfig;
import com.gjsyoung.eiaproject.domain.Category;
import com.gjsyoung.eiaproject.domain.Role;
import com.gjsyoung.eiaproject.mapper.RoleMapper;
import com.gjsyoung.eiaproject.service.RoleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * create by cairuojin on 2019/01/23
 */
@Service
public class RoleServiceImpl implements RoleService {

    private static final Logger logger = LoggerFactory.getLogger(RoleServiceImpl.class);

    @Autowired
    RoleMapper roleMapper;

    /**
     * 加载角色表到内存中
     */
    @Override
    public void loadRole() {
        long l1 = System.currentTimeMillis();
        logger.info("开始加载角色");
        List<Role> roleList = roleMapper.selectAll();
        ServerStartConfig.setRoleList(roleList);
        Map roleMap = ServerStartConfig.getRoleMap();
        roleList.forEach(role ->{
            roleMap.put(role.getId(),role);
        });
        logger.info("加载角色完毕  ms : " + (System.currentTimeMillis() - l1));
    }

    /**
     * 根据role ID获得其role
     * @param id
     * @return
     */
    @Override
    public Role selectByRoleID(Integer id) {
        Map roleMap = ServerStartConfig.getRoleMap();
        Role role = (Role) roleMap.get(id);
        return role;
    }

    /**
     * 获得RoleList
     * @return
     */
    @Override
    public List<Role> getList() {
        return ServerStartConfig.getRoleList();
    }



}
