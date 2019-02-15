package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.ProjectManagerUndertake;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ProjectManagerUndertakeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProjectManagerUndertake record);

    int insertSelective(ProjectManagerUndertake record);

    ProjectManagerUndertake selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProjectManagerUndertake record);

    int updateByPrimaryKey(ProjectManagerUndertake record);
}