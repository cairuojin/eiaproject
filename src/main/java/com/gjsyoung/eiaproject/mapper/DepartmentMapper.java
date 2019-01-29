package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.Department;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface DepartmentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKeyWithBLOBs(Department record);

    int updateByPrimaryKey(Department record);

    List<Department> selectAllByStatusAndOrder(@Param("status")Integer status , @Param("orderBy")String[] orderBy);

    int selectSortOrderByParentId(Integer parentId);
}