package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.ContractFinance;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ContractFinanceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ContractFinance record);

    int insertSelective(ContractFinance record);

    ContractFinance selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ContractFinance record);

    int updateByPrimaryKey(ContractFinance record);
}