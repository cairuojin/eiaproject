package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.ApprovalAgreelQualifications;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ApprovalAgreelQualificationsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ApprovalAgreelQualifications record);

    int insertSelective(ApprovalAgreelQualifications record);

    ApprovalAgreelQualifications selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ApprovalAgreelQualifications record);

    int updateByPrimaryKey(ApprovalAgreelQualifications record);

    int countByQualificationserialNumber(String qualificationserialnumber);
}