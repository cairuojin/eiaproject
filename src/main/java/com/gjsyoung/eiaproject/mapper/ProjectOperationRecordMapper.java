package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.ProjectOperationRecord;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ProjectOperationRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProjectOperationRecord record);

    int insertSelective(ProjectOperationRecord record);

    ProjectOperationRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProjectOperationRecord record);

    int updateByPrimaryKey(ProjectOperationRecord record);
}