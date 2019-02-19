package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.ProjectMonitoringProgramme;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ProjectMonitoringProgrammeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProjectMonitoringProgramme record);

    int insertSelective(ProjectMonitoringProgramme record);

    ProjectMonitoringProgramme selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProjectMonitoringProgramme record);

    int updateByPrimaryKey(ProjectMonitoringProgramme record);
}