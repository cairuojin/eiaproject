package com.gjsyoung.eiaproject.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gjsyoung.eiaproject.domain.Department;
import com.gjsyoung.eiaproject.domain.ProjectInfo;
import com.gjsyoung.eiaproject.mapper.ProjectInfoMapper;
import com.gjsyoung.eiaproject.service.DepartmentService;
import com.gjsyoung.eiaproject.service.ProjectInfoService;
import com.gjsyoung.eiaproject.vo.ProjectListVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectInfoServiceImpl implements ProjectInfoService {

    @Autowired
    ProjectInfoMapper projectInfoMapper;

    @Autowired
    DepartmentService departmentService;

    /**
     * 根据ProjectListVo查询项目列表
     * @param projectListVo
     * @return
     */
    @Override
    public ProjectListVo selectAndQuery(ProjectListVo projectListVo) {
        if (projectListVo.getName() != null && projectListVo.getName().trim().equals(""))
            projectListVo.setName(null);
        if (projectListVo.getNumber() != null && projectListVo.getNumber().trim().equals(""))
            projectListVo.setNumber(null);
        if (projectListVo.getRoleName() != null && projectListVo.getRoleName().trim().equals(""))
            projectListVo.setRoleName(null);
        if (projectListVo.getProvince() != null && projectListVo.getProvince().trim().equals(""))
            projectListVo.setProvince(null);
        if (projectListVo.getCity() != null && projectListVo.getCity().trim().equals(""))
            projectListVo.setCity(null);
        if (projectListVo.getArea() != null && projectListVo.getArea().trim().equals(""))
            projectListVo.setArea(null);

        PageHelper.startPage(projectListVo.getPageNow(), projectListVo.getPageSize(),true);
        List<ProjectInfo> projectInfos = projectInfoMapper.selectAndQuery(projectListVo);

        //设置部门对象
        for (ProjectInfo projectInfo : projectInfos){
            Department department = departmentService.getDepartmentById(projectInfo.getSubordinatedepartmentid());
            departmentService.queryParentName(department);
            projectInfo.setDepartment(department);
        }

        PageInfo pageInfo = new PageInfo<>(projectInfos,projectListVo.getPageSize());  //分页信息
        projectListVo.setPageTotal(pageInfo.getPages());
        projectListVo.setSizeTotal(pageInfo.getTotal());

        projectListVo.setProjectInfos(projectInfos);
        return projectListVo;
    }
}
