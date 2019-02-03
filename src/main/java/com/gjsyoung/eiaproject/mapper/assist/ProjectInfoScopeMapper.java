package com.gjsyoung.eiaproject.mapper.assist;

import com.gjsyoung.eiaproject.domain.assist.ProjectInfoScope;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ProjectInfoScopeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProjectInfoScope record);

    int insertSelective(ProjectInfoScope record);

    ProjectInfoScope selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProjectInfoScope record);

    int updateByPrimaryKey(ProjectInfoScope record);

    List<ProjectInfoScope> selectAll();
;}