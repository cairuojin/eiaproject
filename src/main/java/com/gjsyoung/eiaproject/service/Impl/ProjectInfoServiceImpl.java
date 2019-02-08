package com.gjsyoung.eiaproject.service.Impl;

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
        List<ProjectInfo> projectInfos = projectInfoMapper.selectAndQuery(new ProjectListVo());

        //设置部门对象
        for (ProjectInfo projectInfo : projectInfos){
            Department department = departmentService.getDepartmentById(projectInfo.getSubordinatedepartmentid());
            departmentService.queryParentName(department);
            projectInfo.setDepartment(department);
        }

        //设置承接人、


        projectListVo.setProjectInfos(projectInfos);
        return projectListVo;
    }
}
