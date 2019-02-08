package com.gjsyoung.eiaproject.mapper.assist;

import com.gjsyoung.eiaproject.domain.assist.ProjectInfoStatus;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ProjectInfoStatusMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProjectInfoStatus record);

    int insertSelective(ProjectInfoStatus record);

    ProjectInfoStatus selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProjectInfoStatus record);

    int updateByPrimaryKey(ProjectInfoStatus record);

    List<ProjectInfoStatus> selectAll();
}