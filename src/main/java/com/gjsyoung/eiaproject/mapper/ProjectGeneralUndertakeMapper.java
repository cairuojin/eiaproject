package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.ProjectGeneralUndertake;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ProjectGeneralUndertakeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProjectGeneralUndertake record);

    int insertSelective(ProjectGeneralUndertake record);

    ProjectGeneralUndertake selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProjectGeneralUndertake record);

    int updateByPrimaryKey(ProjectGeneralUndertake record);
}