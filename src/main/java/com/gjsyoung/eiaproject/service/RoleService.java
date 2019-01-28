package com.gjsyoung.eiaproject.service;

import com.gjsyoung.eiaproject.domain.Category;
import com.gjsyoung.eiaproject.domain.Role;

import java.util.List;

/**
 * create by cairuojin on 2019/01/23
 */
public interface RoleService {

    public void loadRole();

    public Role selectByRoleID(Integer id);

    public List<Role> getList();
}
