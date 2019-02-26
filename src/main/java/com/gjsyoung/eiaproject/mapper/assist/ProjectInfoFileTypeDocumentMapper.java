package com.gjsyoung.eiaproject.mapper.assist;

import com.gjsyoung.eiaproject.domain.assist.ProjectInfoFileType;
import com.gjsyoung.eiaproject.domain.assist.ProjectInfoFileTypeDocument;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ProjectInfoFileTypeDocumentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProjectInfoFileTypeDocument record);

    int insertSelective(ProjectInfoFileTypeDocument record);

    ProjectInfoFileTypeDocument selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProjectInfoFileTypeDocument record);

    int updateByPrimaryKey(ProjectInfoFileTypeDocument record);

    List<ProjectInfoFileTypeDocument> selectByFileTypeId(Integer filetypeid);
}