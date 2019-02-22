package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.ApprovalTrialQualifications;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ApprovalTrialQualificationsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ApprovalTrialQualifications record);

    int insertSelective(ApprovalTrialQualifications record);

    ApprovalTrialQualifications selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ApprovalTrialQualifications record);

    int updateByPrimaryKey(ApprovalTrialQualifications record);
}