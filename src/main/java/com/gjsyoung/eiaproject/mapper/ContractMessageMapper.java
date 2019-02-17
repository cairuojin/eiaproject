package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.ContractMessage;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ContractMessageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ContractMessage record);

    int insertSelective(ContractMessage record);

    ContractMessage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ContractMessage record);

    int updateByPrimaryKey(ContractMessage record);
}