package com.gjsyoung.eiaproject.vo;

/**
 * 缓存KEY
 */
public interface CacheKey {



    String UserListByDepartmentId = "UserListByDepartmentId_";  // +departmentid   该部门下的用户缓存  有效期一分钟

    String projectInfoFileType = "projectInfoFileType";     //项目文件类型列表

    String projectInfoScope = "projectInfoScope_";          //+fileTypeId  该文件类型下的评价范围

    String projectInfoStatus = "projectInfoStatus";         //项目状态列表


    String departmentId = "department_";                  //+departmentid    获得部门
    String departments = "departments";                 //获得部门s

    String fileTypeDocument = "fileTypeDocument_";      //+fileTypeId 获得存档要求

    String projectRecord = "projectRecord_";    //项目记录
}
