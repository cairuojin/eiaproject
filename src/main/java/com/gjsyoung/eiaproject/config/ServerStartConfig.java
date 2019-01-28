package com.gjsyoung.eiaproject.config;

import com.gjsyoung.eiaproject.domain.Category;
import com.gjsyoung.eiaproject.domain.Role;
import com.gjsyoung.eiaproject.mapper.CategoryMapper;
import com.gjsyoung.eiaproject.mapper.RoleMapper;
import com.gjsyoung.eiaproject.service.CategoryService;
import com.gjsyoung.eiaproject.service.Impl.CategoryServiceImpl;
import com.gjsyoung.eiaproject.service.Impl.RoleServiceImpl;
import com.gjsyoung.eiaproject.service.RoleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.annotation.Order;
import org.springframework.data.annotation.AccessType;
import org.springframework.stereotype.Component;

import java.util.*;

/**
 * create by cairuojin on 2019/01/23
 * 服务器启动配置
 */
@Component
public class ServerStartConfig implements CommandLineRunner {

    private static final Logger logger = LoggerFactory.getLogger(ServerStartConfig.class);

    private static Map roleMap = new HashMap(); //身份导航内容<id, role>
    private static List<Role> roleList = null;

    @Autowired
    CategoryService categoryService;

    @Autowired
    RoleService roleService;
    /**
     * 服务器启动时加载导航到内存
     * @return
     */
    @Override
    public void run(String... args) throws Exception {
        categoryService.loadCategory(); //加载导航
        roleService.loadRole();         //加载角色表
    }


    public static Map getRoleMap() {
        return roleMap;
    }

    public static void setRoleMap(Map roleMap) {
        ServerStartConfig.roleMap = roleMap;
    }

    public static List getRoleList() {
        return roleList;
    }

    public static void setRoleList(List roleList) {
        ServerStartConfig.roleList = roleList;
    }
}
