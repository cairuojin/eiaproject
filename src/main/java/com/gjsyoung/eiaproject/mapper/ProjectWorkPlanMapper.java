package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.ProjectWorkPlan;

public interface ProjectWorkPlanMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProjectWorkPlan record);

    int insertSelective(ProjectWorkPlan record);

    ProjectWorkPlan selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProjectWorkPlan record);

    int updateByPrimaryKey(ProjectWorkPlan record);
}