package com.gjsyoung.eiaproject.service;

import com.gjsyoung.eiaproject.domain.Role;

/**
 * create by cairuojin on 2019/01/23
 */
public interface RoleService {

    public void loadRole();

    public Role selectByRoleID(Integer id);
}
