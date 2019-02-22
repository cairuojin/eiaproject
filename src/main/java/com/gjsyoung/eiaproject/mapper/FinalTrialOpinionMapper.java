package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.FinalTrialOpinion;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface FinalTrialOpinionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(FinalTrialOpinion record);

    int insertSelective(FinalTrialOpinion record);

    FinalTrialOpinion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(FinalTrialOpinion record);

    int updateByPrimaryKey(FinalTrialOpinion record);

    List<FinalTrialOpinion> selectByProjectId(Integer projectId);

    int deleteByProjectId(Integer projectId);
}