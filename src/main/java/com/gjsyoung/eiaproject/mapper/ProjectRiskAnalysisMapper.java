package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.ProjectRiskAnalysis;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ProjectRiskAnalysisMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProjectRiskAnalysis record);

    int insertSelective(ProjectRiskAnalysis record);

    ProjectRiskAnalysis selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProjectRiskAnalysis record);

    int updateByPrimaryKey(ProjectRiskAnalysis record);
}