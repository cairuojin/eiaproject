package com.gjsyoung.eiaproject.mapper;

import com.gjsyoung.eiaproject.domain.ProjectInfo;
import com.gjsyoung.eiaproject.vo.ProjectListVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ProjectInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProjectInfo record);

    int insertSelective(ProjectInfo record);

    ProjectInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProjectInfo record);

    int updateByPrimaryKeyWithBLOBs(ProjectInfo record);

    int updateByPrimaryKey(ProjectInfo record);

    List<ProjectInfo> selectAndQuery(ProjectListVo projectListVo);  //根据Vo查询项目列表
}