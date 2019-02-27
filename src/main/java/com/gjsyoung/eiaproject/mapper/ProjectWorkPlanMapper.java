package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.ProjectWorkPlan;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ProjectWorkPlanMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProjectWorkPlan record);

    int insertSelective(ProjectWorkPlan record);

    ProjectWorkPlan selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProjectWorkPlan record);

    int updateByPrimaryKey(ProjectWorkPlan record);

    List<ProjectWorkPlan> selectAllByStatus(Integer status);

    List<ProjectWorkPlan> selectAllByProjectId(Integer projectid);

    int countBeImplementByProjectid(Integer projectid);
}