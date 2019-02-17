package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.CollectionPlan;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CollectionPlanMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CollectionPlan record);

    int insertSelective(CollectionPlan record);

    CollectionPlan selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CollectionPlan record);

    int updateByPrimaryKey(CollectionPlan record);
}