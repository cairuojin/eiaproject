package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.FirstTrialReport;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface FirstTrialReportMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(FirstTrialReport record);

    int insertSelective(FirstTrialReport record);

    FirstTrialReport selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(FirstTrialReport record);

    int updateByPrimaryKey(FirstTrialReport record);
}