package com.gjsyoung.eiaproject.service;

import com.gjsyoung.eiaproject.domain.Category;
import com.gjsyoung.eiaproject.domain.User;

import java.util.List;

/**
 * create by cairuojin on 2019/01/23
 */
public interface CategoryService {

    public void loadCategory();

    public List<Category> getCategoryByRoleEngName(String headerPage , String engRoleName);

    public List<Category> getCategoryByUser(String headerPage , User user);
}
