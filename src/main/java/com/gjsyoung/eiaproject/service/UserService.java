package com.gjsyoung.eiaproject.service;

import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.vo.BaseException;
import com.gjsyoung.eiaproject.vo.UserListVo;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * create by cairuojin on 2019/01/28
 */
public interface UserService {

    public User getFromSession(HttpSession session) throws BaseException;

    public UserListVo selectAndQueryOtherName(UserListVo userListVo);

    public void queryRoleName(List<User> users);

    public List<User> getUserListByDepartment(String departmentId);

    public List<User> getUserListByDepartmentAndRole(String departmentId, Integer[]roleList);
}
