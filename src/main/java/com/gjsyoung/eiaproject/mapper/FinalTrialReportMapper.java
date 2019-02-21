package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.FinalTrialReport;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface FinalTrialReportMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(FinalTrialReport record);

    int insertSelective(FinalTrialReport record);

    FinalTrialReport selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(FinalTrialReport record);

    int updateByPrimaryKey(FinalTrialReport record);
}