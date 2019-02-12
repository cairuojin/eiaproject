package com.gjsyoung.eiaproject.controller;

import com.gjsyoung.eiaproject.domain.ProjectInfo;
import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.mapper.ProjectInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * create by cairuojin on 2019/02/02
 */
@Controller
@RequestMapping("/${authentication}/project")
public class adminProjectController {

    @Autowired
    ProjectInfoMapper projectInfoMapper;

    /**
     * 添加项目信息
     * @param projectInfo
     * @return
     */
    @RequestMapping("/addProject")
    @ResponseBody
    public String addProject(ProjectInfo projectInfo , HttpSession session){
        projectInfo.setCreatetime(new Date());
        projectInfo.setUpdatetime(new Date());
        User user = (User) session.getAttribute("user");
        projectInfo.setCreateuserid(user.getId());
        projectInfo.setStatus(1);   //待分配人员
        projectInfoMapper.insert(projectInfo);
        //清除项目缓存
        return "OK";
    }

}
