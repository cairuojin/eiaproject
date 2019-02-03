package com.gjsyoung.eiaproject.service;

import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.vo.UserListVo;

import java.util.List;

/**
 * create by cairuojin on 2019/01/28
 */
public interface UserService {

    public UserListVo selectAndQueryOtherName(UserListVo userListVo);

    public void queryRoleName(List<User> users);

}
