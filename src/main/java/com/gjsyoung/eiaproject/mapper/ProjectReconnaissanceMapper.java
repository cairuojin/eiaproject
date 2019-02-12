package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.ProjectReconnaissance;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ProjectReconnaissanceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProjectReconnaissance record);

    int insertSelective(ProjectReconnaissance record);

    ProjectReconnaissance selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProjectReconnaissance record);

    int updateByPrimaryKey(ProjectReconnaissance record);
}