package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.ApprovalReply;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ApprovalReplyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ApprovalReply record);

    int insertSelective(ApprovalReply record);

    ApprovalReply selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ApprovalReply record);

    int updateByPrimaryKey(ApprovalReply record);
}