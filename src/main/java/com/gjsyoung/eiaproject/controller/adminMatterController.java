package com.gjsyoung.eiaproject.controller;

import com.gjsyoung.eiaproject.domain.ProjectInfo;
import com.gjsyoung.eiaproject.domain.ProjectOperationRecord;
import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.mapper.ProjectInfoMapper;
import com.gjsyoung.eiaproject.mapper.ProjectOperationRecordMapper;
import com.gjsyoung.eiaproject.service.ProjectInfoService;
import com.gjsyoung.eiaproject.service.ProjectOperationRecordService;
import com.gjsyoung.eiaproject.service.UserService;
import com.gjsyoung.eiaproject.service.assist.AreasService;
import com.gjsyoung.eiaproject.vo.BaseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

import static com.gjsyoung.eiaproject.controller.adminIframeController.MATTER;

/**
 * @Classname adminMatterController
 * @Description 待办事项
 * @Date 2019/2/9 11:40
 * @Created by cairuojin
 */
@Controller
@RequestMapping("/${authentication}/matter")
public class adminMatterController {

    @Autowired
    ProjectInfoService projectInfoService;

    @Autowired
    ProjectInfoMapper projectInfoMapper;

    @Autowired
    AreasService areasService;

    @Autowired
    UserService userService;

    @Autowired
    ProjectOperationRecordService projectOperationRecordService;

    /**
     * 进入单个人员分配页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/allotmentPersonnel")
    public ModelAndView allotmentPersonnel(String projectInfoId){
        ModelAndView mav = new ModelAndView(MATTER + "allotmentPersonnel");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(Integer.valueOf(projectInfoId));
        projectInfo.setProvince(areasService.getProvince(projectInfo.getProvince()).getProvince());     //省市区代码转name
        projectInfo.setCity(areasService.getCity(projectInfo.getCity()).getCity());
        projectInfo.setArea(areasService.getArea(projectInfo.getArea()).getArea());
        List<User> userList = userService.getUserListByDepartment(projectInfo.getSubordinatedepartmentid().toString()); //搜寻该部门用户
        mav.addObject("projectInfo",projectInfo);
        mav.addObject("userList",userList);
        return mav;
    }

    /**
     * 进行人员分配
     * @param id    项目id
     * @param hostUserId    主持人
     * @param organizingUserId  组织人
     * @return
     * @throws BaseException
     */
    @RequestMapping("/allotment")
    @ResponseBody
    public String allotment(Integer id, Integer hostUserId,Integer organizingUserId, HttpSession session) throws BaseException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(id);
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        projectInfo.setHostuserid(hostUserId);
        projectInfo.setOrganizinguserid(organizingUserId);
        projectInfo.setStatus(2);
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,id,1);
        return "OK";
    }

}
