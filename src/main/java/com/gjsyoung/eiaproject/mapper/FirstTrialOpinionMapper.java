package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.FirstTrialOpinion;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface FirstTrialOpinionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(FirstTrialOpinion record);

    int insertSelective(FirstTrialOpinion record);

    FirstTrialOpinion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(FirstTrialOpinion record);

    int updateByPrimaryKey(FirstTrialOpinion record);
}