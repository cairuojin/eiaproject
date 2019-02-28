package com.gjsyoung.eiaproject.controller;

import com.gjsyoung.eiaproject.domain.*;
import com.gjsyoung.eiaproject.mapper.ApprovalAgreelQualificationsMapper;
import com.gjsyoung.eiaproject.mapper.ApprovalTrialQualificationsMapper;
import com.gjsyoung.eiaproject.mapper.ProjectInfoMapper;
import com.gjsyoung.eiaproject.mapper.ProjectWorkPlanMapper;
import com.gjsyoung.eiaproject.vo.BaseException;
import com.gjsyoung.eiaproject.vo.ProjectListVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.gjsyoung.eiaproject.controller.adminIframeController.PROJECT;

/**
 * create by cairuojin on 2019/02/02
 */
@Controller
@RequestMapping("/${authentication}/project")
public class adminProjectController {

    @Autowired
    ProjectInfoMapper projectInfoMapper;

    @Autowired
    ProjectWorkPlanMapper projectWorkPlanMapper;

    @Autowired
    ApprovalTrialQualificationsMapper approvalTrialQualificationsMapper;

    @Autowired
    ApprovalAgreelQualificationsMapper approvalAgreelQualificationsMapper;

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



    /**
     * 工作进度详细
     * @return
     */
    @RequestMapping("/processOfWork")
    public ModelAndView processOfWork(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(PROJECT + "processOfWork");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        List<ProjectWorkPlan> projectWorkPlans = projectWorkPlanMapper.selectAllByProjectId(projectInfoId);
        mav.addObject("projectWorkPlans",projectWorkPlans);
        return mav;
    }


    /**
     * 工作进度详细
     * @return
     */
    @RequestMapping("/qualificationsReissueDetail")
    public ModelAndView qualificationsReissueDetail(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(PROJECT + "qualificationsReissueDetail");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        ApprovalTrialQualifications approvalTrialQualifications = approvalTrialQualificationsMapper.selectByPrimaryKey(projectInfoId);
        ApprovalAgreelQualifications approvalAgreelQualifications = approvalAgreelQualificationsMapper.selectByPrimaryKey(projectInfoId);

        if(projectInfo.getStatus() != 33)
            throw BaseException.FAILED(400,"该项目状态有误");
        mav.addObject("projectInfo",projectInfo);

        if(approvalAgreelQualifications != null){
            if(approvalAgreelQualifications.getQualificationserialtime() != null)
                approvalAgreelQualifications.setIsQualifications(1);
            mav.addObject("approvalAgreelQualifications",approvalAgreelQualifications);
        }

        if(approvalTrialQualifications != null){
            if(approvalTrialQualifications.getQualificationserialtime() != null)
                approvalTrialQualifications.setIsQualifications(1);
            mav.addObject("approvalTrialQualifications",approvalTrialQualifications);
        }
        return mav;
    }

    /**
     * 申请资质补报
     * @param id
     * @param qualificationsVersion
     * @param qualificationnumber
     * @param qualificationremarks
     * @return
     * @throws BaseException
     */
    @RequestMapping("/qualificationsReissue")
    @ResponseBody
    public String qualificationsReissue(Integer id, Integer qualificationsVersion, Integer qualificationnumber, String qualificationremarks) throws BaseException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(id);
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 33)
            throw BaseException.FAILED(400,"该项目状态有误");
        if(qualificationsVersion == 0){
            ApprovalTrialQualifications approvalTrialQualifications = approvalTrialQualificationsMapper.selectByPrimaryKey(id);
            if(approvalTrialQualifications == null)
                throw BaseException.FAILED(404,"找不到该存档资讯表");
            approvalTrialQualifications.setQualificationnumber(qualificationnumber);
            approvalTrialQualifications.setQualificationremarks(qualificationremarks);
            approvalTrialQualificationsMapper.updateByPrimaryKeySelective(approvalTrialQualifications);
        } else {
            ApprovalAgreelQualifications approvalAgreelQualifications = approvalAgreelQualificationsMapper.selectByPrimaryKey(id);
            if(approvalAgreelQualifications == null)
                throw BaseException.FAILED(404,"找不到该存档资讯表");
            approvalAgreelQualifications.setQualificationnumber(qualificationnumber);
            approvalAgreelQualifications.setQualificationremarks(qualificationremarks);
            approvalAgreelQualificationsMapper.updateByPrimaryKeySelective(approvalAgreelQualifications);
        }
        return "OK";
    }

}
