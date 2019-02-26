package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.DocumentApplication;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface DocumentApplicationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DocumentApplication record);

    int insertSelective(DocumentApplication record);

    DocumentApplication selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DocumentApplication record);

    int updateByPrimaryKey(DocumentApplication record);

    List<DocumentApplication> selectByProjectid(Integer projectid);

    int deleteByProjectid(Integer projectid);
}