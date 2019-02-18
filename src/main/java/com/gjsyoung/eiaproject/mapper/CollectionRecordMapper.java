package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.CollectionRecord;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CollectionRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CollectionRecord record);

    int insertSelective(CollectionRecord record);

    CollectionRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CollectionRecord record);

    int updateByPrimaryKey(CollectionRecord record);

    List<CollectionRecord> selectByProjectId(Integer projectId);
}