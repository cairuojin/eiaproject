package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.ContractLeader;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ContractLeaderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ContractLeader record);

    int insertSelective(ContractLeader record);

    ContractLeader selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ContractLeader record);

    int updateByPrimaryKey(ContractLeader record);
}