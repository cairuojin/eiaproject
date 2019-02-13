package com.gjsyoung.eiaproject.controller;

import com.gjsyoung.eiaproject.domain.ProjectInfo;
import com.gjsyoung.eiaproject.domain.ProjectReconnaissance;
import com.gjsyoung.eiaproject.domain.ProjectRiskAnalysis;
import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.mapper.ProjectInfoMapper;
import com.gjsyoung.eiaproject.mapper.ProjectReconnaissanceMapper;
import com.gjsyoung.eiaproject.mapper.ProjectRiskAnalysisMapper;
import com.gjsyoung.eiaproject.service.ProjectInfoService;
import com.gjsyoung.eiaproject.service.ProjectOperationRecordService;
import com.gjsyoung.eiaproject.service.UserService;
import com.gjsyoung.eiaproject.service.assist.AreasService;
import com.gjsyoung.eiaproject.utils.UploadUtil;
import com.gjsyoung.eiaproject.vo.BaseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import static com.gjsyoung.eiaproject.controller.adminIframeController.MATTER;

/**
 * @Classname adminMatterController
 * @Description 待办事项controller
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

    @Autowired
    ProjectReconnaissanceMapper projectReconnaissanceMapper;

    @Autowired
    UploadUtil uploadUtil;

    @Autowired
    ProjectRiskAnalysisMapper projectReconnaissance;

    /* 1、人员分配 */

    /**
     * 进入单个人员分配页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/allotmentPersonnel")
    public ModelAndView allotmentPersonnel(String projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "allotmentPersonnel");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(Integer.valueOf(projectInfoId)); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
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
        if(projectInfo.getStatus() != 1)
            throw BaseException.FAILED(400,"该项目状态有误");
        projectInfo.setHostuserid(hostUserId);
        projectInfo.setOrganizinguserid(organizingUserId);
        projectInfo.setStatus(2);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,id,1);
        return "OK";
    }



    /* 2、踏勘录入 */

    /**
     * 进入单个人员踏勘录入页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/reconnaissanceInput")
    public ModelAndView reconnaissanceInput(String projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "reconnaissanceInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(Integer.valueOf(projectInfoId)); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        mav.addObject("projectInfo",projectInfo);
        return mav;
    }


    /**
     * 进行踏勘录入
     * @param projectReconnaissance
     * @param annexFile 附件文件
     * @param session
     * @param filePic1  五张图片
     * @param filePic2
     * @param filePic3
     * @param filePic4
     * @param filePic5
     * @return
     */
    @RequestMapping("/reconnaissance")
    @ResponseBody
    public String reconnaissance(ProjectReconnaissance projectReconnaissance, MultipartFile annexFile, HttpSession session,
                                 MultipartFile filePic1, MultipartFile filePic2,  MultipartFile filePic3,  MultipartFile filePic4,  MultipartFile filePic5) throws IOException, BaseException {


        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectReconnaissance.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 2)
            throw BaseException.FAILED(400,"该项目状态有误");

        //插入踏勘表
        projectReconnaissance.setFilepic1(uploadUtil.uploadPic(filePic1,"reconnaissance/"));
        projectReconnaissance.setFilepic2(uploadUtil.uploadPic(filePic2,"reconnaissance/"));
        projectReconnaissance.setFilepic3(uploadUtil.uploadPic(filePic3,"reconnaissance/"));
        projectReconnaissance.setFilepic4(uploadUtil.uploadPic(filePic4,"reconnaissance/"));
        projectReconnaissance.setFilepic5(uploadUtil.uploadPic(filePic5,"reconnaissance/"));
        projectReconnaissance.setAnnex(uploadUtil.upload(annexFile,"reconnaissance/"));

        User fromSession = userService.getFromSession(session);
        projectReconnaissance.setReconnaissanceuserid(fromSession.getId());
        projectReconnaissanceMapper.insert(projectReconnaissance);

        //更新主表状态
        projectInfo.setStatus(3);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);
        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),2);
        return "OK";
    }

    /* 3、风险分析录入 */
    /**
     * 进入单个人员踏勘录入页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/riskAnalysisInput")
    public ModelAndView riskAnalysisInput(String projectInfoId) throws BaseException {
        if(projectInfoId == null)
            return new ModelAndView("redirect:/api/admin/iframe/riskAnalysisList");


        ModelAndView mav = new ModelAndView(MATTER + "riskAnalysisInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(Integer.valueOf(projectInfoId)); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        mav.addObject("projectInfo",projectInfo);
        return mav;
    }


    @RequestMapping("/riskAnalysis")
    @ResponseBody
    public String reconnaissance(ProjectRiskAnalysis projectRiskAnalysis, HttpSession session) throws BaseException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectRiskAnalysis.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 3)
            throw BaseException.FAILED(400,"该项目状态有误");

        User fromSession = userService.getFromSession(session);
        projectRiskAnalysis.setRiskanalysisuserid(fromSession.getId());
        //插入风险表
        projectReconnaissance.insert(projectRiskAnalysis);

        //更新主表状态
        projectInfo.setStatus(4);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);
        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),3);

        try {
            Thread.sleep(100);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return "OK";
    }


}
