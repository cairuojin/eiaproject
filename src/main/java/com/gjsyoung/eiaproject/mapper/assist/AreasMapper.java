package com.gjsyoung.eiaproject.mapper.assist;

import com.gjsyoung.eiaproject.domain.assist.Areas;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface AreasMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Areas record);

    int insertSelective(Areas record);

    Areas selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Areas record);

    int updateByPrimaryKey(Areas record);

    List<Areas> selectAll();
}