package com.gjsyoung.eiaproject.vo;

public interface CacheKey {



    String UserListByDepartmentId = "UserListByDepartmentId_";  // +departmentid   该部门下的用户缓存  有效期一分钟

    String projectInfoFileType = "projectInfoFileType";     //项目文件类型

    String projectInfoScope = "projectInfoScope_";          //+fileTypeId  该文件类型下的评价范围

    String departmentId = "department_";                  //+departmentid    获得部门
    String departments = "departments";                 //获得部门s
}
