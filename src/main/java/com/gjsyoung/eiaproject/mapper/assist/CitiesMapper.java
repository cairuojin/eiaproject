package com.gjsyoung.eiaproject.mapper.assist;

import com.gjsyoung.eiaproject.domain.assist.Cities;

public interface CitiesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Cities record);

    int insertSelective(Cities record);

    Cities selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Cities record);

    int updateByPrimaryKey(Cities record);
}