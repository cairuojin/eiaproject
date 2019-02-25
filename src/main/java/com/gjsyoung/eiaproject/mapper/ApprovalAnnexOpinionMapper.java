package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.ApprovalAnnexOpinion;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ApprovalAnnexOpinionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ApprovalAnnexOpinion record);

    int insertSelective(ApprovalAnnexOpinion record);

    ApprovalAnnexOpinion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ApprovalAnnexOpinion record);

    int updateByPrimaryKey(ApprovalAnnexOpinion record);
}