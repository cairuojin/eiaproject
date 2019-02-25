package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.DocumentRepertoire;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface DocumentRepertoireMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DocumentRepertoire record);

    int insertSelective(DocumentRepertoire record);

    DocumentRepertoire selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DocumentRepertoire record);

    int updateByPrimaryKey(DocumentRepertoire record);
}