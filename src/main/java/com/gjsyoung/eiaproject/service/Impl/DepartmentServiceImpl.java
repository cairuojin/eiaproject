package com.gjsyoung.eiaproject.service.Impl;


import com.gjsyoung.eiaproject.domain.Department;
import com.gjsyoung.eiaproject.mapper.DepartmentMapper;
import com.gjsyoung.eiaproject.service.DepartmentService;
import com.gjsyoung.eiaproject.utils.RedisCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.gjsyoung.eiaproject.vo.CacheKey.departmentId;
import static com.gjsyoung.eiaproject.vo.CacheKey.departments;

/**
 * create by cairuojin on 2019/01/28
 */
@Service
public class DepartmentServiceImpl implements DepartmentService{

    @Autowired
    RedisCache redisCache;

    @Autowired
    DepartmentMapper departmentMapper;

    /**
     * 从缓存中获得部门列表
     * @return
     */
    @Override
    public List<Department> getDepartments() {
        Object departmentsObj = redisCache.getObject(departments);
        if(departmentsObj != null)
            return (List<Department>) departmentsObj;
        else {
            String[] arr = {"is_parent", "parent_id", "sort_order"};
            List departments = departmentMapper.selectAllByStatusAndOrder(0, arr);  //排序字段
            redisCache.putObject(departments, departments);
            return departments;
        }
    }

    /**
     * 从缓存中根据id获得部门
     * @param id
     * @return
     */
    @Override
    public Department getDepartmentById(Integer id) {
        Object departmentObj = redisCache.getObject(departmentId + id);
        if(departmentObj != null)
            return (Department) departmentObj;
        else{
            Department department = departmentMapper.selectByPrimaryKey(id);
            redisCache.putObject(departmentId + id, department);
            return department;
        }
    }

    /**
     * 封装list中父节点的name
     * @param departments
     */
    @Override
    public void queryParentName(List<Department> departments) {
        for (Department department : departments){
            Department parentDepartment = getDepartmentById(department.getParentId());
            department.setParentName(parentDepartment == null ? "": parentDepartment.getName());
        }
    }
    @Override
    public void queryParentName(Department department) {
        Department parentDepartment = getDepartmentById(department.getParentId());
        department.setParentName(parentDepartment == null ? "": parentDepartment.getName());
    }
}
