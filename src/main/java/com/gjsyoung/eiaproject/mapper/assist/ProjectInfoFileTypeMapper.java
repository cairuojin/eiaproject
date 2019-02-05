package com.gjsyoung.eiaproject.mapper.assist;

import com.gjsyoung.eiaproject.domain.assist.ProjectInfoFileType;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ProjectInfoFileTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProjectInfoFileType record);

    int insertSelective(ProjectInfoFileType record);

    ProjectInfoFileType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProjectInfoFileType record);

    int updateByPrimaryKey(ProjectInfoFileType record);

    List<ProjectInfoFileType> selectAll();
}