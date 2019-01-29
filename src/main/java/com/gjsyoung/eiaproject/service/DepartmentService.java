package com.gjsyoung.eiaproject.service;

import com.gjsyoung.eiaproject.domain.Department;

import java.util.List;

/**
 * create by cairuojin on 2019/01/28
 */
public interface DepartmentService {

    public List<Department> getDepartments();

    public Department getDepartmentById(Integer id);

    public void queryParentName(List<Department> departments);
}
