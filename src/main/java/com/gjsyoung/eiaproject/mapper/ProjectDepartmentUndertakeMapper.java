package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.ProjectDepartmentUndertake;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ProjectDepartmentUndertakeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProjectDepartmentUndertake record);

    int insertSelective(ProjectDepartmentUndertake record);

    ProjectDepartmentUndertake selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProjectDepartmentUndertake record);

    int updateByPrimaryKey(ProjectDepartmentUndertake record);
}