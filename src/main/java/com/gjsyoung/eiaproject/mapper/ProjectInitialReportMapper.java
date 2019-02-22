package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.ProjectInitialReport;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ProjectInitialReportMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProjectInitialReport record);

    int insertSelective(ProjectInitialReport record);

    ProjectInitialReport selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProjectInitialReport record);

    int updateByPrimaryKey(ProjectInitialReport record);
}