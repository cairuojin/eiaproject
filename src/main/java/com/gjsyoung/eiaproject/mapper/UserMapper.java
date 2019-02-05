package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    int countByUsername(String username);

    User selectByUsername(String username);

    List<User> selectAllLikeAndOrderBy(@Param("orderString")String orderString, @Param("name")String name, @Param("department")String department, @Param("roleId")Integer roleId);

    int deleteByListId(List ids);

    List<User> selectByDepartmentId(String departmentId);
}