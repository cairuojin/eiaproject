package com.gjsyoung.eiaproject.controller;

import com.gjsyoung.eiaproject.domain.*;
import com.gjsyoung.eiaproject.mapper.*;
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
    ProjectRiskAnalysisMapper projectRiskAnalysisMapper;

    @Autowired
    ProjectDepartmentUndertakeMapper projectDepartmentUndertakeMapper;

    @Autowired
    ProjectGeneralUndertakeMapper projectGeneralUndertakeMapper;

    @Autowired
    ProjectManagerUndertakeMapper projectManagerUndertakeMapper;

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
                                 MultipartFile filePic1, MultipartFile filePic2, MultipartFile filePic3, MultipartFile filePic4, MultipartFile filePic5) throws IOException, BaseException {


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
        projectReconnaissance.setFilepicname1(filePic1.getOriginalFilename());
        projectReconnaissance.setFilepicname2(filePic2.getOriginalFilename());
        projectReconnaissance.setFilepicname3(filePic3.getOriginalFilename());
        projectReconnaissance.setFilepicname4(filePic4.getOriginalFilename());
        projectReconnaissance.setFilepicname5(filePic5.getOriginalFilename());
        projectReconnaissance.setAnnex(uploadUtil.upload(annexFile,"reconnaissance/"));

        User fromSession = userService.getFromSession(session);
        projectReconnaissance.setReconnaissanceuserid(fromSession.getId());
        projectReconnaissance.setCreatetime(new Date());
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
     * 进入单个人员风险分析录入页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/riskAnalysisInput")
    public ModelAndView riskAnalysisInput(String projectInfoId) throws BaseException {
        if(projectInfoId == null)
            return new ModelAndView("redirect:/api/admin/iframe/riskAnalysisList");
        ProjectRiskAnalysis projectRiskAnalysis = projectRiskAnalysisMapper.selectByPrimaryKey(Integer.valueOf(projectInfoId));
        if(projectRiskAnalysis != null)
            throw BaseException.FAILED(400,"该项目已经录入风险分析");

        ModelAndView mav = new ModelAndView(MATTER + "riskAnalysisInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(Integer.valueOf(projectInfoId)); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        mav.addObject("projectInfo",projectInfo);
        return mav;
    }

    /**
     * 录入风险分析信息
     * @param projectRiskAnalysis
     * @param session
     * @return
     * @throws BaseException
     */
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
        projectRiskAnalysis.setCreatetime(new Date());
        //插入风险表
        projectRiskAnalysisMapper.insert(projectRiskAnalysis);

        //更新主表状态
        projectInfo.setStatus(4);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);
        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),3);

        return "OK";
    }


    /* 4、部门承接录入 */
    /**
     * 进入单个部门承接分析录入页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/departmentUndertakeInput")
    public ModelAndView departmentUndertakeInput(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "departmentUndertakeInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");

        ProjectRiskAnalysis projectRiskAnalysis = projectRiskAnalysisMapper.selectByPrimaryKey(projectInfoId);
        ProjectReconnaissance projectReconnaissance = projectReconnaissanceMapper.selectByPrimaryKey(projectInfoId);
        mav.addObject("projectInfo",projectInfo);
        mav.addObject("projectRiskAnalysis",projectRiskAnalysis);       //查询该项目的风险录入和踏勘信息
        mav.addObject("projectReconnaissance",projectReconnaissance);
        return mav;
    }

    /**
     * 部门承接信息录入
     * @param projectDepartmentUndertake
     * @param session
     * @return
     * @throws BaseException
     */
    @RequestMapping("/departmentUndertake")
    @ResponseBody
    public String departmentUndertake(ProjectDepartmentUndertake projectDepartmentUndertake, HttpSession session) throws BaseException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectDepartmentUndertake.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 4)
            throw BaseException.FAILED(400,"该项目状态有误");

        if(projectDepartmentUndertake.getUndertakingsituation() == 2){  //不承接 删除风险和踏勘并返回状态2
            projectInfo.setStatus(2);
            projectInfo.setName(projectInfo.getName() + "(退回)");
            projectReconnaissanceMapper.deleteByPrimaryKey(projectDepartmentUndertake.getId());
            projectRiskAnalysisMapper.deleteByPrimaryKey(projectDepartmentUndertake.getId());
        } else if (projectDepartmentUndertake.getUndertakingsituation() == 1){  //承接
            projectInfo.setStatus(7);   //进入合同信息 todo 设置承接时间
            //插入部门承接表
            User fromSession = userService.getFromSession(session);
            projectDepartmentUndertake.setUndertakinguserid(fromSession.getId());
            projectDepartmentUndertake.setCreatetime(new Date());
            projectDepartmentUndertakeMapper.insert(projectDepartmentUndertake);
        } else if (projectDepartmentUndertake.getUndertakingsituation() == 3){  //上报
            projectInfo.setStatus(5);   //总工办承接
            //插入部门承接表
            User fromSession = userService.getFromSession(session);
            projectDepartmentUndertake.setUndertakinguserid(fromSession.getId());
            projectDepartmentUndertake.setCreatetime(new Date());
            projectDepartmentUndertakeMapper.insert(projectDepartmentUndertake);
        }


        //更新主表状态
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);
        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),4);
        return "OK";
    }


    /* 5、总工办承接录入 */
    /**
     * 进入单个人员风险分析录入页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/generalUndertakeInput")
    public ModelAndView generalUndertakeInput(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "generalUndertakeInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");

        ProjectRiskAnalysis projectRiskAnalysis = projectRiskAnalysisMapper.selectByPrimaryKey(projectInfoId);
        ProjectReconnaissance projectReconnaissance = projectReconnaissanceMapper.selectByPrimaryKey(projectInfoId);
        ProjectDepartmentUndertake projectDepartmentUndertake = projectDepartmentUndertakeMapper.selectByPrimaryKey(projectInfoId);
        mav.addObject("projectInfo",projectInfo);
        mav.addObject("projectRiskAnalysis",projectRiskAnalysis);       //风险录入
        mav.addObject("projectReconnaissance",projectReconnaissance);   //踏勘信息
        mav.addObject("projectDepartmentUndertake",projectDepartmentUndertake);     //部门承接
        return mav;
    }

    /**
     * 总工办信息录入
     * @param projectGeneralUndertake
     * @param session
     * @return
     * @throws BaseException
     */
    @RequestMapping("/generalUndertake")
    @ResponseBody
    public String generalUndertake(ProjectGeneralUndertake projectGeneralUndertake, HttpSession session) throws BaseException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectGeneralUndertake.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 5)
            throw BaseException.FAILED(400,"该项目状态有误");

        if(projectGeneralUndertake.getUndertakingsituation() == 2){  //不承接 删除风险和踏勘并返回状态2
            projectInfo.setStatus(2);
            projectInfo.setName(projectInfo.getName() + "(退回)");
            projectReconnaissanceMapper.deleteByPrimaryKey(projectGeneralUndertake.getId());
            projectRiskAnalysisMapper.deleteByPrimaryKey(projectGeneralUndertake.getId());
            projectDepartmentUndertakeMapper.deleteByPrimaryKey(projectGeneralUndertake.getId());   //删除部门承接
        } else if (projectGeneralUndertake.getUndertakingsituation() == 1){  //承接
            projectInfo.setStatus(7);   //进入合同信息 todo 设置承接时间
            //插入总工办承接表
            User fromSession = userService.getFromSession(session);
            projectGeneralUndertake.setUndertakinguserid(fromSession.getId());
            projectGeneralUndertake.setCreatetime(new Date());
            projectGeneralUndertakeMapper.insert(projectGeneralUndertake);
        } else if (projectGeneralUndertake.getUndertakingsituation() == 3){  //上报
            projectInfo.setStatus(6);   //总经理承接
            //插入部门承接表
            User fromSession = userService.getFromSession(session);
            projectGeneralUndertake.setUndertakinguserid(fromSession.getId());
            projectGeneralUndertake.setCreatetime(new Date());
            projectGeneralUndertakeMapper.insert(projectGeneralUndertake);
        }


        //更新主表状态
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);
        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),5);
        return "OK";
    }


    /* 6、总经理承接录入 */
    /**
     * 进入单个人员风险分析录入页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/managerUndertakeInput")
    public ModelAndView managerUndertakeInput(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "managerUndertakeInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");

        ProjectRiskAnalysis projectRiskAnalysis = projectRiskAnalysisMapper.selectByPrimaryKey(projectInfoId);
        ProjectReconnaissance projectReconnaissance = projectReconnaissanceMapper.selectByPrimaryKey(projectInfoId);
        ProjectDepartmentUndertake projectDepartmentUndertake = projectDepartmentUndertakeMapper.selectByPrimaryKey(projectInfoId);
        ProjectGeneralUndertake projectGeneralUndertake = projectGeneralUndertakeMapper.selectByPrimaryKey(projectInfoId);
        mav.addObject("projectInfo",projectInfo);
        mav.addObject("projectRiskAnalysis",projectRiskAnalysis);       //风险录入
        mav.addObject("projectReconnaissance",projectReconnaissance);   //踏勘信息
        mav.addObject("projectDepartmentUndertake",projectDepartmentUndertake);     //部门承接
        mav.addObject("projectGeneralUndertake",projectGeneralUndertake);     //总工办承接
        return mav;
    }


    /**
     * 总经理信息录入
     * @param projectManagerUndertake
     * @param session
     * @return
     * @throws BaseException
     */
    @RequestMapping("/managerUndertake")
    @ResponseBody
    public String managerUndertake(ProjectManagerUndertake projectManagerUndertake, HttpSession session) throws BaseException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectManagerUndertake.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 6)
            throw BaseException.FAILED(400,"该项目状态有误");

        if(projectManagerUndertake.getUndertakingsituation() == 2){  //不承接 删除风险和踏勘并返回状态2
            projectInfo.setStatus(2);
            projectInfo.setName(projectInfo.getName() + "(退回)");
            projectReconnaissanceMapper.deleteByPrimaryKey(projectManagerUndertake.getId());
            projectRiskAnalysisMapper.deleteByPrimaryKey(projectManagerUndertake.getId());
            projectDepartmentUndertakeMapper.deleteByPrimaryKey(projectManagerUndertake.getId());   //删除部门承接和总工办承接
            projectGeneralUndertakeMapper.deleteByPrimaryKey(projectManagerUndertake.getId());
        } else if (projectManagerUndertake.getUndertakingsituation() == 1){  //承接
            projectInfo.setStatus(7);   //进入合同信息 todo 设置承接时间
            //插入总经理承接表
            User fromSession = userService.getFromSession(session);
            projectManagerUndertake.setUndertakinguserid(fromSession.getId());
            projectManagerUndertake.setCreatetime(new Date());
            projectManagerUndertakeMapper.insert(projectManagerUndertake);
        }

        //更新主表状态
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);
        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),6);
        return "OK";
    }
}
