package com.gjsyoung.eiaproject.service;

import com.gjsyoung.eiaproject.domain.User;

import java.util.List;

/**
 * create by cairuojin on 2019/01/28
 */
public interface UserService {

    public List<User> selectAndQueryOtherName(String orderString, String name, String departmentString, Integer roleId);



}
