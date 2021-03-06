package com.gjsyoung.eiaproject.controller;

import com.alibaba.fastjson.JSON;
import com.gjsyoung.eiaproject.domain.*;
import com.gjsyoung.eiaproject.domain.assist.ProjectInfoFileTypeDocument;
import com.gjsyoung.eiaproject.mapper.*;
import com.gjsyoung.eiaproject.service.ProjectInfoService;
import com.gjsyoung.eiaproject.service.ProjectOperationRecordService;
import com.gjsyoung.eiaproject.service.RoleService;
import com.gjsyoung.eiaproject.service.UserService;
import com.gjsyoung.eiaproject.service.assist.AreasService;
import com.gjsyoung.eiaproject.service.assist.ProjectInfoAssistService;
import com.gjsyoung.eiaproject.utils.UploadUtil;
import com.gjsyoung.eiaproject.vo.BaseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
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

    @Autowired
    ContractMessageMapper contractMessageMapper;

    @Autowired
    ContractLeaderMapper contractLeaderMapper;

    @Autowired
    RoleService roleService;

    @Autowired
    ContractFinanceMapper contractFinanceMapper;

    @Autowired
    CollectionPlanMapper collectionPlanMapper;

    @Autowired
    CollectionRecordMapper collectionRecordMapper;

    @Autowired
    ProjectWorkPlanMapper projectWorkPlanMapper;

    @Autowired
    ProjectMonitoringProgrammeMapper projectMonitoringProgrammeMapper;

    @Autowired
    ProjectInitialReportMapper projectInitialReportMapper;

    @Autowired
    FirstTrialReportMapper firstTrialReportMapper;

    @Autowired
    FirstTrialOpinionMapper firstTrialOpinionMapper;

    @Autowired
    FinalTrialOpinionMapper finalTrialOpinionMapper;

    @Autowired
    FinalTrialReportMapper finalTrialReportMapper;

    @Autowired
    ApprovalTrialQualificationsMapper approvalTrialQualificationsMapper;

    @Autowired
    ApprovalAnnexOpinionMapper approvalAnnexOpinionMapper;

    @Autowired
    ApprovalAgreelQualificationsMapper approvalAgreelQualificationsMapper;

    @Autowired
    ApprovalReplyMapper approvalReplyMapper;

    @Autowired
    ProjectInfoAssistService projectInfoAssistService;

    @Autowired
    DocumentApplicationMapper documentApplicationMapper;

    @Autowired
    DocumentRepertoireMapper documentRepertoireMapper;

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
        if(projectInfo.getName().contains("(退回)")){
            projectInfo.setName(projectInfo.getName().replace("(退回)","" ));
        }
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
            projectInfo.setStatus(7);   //进入合同信息
            projectInfo.setUndertaketime(new Date());   //承接时间
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
     * 进入单个总工办承接录入页面
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
            projectInfo.setStatus(7);   //进入合同信息
            projectInfo.setUndertaketime(new Date());   //承接时间
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
     * 进入单个总经理承接录入页面
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
            projectInfo.setStatus(7);   //进入合同信息
            projectInfo.setUndertaketime(new Date());   //承接时间
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



    /* 7、合同信息录入 */
    /**
     * 进入单个人员合同信息录入页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/contractEntryInput")
    public ModelAndView contractEntryInput(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "contractEntryInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        mav.addObject("projectInfo",projectInfo);
        return mav;
    }

    /**
     * 合同信息录入
     * @param contractMessage
     * @param annexFile
     * @param session
     * @return
     * @throws BaseException
     */
    @RequestMapping("/contractEntry")
    @ResponseBody
    public String contractEntry(ContractMessage contractMessage, MultipartFile annexFile, HttpSession session) throws BaseException, IOException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(contractMessage.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 7)
            throw BaseException.FAILED(400,"该项目状态有误");

        //插入合同信息表
        User fromSession = userService.getFromSession(session);
        contractMessage.setEntryuserid(fromSession.getId());
        contractMessage.setCreatetime(new Date());
        //上传附件
        contractMessage.setContractannexurl(uploadUtil.upload(annexFile,"contract/" ));
        contractMessageMapper.insert(contractMessage);

        //更新主表状态
        if(projectInfo.getName().contains("(退回)")){
            projectInfo.setName(projectInfo.getName().replace("(退回)","" ));
        }
        projectInfo.setStatus(8);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);
        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),7);
        return "OK";
    }

    /* 8、合同领导录入 */
    /**
     * 进入单个人员合同领导录入页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/contractLeaderInput")
    public ModelAndView contractLeaderInput(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "contractLeaderInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        ContractMessage contractMessage = contractMessageMapper.selectByPrimaryKey(projectInfoId);
        mav.addObject("projectInfo",projectInfo);
        mav.addObject("contractMessage",contractMessage );
        return mav;
    }

    /**
     * 合同领导录入
     */
    @RequestMapping("/contractLeader")
    @ResponseBody
    public String contractLeader(ContractLeader contractLeader, HttpSession session) throws BaseException, IOException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(contractLeader.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 8)
            throw BaseException.FAILED(400,"该项目状态有误");

        //插入合同领导表
        User fromSession = userService.getFromSession(session);
        contractLeader.setLeaderuserid(fromSession.getId());
        contractLeader.setCreatetime(new Date());
        contractLeaderMapper.insert(contractLeader);

        //更新主表状态
        projectInfo.setStatus(9);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);
        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),8);
        return "OK";
    }

    /**
     * 合同领导退回
     * @param projectId
     * @param session
     * @return
     * @throws BaseException
     * @throws IOException
     */
    @RequestMapping("/contractLeaderBack")
    @ResponseBody
    public String contractLeaderBack(Integer projectId, HttpSession session) throws BaseException, IOException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectId);
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 8)
            throw BaseException.FAILED(400,"该项目状态有误");

        //删除合同录入信息
        contractMessageMapper.deleteByPrimaryKey(projectId);

        //退回合同录入状态
        projectInfo.setName(projectInfo.getName() + "(退回)");
        projectInfo.setStatus(7);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),8);
        return "OK";
    }

    /* 9、合同财务录入 */
    /**
     * 进入单个人员合同财务录入页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/contractFinanceInput")
    public ModelAndView contractFinanceInput(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "contractFinanceInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        ContractMessage contractMessage = contractMessageMapper.selectByPrimaryKey(projectInfoId);
        ContractLeader contractLeader = contractLeaderMapper.selectByPrimaryKey(projectInfoId);
        User leaderUser = contractLeader.getUser();
        leaderUser.setRoleName(roleService.selectByRoleID(leaderUser.getRole()).getRolename());
        mav.addObject("projectInfo",projectInfo);
        mav.addObject("contractMessage",contractMessage );
        mav.addObject("contractLeader",contractLeader );
        return mav;
    }


    /**
     * 合同财务录入
     * @param contractFinance
     * @param session
     * @return
     * @throws BaseException
     * @throws IOException
     */
    @RequestMapping("/contractFinance")
    @ResponseBody
    public String contractFinance(ContractFinance contractFinance, HttpSession session) throws BaseException, IOException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(contractFinance.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 9)
            throw BaseException.FAILED(400,"该项目状态有误");

        //插入合同财务表
        User fromSession = userService.getFromSession(session);
        contractFinance.setFinanceuserid(fromSession.getId());
        contractFinance.setCreatetime(new Date());
        contractFinanceMapper.insert(contractFinance);

        //更新主表状态
        projectInfo.setStatus(10);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);
        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),9);
        return "OK";
    }

    /**
     * 合同财务退回
     * @param projectId
     * @param session
     * @return
     * @throws BaseException
     */
    @RequestMapping("/contractFinanceBack")
    @ResponseBody
    public String contractFinanceBack(Integer projectId, HttpSession session) throws BaseException{
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectId);
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 9)
            throw BaseException.FAILED(400,"该项目状态有误");

        //删除合同录入信息  领导录入信息
        contractMessageMapper.deleteByPrimaryKey(projectId);
        contractLeaderMapper.deleteByPrimaryKey(projectId);

        //退回合同录入状态
        projectInfo.setName(projectInfo.getName() + "(退回)");
        projectInfo.setStatus(7);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),9);
        return "OK";
    }


    /* 10、合同盖章签名录入 */
    /**
     * 进入单个合同盖章签名录入页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/contractSignatureInput")
    public ModelAndView contractSignatureInput(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "contractSignatureInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        ContractMessage contractMessage = contractMessageMapper.selectByPrimaryKey(projectInfoId);
        ContractLeader contractLeader = contractLeaderMapper.selectByPrimaryKey(projectInfoId);
        ContractFinance contractFinance = contractFinanceMapper.selectByPrimaryKey(projectInfoId);
        User leaderUser = contractLeader.getUser();
        User financeUser = contractFinance.getUser();
        leaderUser.setRoleName(roleService.selectByRoleID(leaderUser.getRole()).getRolename());
        financeUser.setRoleName(roleService.selectByRoleID(financeUser.getRole()).getRolename());
        mav.addObject("projectInfo",projectInfo);
        mav.addObject("contractMessage",contractMessage );
        mav.addObject("contractLeader",contractLeader );
        mav.addObject("contractFinance",contractFinance );
        return mav;
    }

    /**
     * 合同盖章签名
     * @param projectInfoId
     * @param session
     * @return
     * @throws BaseException
     */
    @RequestMapping("/contractSignature")
    @ResponseBody
    public String contractSignature(Integer projectInfoId, HttpSession session) throws BaseException{
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId);
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 10)
            throw BaseException.FAILED(400,"该项目状态有误");

        //更新主表状态
        projectInfo.setStatus(11);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);
        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),10);
        return "OK";
    }


    /* 11、收款计划录入 */
    /**
     * 进入单个收款录入页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/collectionPlanInput")
    public ModelAndView collectionPlanInput(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "collectionPlanInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        ContractMessage contractMessage = contractMessageMapper.selectByPrimaryKey(projectInfoId);
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        mav.addObject("projectInfo",projectInfo);
        mav.addObject("contractMessage",contractMessage);
        return mav;
    }

    /**
     * 收款录入签名
     * @param collectionPlan
     * @param session
     * @return
     * @throws BaseException
     */
    @RequestMapping("/collectionPlan")
    @ResponseBody
    public String collectionPlan(CollectionPlan collectionPlan, HttpSession session) throws BaseException{
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(collectionPlan.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 11)
            throw BaseException.FAILED(400,"该项目状态有误");

        //插入收款计划表
        User fromSession = userService.getFromSession(session);
        collectionPlan.setCollectionuserid(fromSession.getId());
        collectionPlan.setCollectionmoney(collectionPlan.getCollectionmoney() * 10000); // 乘1W
        collectionPlan.setCollectionbepaidmoney(collectionPlan.getCollectionmoney());   //待收金额=收款金额
        collectionPlan.setCreatetime(new Date());
        collectionPlanMapper.insert(collectionPlan);

        //更新主表状态
        projectInfo.setStatus(12);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),11);
        return "OK";
    }


    /* 12、收款记录录入 */
    /**
     * 进入单个收款记录录入页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/collectionManageInput")
    public ModelAndView collectionManageInput(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "collectionManageInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        CollectionPlan collectionPlan = collectionPlanMapper.selectByPrimaryKey(projectInfoId); //收款计划
        List<CollectionRecord> collectionRecords = collectionRecordMapper.selectByProjectId(projectInfoId); //收款记录
        for (CollectionRecord collectionRecord : collectionRecords){
            User user = collectionRecord.getUser();
            user.setRoleName(roleService.selectByRoleID(user.getRole()).getRolename());
        }
        mav.addObject("projectInfo",projectInfo);
        mav.addObject("collectionPlan",collectionPlan);
        mav.addObject("collectionRecords",collectionRecords);
        return mav;
    }


    /**
     * 收款记录录入
     * @param collectionRecord
     * @param session
     * @return
     * @throws BaseException
     */
    @RequestMapping("/collectionManage")
    @ResponseBody
    public String collectionManage(CollectionRecord collectionRecord, HttpSession session) throws BaseException{
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(collectionRecord.getProjectid());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 12)
            throw BaseException.FAILED(400,"该项目状态有误");

        CollectionPlan collectionPlan = collectionPlanMapper.selectByPrimaryKey(collectionRecord.getProjectid());
        if(collectionPlan.getCollectionbepaidmoney() < collectionRecord.getCollectionmoney())
            throw BaseException.FAILED(400,"收款金额不能大于待收款金额");

        //插入收款记录表
        User fromSession = userService.getFromSession(session);
        collectionRecord.setRecorduserid(fromSession.getId());
        collectionRecord.setCreatetime(new Date());
        collectionRecordMapper.insert(collectionRecord);

        //更新收款记录
        //待收款金额 = 原来待收款金额 - 本次收款金额
        BigDecimal subtract = new BigDecimal("" + collectionPlan.getCollectionbepaidmoney()).subtract(new BigDecimal("" + collectionRecord.getCollectionmoney()));
        collectionPlan.setCollectionbepaidmoney(subtract.doubleValue());
        collectionPlanMapper.updateByPrimaryKey(collectionPlan);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),12);

        //更新主表状态
        if(collectionPlan.getCollectionbepaidmoney().doubleValue() == 0.0){  //收款完毕
            projectInfo.setStatus(13);
            projectInfo.setUpdatetime(new Date());
            projectInfoMapper.updateByPrimaryKeySelective(projectInfo);
            return "Collectionover";
        } else {
            projectInfo.setUpdatetime(new Date());
            projectInfoMapper.updateByPrimaryKeySelective(projectInfo);
            return "OK";
        }
    }

    /* 13、制定工作计划 */
    /**
     * 进入单个制定工作计划页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/workPlanMakeInput")
    public ModelAndView workPlanMakeInput(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "workPlanMakeInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        mav.addObject("projectInfo",projectInfo);
        return mav;
    }

    /**
     * 制定工作计划
     */
    @RequestMapping("/workPlanMake")
    @ResponseBody
    public String workPlanMake(@RequestBody ProjectWorkPlan[] projectWorkPlans, HttpSession session) throws BaseException{
        if(projectWorkPlans.length == 0){
            return "null";
        }
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectWorkPlans[0].getProjectid());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 13)
            throw BaseException.FAILED(400,"该项目状态有误");

        User fromSession = userService.getFromSession(session);
        for(ProjectWorkPlan projectWorkPlan : projectWorkPlans){
            projectWorkPlan.setStatus(0);   //未执行
            projectWorkPlan.setMakeplanuserid(fromSession.getId());
            projectWorkPlan.setCreatetime(new Date());
            projectWorkPlanMapper.insert(projectWorkPlan);
        }

        //更新主表状态
        projectInfo.setStatus(14);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),13);
        return "OK";
    }

    /* 14、落实工作 */
    @RequestMapping("/workPlanImplement")
    @ResponseBody
    public String workPlanImplement(Integer id, Date implementsplantime, String implementsremarks, HttpSession session) throws BaseException{
        ProjectWorkPlan projectWorkPlan = projectWorkPlanMapper.selectByPrimaryKey(id);
        if(projectWorkPlan == null){
            throw BaseException.FAILED(404,"找不到该工作计划");
        } else if(projectWorkPlan.getStatus() == 1){
            throw BaseException.FAILED(400,"该工作计划已经完成");
        }


        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectWorkPlan.getProjectid());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 14)
            throw BaseException.FAILED(400,"该项目状态有误");

        User fromSession = userService.getFromSession(session);
        projectWorkPlan.setImplementsplantime(implementsplantime);
        projectWorkPlan.setImplementsremarks(implementsremarks);
        projectWorkPlan.setUpdatetime(new Date());  //当前为落实时间
        projectWorkPlan.setImplementsplanuserid(fromSession.getId());
        projectWorkPlan.setStatus(1);
        projectWorkPlanMapper.updateByPrimaryKey(projectWorkPlan);


        //更新主表状态
        int workBeImplementCount = projectWorkPlanMapper.countBeImplementByProjectid(projectWorkPlan.getProjectid());
        if(workBeImplementCount == 0){  //全部完成进入下一状态
            projectInfo.setStatus(15);
        }
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),14);
        return "OK";
    }

    /* 15、监测方案提交 */
    /**
     * 进入监测方案录入页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/monitoringProgrammeInput")
    public ModelAndView monitoringProgrammeInput(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "monitoringProgrammeInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        mav.addObject("projectInfo",projectInfo);
        return mav;
    }


    @RequestMapping("/monitoringProgramme")
    @ResponseBody
    public String monitoringProgramme(ProjectMonitoringProgramme projectMonitoringProgramme, MultipartFile annexFile, HttpSession session) throws BaseException, IOException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectMonitoringProgramme.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 15)
            throw BaseException.FAILED(400,"该项目状态有误");

        projectMonitoringProgramme.setAnnux(uploadUtil.upload(annexFile,"contract/" ));
        User fromSession = userService.getFromSession(session);
        projectMonitoringProgramme.setMonitoringuserid(fromSession.getId());
        projectMonitoringProgramme.setCreatetime(new Date());
        projectMonitoringProgrammeMapper.insert(projectMonitoringProgramme);


        //更新主表状态
        projectInfo.setStatus(16);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),15);
        return "OK";
    }

    //16、提交初版报告
    @RequestMapping("/initialReport")
    @ResponseBody
    public String initialReport(ProjectInitialReport projectInitialReport, MultipartFile firstTrialFile, HttpSession session) throws BaseException, IOException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInitialReport.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 16)
            throw BaseException.FAILED(400,"该项目状态有误");

        projectInitialReport.setFirsttrialreportannex(uploadUtil.upload(firstTrialFile,"initialReport/" ));
        User fromSession = userService.getFromSession(session);
        projectInitialReport.setInitialreportuserid(fromSession.getId());
        projectInitialReport.setCreatetime(new Date());
        projectInitialReportMapper.insert(projectInitialReport);


        //更新主表状态
        projectInfo.setFirsttrialuserid(projectInitialReport.getFirsttrialuserid());   //更新初审人到主表中
        projectInfo.setStatus(17);
        projectInfo.setUpdatetime(new Date());
        projectInfo.setInitialreportuserid(fromSession.getId());    //项目报告提交人  初审/复审第二个环节查
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),16);
        return "OK";
    }


    /* 17、初审 */
    /**
     * 进入初审录入页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/firstTrialInput")
    public ModelAndView firstTrialInput(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "firstTrialInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        ProjectInitialReport projectInitialReport = projectInitialReportMapper.selectByPrimaryKey(projectInfoId);
        if(projectInitialReport == null)
            throw BaseException.FAILED(404,"找不到该初版报告");
        mav.addObject("projectInfo",projectInfo);
        mav.addObject("projectInitialReport",projectInitialReport);
        return mav;
    }


    /**
     * 提交初审意见
     * @param opinionJson    初审意见数组
     * @param firstOpinionAnnex 初审意见附件
     * @param firstAnnotationreport 初审批注版报告
     * @param session
     * @return
     * @throws BaseException
     * @throws IOException
     */
    @RequestMapping("/firstTrial")
    @ResponseBody
    public String firstTrial(String opinionJson, MultipartFile firstOpinionAnnex, MultipartFile firstAnnotationreport, HttpSession session) throws BaseException, IOException {

        FirstTrialOpinion[] firstTrialOpinions = JSON.parseObject(opinionJson, FirstTrialOpinion[].class);
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(firstTrialOpinions[0].getProjectid());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 17)
            throw BaseException.FAILED(400,"该项目状态有误");

        //插入初审报告表
        FirstTrialReport firstTrialReport = new FirstTrialReport();
        firstTrialReport.setId(firstTrialOpinions[0].getProjectid());   //项目id
        firstTrialReport.setCreatetime(new Date());
        firstTrialReport.setFirstopinionannex(uploadUtil.upload(firstOpinionAnnex,"firstOpinionAnnex/" ));
        firstTrialReport.setFirstannotationreport(uploadUtil.upload(firstAnnotationreport,"firstAnnotationreport/" ));
        firstTrialReportMapper.insert(firstTrialReport);

        //插入初审意见表
        for(FirstTrialOpinion firstTrialOpinion : firstTrialOpinions){
            firstTrialOpinion.setCreatetime(new Date());
            firstTrialOpinionMapper.insert(firstTrialOpinion);
        }

        //更新主表状态
        if(projectInfo.getName().contains("(退回)")){
            projectInfo.setName(projectInfo.getName().replace("(退回)","" ));
        }
        projectInfo.setStatus(18);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),17);
        return "OK";
    }

    /**
     * 退回初审
     * @param projectId
     * @param session
     * @return
     * @throws BaseException
     */
    @RequestMapping("/firstTrialBack")
    @ResponseBody
    public String firstTrialBack(Integer projectId, HttpSession session) throws BaseException{
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectId);
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 17)
            throw BaseException.FAILED(400,"该项目状态有误");

        //删除初版项目报告
        projectInitialReportMapper.deleteByPrimaryKey(projectId);

        //退回合同录入状态
        projectInfo.setName(projectInfo.getName() + "(退回)");
        projectInfo.setStatus(16);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),17);
        return "OK";
    }

    /* 18、初审修改情况 */
    /**
     * 进入监测方案录入页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/firstTrialEditInput")
    public ModelAndView firstTrialEditInput(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "firstTrialEditInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");

        FirstTrialReport firstTrialReport = firstTrialReportMapper.selectByPrimaryKey(projectInfoId);
        if(firstTrialReport == null)
            throw BaseException.FAILED(404,"找不到该初审报告");
        List<FirstTrialOpinion> firstTrialOpinions = firstTrialOpinionMapper.selectByProjectId(projectInfoId);
        List<User> userList = userService.getUserListByDepartmentAndRole(projectInfo.getSubordinatedepartmentid().toString(), new Integer[]{2, 3});


        mav.addObject("projectInfo",projectInfo);
        mav.addObject("firstTrialReport",firstTrialReport);
        mav.addObject("firstTrialOpinions",firstTrialOpinions);
        mav.addObject("userList",userList);
        return mav;
    }


    /**
     * 提交初审修改情况
     * @param opinionJson    初审意见数组
     * @param finaltrialuserid 定稿复审人
     * @param finalopinionannex 定稿审核报告
     * @param session
     * @return
     * @throws BaseException
     * @throws IOException
     */
    @RequestMapping("/firstTrialEdit")
    @ResponseBody
    public String firstTrialEdit(String opinionJson,Integer projectId, Integer finaltrialuserid, MultipartFile finalopinionannex, HttpSession session) throws BaseException, IOException {

        FirstTrialOpinion[] firstTrialOpinions = JSON.parseObject(opinionJson, FirstTrialOpinion[].class);
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectId);
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 18)
            throw BaseException.FAILED(400,"该项目状态有误");

        //插入初审报告表
        FirstTrialReport firstTrialReport = firstTrialReportMapper.selectByPrimaryKey(projectId);
        if(firstTrialReport == null)
            throw BaseException.FAILED(500,"找不到该初审报告表");
        firstTrialReport.setFinalopinionannex(uploadUtil.upload(finalopinionannex,"finalopinionreport/" ));
        firstTrialReport.setFinaltrialuserid(finaltrialuserid);
        firstTrialReportMapper.updateByPrimaryKeySelective(firstTrialReport);

        //插入初审意见表
        for(FirstTrialOpinion firstTrialOpinion : firstTrialOpinions){
            firstTrialOpinion.setUpdatetime(new Date());
            firstTrialOpinionMapper.updateByPrimaryKeySelective(firstTrialOpinion);
        }


        projectInfo.setStatus(19);
        projectInfo.setUpdatetime(new Date());
        projectInfo.setFinaltrialuserid(finaltrialuserid);//插入复审人
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),18);
        return "OK";
    }


    /* 19、初审落实 */
    /**
     * 进入初审落实页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/firstTrialImplementInput")
    public ModelAndView firstTrialImplementInput(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "firstTrialImplementInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");

        ProjectInitialReport projectInitialReport = projectInitialReportMapper.selectByPrimaryKey(projectInfoId);  //初版报告
        FirstTrialReport firstTrialReport = firstTrialReportMapper.selectByPrimaryKey(projectInfoId);   //初审报告
        List<FirstTrialOpinion> firstTrialOpinions = firstTrialOpinionMapper.selectByProjectId(projectInfoId);//初审意见
        if (projectInitialReport == null || firstTrialReport == null || firstTrialOpinions == null){

            throw BaseException.FAILED(500,"该项目有误");
        }

        if(projectInitialReport == null)
            throw BaseException.FAILED(404,"找不到该初版报告");
        mav.addObject("projectInfo",projectInfo);
        mav.addObject("projectInitialReport",projectInitialReport);
        mav.addObject("firstTrialReport",firstTrialReport);
        mav.addObject("firstTrialOpinions",firstTrialOpinions);
        return mav;
    }


    /**
     * 提交初审修改情况
     */
    @RequestMapping("/firstTrialImplement")
    @ResponseBody
    public String firstTrialImplement(FirstTrialReport firstTrialReport, HttpSession session) throws BaseException, IOException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(firstTrialReport.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 19)
            throw BaseException.FAILED(400,"该项目状态有误");

        firstTrialReportMapper.updateByPrimaryKeySelective(firstTrialReport);

        projectInfo.setStatus(20);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),19);
        return "OK";
    }


    /* 20、复审 */
    /**
     * 进入复审录入页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/finalTrialInput")
    public ModelAndView finalTrialInput(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "finalTrialInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        FirstTrialReport firstTrialReport = firstTrialReportMapper.selectByPrimaryKey(projectInfoId);
        if(firstTrialReport == null)
            throw BaseException.FAILED(404,"找不到该定稿版报告");
        mav.addObject("projectInfo",projectInfo);
        mav.addObject("firstTrialReport",firstTrialReport);
        return mav;
    }

    /**
     * 提交复审意见
     * @param opinionJson    复审意见数组
     * @param finalOpinionAnnex 复审意见附件
     * @param finalAnnotationreport 复审批注版报告
     * @param session
     * @return
     * @throws BaseException
     * @throws IOException
     */
    @RequestMapping("/finalTrial")
    @ResponseBody
    public String finalTrial(String opinionJson, MultipartFile finalOpinionAnnex, MultipartFile finalAnnotationreport, HttpSession session) throws BaseException, IOException {

        FinalTrialOpinion[] finalTrialOpinions = JSON.parseObject(opinionJson, FinalTrialOpinion[].class);
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(finalTrialOpinions[0].getProjectid());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 20)
            throw BaseException.FAILED(400,"该项目状态有误");

        //插入复审报告表
        FinalTrialReport finalTrialReport = new FinalTrialReport();
        finalTrialReport.setId(finalTrialOpinions[0].getProjectid());   //项目id
        finalTrialReport.setCreatetime(new Date());
        finalTrialReport.setFinalopinionannex(uploadUtil.upload(finalOpinionAnnex,"finalOpinionAnnex/" ));
        finalTrialReport.setFinalannotationreport(uploadUtil.upload(finalAnnotationreport,"finalAnnotationreport/" ));
        finalTrialReportMapper.insert(finalTrialReport);

        //插入初审意见表
        for(FinalTrialOpinion finalTrialOpinion : finalTrialOpinions){
            finalTrialOpinion.setCreatetime(new Date());
            finalTrialOpinionMapper.insert(finalTrialOpinion);
        }

        //更新主表状态
        if(projectInfo.getName().contains("(退回)")){
            projectInfo.setName(projectInfo.getName().replace("(退回)","" ));
        }
        projectInfo.setStatus(21);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),20);
        return "OK";
    }

    /**
     * 退回复审
     * @param projectId
     * @param session
     * @return
     * @throws BaseException
     */
    @RequestMapping("/finalTrialBack")
    @ResponseBody
    public String finalTrialBack(Integer projectId, HttpSession session) throws BaseException{
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectId);
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 20)
            throw BaseException.FAILED(400,"该项目状态有误");

        projectInitialReportMapper.deleteByPrimaryKey(projectId);//删除初版项目报告
        firstTrialReportMapper.deleteByPrimaryKey(projectId);   //删除初审报告表
        firstTrialOpinionMapper.deleteByProjectId(projectId);   //删除初审意见

        //退回合同录入状态
        projectInfo.setName(projectInfo.getName() + "(退回)");
        projectInfo.setStatus(16);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),20);
        return "OK";
    }


    /* 21、复审修改情况 */
    /**
     * 进入复审录入页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/finalTrialEditInput")
    public ModelAndView finalTrialEditInput(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "finalTrialEditInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");

        FinalTrialReport finalTrialReport = finalTrialReportMapper.selectByPrimaryKey(projectInfoId);
        if(finalTrialReport == null)
            throw BaseException.FAILED(404,"找不到该复审报告");

        List<FinalTrialOpinion> finalTrialOpinions = finalTrialOpinionMapper.selectByProjectId(projectInfoId);

        mav.addObject("projectInfo",projectInfo);
        mav.addObject("finalTrialReport",finalTrialReport);
        mav.addObject("finalTrialOpinions",finalTrialOpinions);
        return mav;
    }


    /**
     * 提交复审修改情况
     * @param opinionJson    初审意见数组
     * @param approvalopinionannex 报审版报告
     * @param session
     * @return
     * @throws BaseException
     * @throws IOException
     */
    @RequestMapping("/finalTrialEdit")
    @ResponseBody
    public String finalTrialEdit(String opinionJson,Integer projectId, MultipartFile approvalopinionannex, HttpSession session) throws BaseException, IOException {

        FinalTrialOpinion[] finalTrialOpinions = JSON.parseObject(opinionJson, FinalTrialOpinion[].class);
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectId);
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 21)
            throw BaseException.FAILED(400,"该项目状态有误");

        //插入复审报告表
        FinalTrialReport finalTrialReport = finalTrialReportMapper.selectByPrimaryKey(projectId);
        if(finalTrialReport == null)
            throw BaseException.FAILED(500,"找不到该复审报告表");
        finalTrialReport.setApprovalopinionannex(uploadUtil.upload(approvalopinionannex,"approvalopinionannex/" ));
        finalTrialReportMapper.updateByPrimaryKeySelective(finalTrialReport);

        //插入复审意见表
        for(FinalTrialOpinion finalTrialOpinion : finalTrialOpinions){
            finalTrialOpinion.setUpdatetime(new Date());
            finalTrialOpinionMapper.updateByPrimaryKeySelective(finalTrialOpinion);
        }


        projectInfo.setStatus(22);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),21);
        return "OK";
    }


    /* 22、复审落实 */
    /**
     * 进入复审落实页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/finalTrialImplementInput")
    public ModelAndView finalTrialImplementInput(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "finalTrialImplementInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");


        FirstTrialReport firstTrialReport = firstTrialReportMapper.selectByPrimaryKey(projectInfoId);   //定稿版报告
        List<FinalTrialOpinion> finalTrialOpinions = finalTrialOpinionMapper.selectByProjectId(projectInfoId);  //复审意见
        FinalTrialReport finalTrialReport = finalTrialReportMapper.selectByPrimaryKey(projectInfoId);   //复审报告
        if (finalTrialReport == null || finalTrialOpinions == null){
            throw BaseException.FAILED(500,"该项目有误");
        }

        if(firstTrialReport == null)
            throw BaseException.FAILED(404,"找不到该初版报告");
        mav.addObject("projectInfo",projectInfo);
        mav.addObject("firstTrialReport",firstTrialReport);
        mav.addObject("finalTrialOpinions",finalTrialOpinions);
        mav.addObject("finalTrialReport",finalTrialReport);
        return mav;
    }


    /**
     * 提交初审修改情况
     */
    @RequestMapping("/finalTrialImplement")
    @ResponseBody
    public String finalTrialImplement(FinalTrialReport finalTrialReport, HttpSession session) throws BaseException, IOException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(finalTrialReport.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 22)
            throw BaseException.FAILED(400,"该项目状态有误");

        finalTrialReportMapper.updateByPrimaryKeySelective(finalTrialReport);

        projectInfo.setStatus(23);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),22);
        return "OK";
    }

    /* 23 报审资质申请 */
    /**
     * 提交报审资质申请
     */
    @RequestMapping("/approvalTrialQualifications")
    @ResponseBody
    public String approvalTrialQualifications(ApprovalTrialQualifications approvalTrialQualifications, HttpSession session) throws BaseException, IOException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(approvalTrialQualifications.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 23)
            throw BaseException.FAILED(400,"该项目状态有误");

        User fromSession = userService.getFromSession(session);
        approvalTrialQualifications.setApprovaluserid(fromSession.getId());
        approvalTrialQualifications.setCreatetime(new Date());
        approvalTrialQualificationsMapper.insert(approvalTrialQualifications);

        projectInfo.setStatus(24);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),23);
        return "OK";
    }


    /* 24 会议总结附件 */

    /**
     * 提交会议总结附件
     */
    @RequestMapping("/approvalMetting")
    @ResponseBody
    public String approvalMetting(ApprovalAnnexOpinion approvalAnnexOpinion, MultipartFile mettingSummaryAnnex, HttpSession session) throws BaseException, IOException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(approvalAnnexOpinion.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 24)
            throw BaseException.FAILED(400,"该项目状态有误");

        User fromSession = userService.getFromSession(session);
        approvalAnnexOpinion.setMettingsummaryannex(uploadUtil.upload(mettingSummaryAnnex,"mettingSummaryAnnex/"));
        approvalAnnexOpinion.setMettinguserid(fromSession.getId());
        approvalAnnexOpinion.setMettingtime(new Date());
        approvalAnnexOpinionMapper.insert(approvalAnnexOpinion);

        //更新主表状态
        projectInfo.setStatus(25);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),24);
        return "OK";
    }


    /* 25 下一版报告 */

    /**
     * 提交下一版报告附件
     */
    @RequestMapping("/approvalReport")
    @ResponseBody
    public String approvalReport(Integer projectId, MultipartFile approvalreportannex, MultipartFile approvalexpertopinionsannex, HttpSession session) throws BaseException, IOException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectId);
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 25)
            throw BaseException.FAILED(400,"该项目状态有误");
        ApprovalAnnexOpinion approvalAnnexOpinion = approvalAnnexOpinionMapper.selectByPrimaryKey(projectId);
        if(approvalAnnexOpinion == null)
            throw BaseException.FAILED(500,"该项目状态有误，找不到会议总结对象");

        User fromSession = userService.getFromSession(session);
        approvalAnnexOpinion.setApprovalreportannex(uploadUtil.upload(approvalreportannex,"approvalreportannex/"));
        approvalAnnexOpinion.setApprovalexpertopinionsannex(uploadUtil.upload(approvalexpertopinionsannex,"approvalexpertopinionsannex/"));
        approvalAnnexOpinion.setApprovaluserid(fromSession.getId());
        approvalAnnexOpinion.setApprovaltime(new Date());
        approvalAnnexOpinionMapper.updateByPrimaryKeySelective(approvalAnnexOpinion);

        //更新主表状态
        projectInfo.setStatus(26);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),25);
        return "OK";
    }


    /* 26 评委会意见 */

    /**
     * 提交评委会意见
     */
    @RequestMapping("/approvalOpinion")
    @ResponseBody
    public String approvalOpinion(ApprovalAnnexOpinion approvalAnnexOpinion, HttpSession session) throws BaseException, IOException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(approvalAnnexOpinion.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 26)
            throw BaseException.FAILED(400,"该项目状态有误");
        if(approvalAnnexOpinionMapper.selectByPrimaryKey(approvalAnnexOpinion.getId()) == null)
            throw BaseException.FAILED(500,"该项目状态有误，找不到会议总结对象");

        User fromSession = userService.getFromSession(session);
        approvalAnnexOpinion.setImplementuserid(fromSession.getId());
        approvalAnnexOpinion.setImplementtime(new Date());
        approvalAnnexOpinionMapper.updateByPrimaryKeySelective(approvalAnnexOpinion);

        //更新主表状态
        projectInfo.setStatus(27);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),26);
        return "OK";
    }

    /* 27 报批资质申请 */
    /**
     * 提交报批资质申请
     */
    @RequestMapping("/approvalAgreelQualifications")
    @ResponseBody
    public String approvalAgreelQualifications(ApprovalAgreelQualifications approvalAgreelQualifications, HttpSession session) throws BaseException{
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(approvalAgreelQualifications.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 27)
            throw BaseException.FAILED(400,"该项目状态有误");

        User fromSession = userService.getFromSession(session);
        approvalAgreelQualifications.setApprovaluserid(fromSession.getId());
        approvalAgreelQualifications.setCreatetime(new Date());
        approvalAgreelQualificationsMapper.insert(approvalAgreelQualifications);

        projectInfo.setStatus(28);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),27);
        return "OK";
    }

    /* 28 录入批复信息 */
    /**
     * 录入批复信息
     */
    @RequestMapping("/approvalReply")
    @ResponseBody
    public String approvalReply(ApprovalReply approvalReply,MultipartFile approvalreplyMessageAnnex, HttpSession session) throws BaseException, IOException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(approvalReply.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 28)
            throw BaseException.FAILED(400,"该项目状态有误");

        User fromSession = userService.getFromSession(session);
        approvalReply.setCreateuserid(fromSession.getId());
        approvalReply.setCreatetime(new Date());
        approvalReply.setReplymessageannex(uploadUtil.upload(approvalreplyMessageAnnex,"approvalreplyMessageAnnex/" ));
        approvalReplyMapper.insert(approvalReply);

        projectInfo.setStatus(29);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),28);
        return "OK";
    }

    /* 29 出资质 */
    /**
     * 出资质
     */
    @RequestMapping("/projectQualifications")
    @ResponseBody
    public String projectQualifications(Integer id, String qualificationserialnumber, Integer qualificationsStatus, HttpSession session) throws BaseException{
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(id);
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 29)
            throw BaseException.FAILED(400,"该项目状态有误");

        User fromSession = userService.getFromSession(session);
        ApprovalTrialQualifications approvalTrialQualifications = approvalTrialQualificationsMapper.selectByPrimaryKey(id);
        ApprovalAgreelQualifications approvalAgreelQualifications = approvalAgreelQualificationsMapper.selectByPrimaryKey(id);
        if(qualificationsStatus == 0){
            if(approvalTrialQualifications.getQualificationserialnumber() == null){
                approvalTrialQualifications.setQualificationserialnumber(qualificationserialnumber);
                approvalTrialQualifications.setQualificationserialtime(new Date());
                approvalTrialQualifications.setQualificationserialuserid(fromSession.getId());
                approvalTrialQualificationsMapper.updateByPrimaryKeySelective(approvalTrialQualifications);
            } else {
                throw BaseException.FAILED(400,"该项目状态有误");
            }
        } else {
            if(approvalAgreelQualifications.getQualificationserialnumber() == null){
                approvalAgreelQualifications.setQualificationserialnumber(qualificationserialnumber);
                approvalAgreelQualifications.setQualificationserialtime(new Date());
                approvalAgreelQualifications.setQualificationserialuserid(fromSession.getId());
                approvalAgreelQualificationsMapper.updateByPrimaryKeySelective(approvalAgreelQualifications);
            }
        }

        if(approvalTrialQualifications.getQualificationserialnumber() != null && approvalAgreelQualifications.getQualificationserialnumber() != null){
            projectInfo.setStatus(30);
            projectInfo.setUpdatetime(new Date());
            projectInfoMapper.updateByPrimaryKeySelective(projectInfo);
            //插入操作记录表
            projectOperationRecordService.addRecord(session,projectInfo.getId(),29);
        }
        return "OK";
    }


    /* 30、申请存档 */
    /**
     * 进入申请存档页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/documentApplicationInput")
    public ModelAndView documentApplicationInput(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "documentApplicationInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        List<ProjectInfoFileTypeDocument> fileTypeDocuments = projectInfoAssistService.getFileTypeDocumentsById(projectInfo.getFiletype());
        mav.addObject("fileTypeDocuments",fileTypeDocuments);
        mav.addObject("projectInfo",projectInfo );
        return mav;
    }

    /**
     * 申请存档
     * @param documentJson   存档申请对象数组
     * @param documentRepertoire 存档资讯
     * @param finalreportannexFile  最终版报告
     * @param session
     * @return
     * @throws BaseException
     * @throws IOException
     */
    @RequestMapping("/documentApplication")
    @ResponseBody
    public String documentApplication(@RequestParam("documentApplications") String documentJson ,DocumentRepertoire documentRepertoire, MultipartFile finalreportannexFile, HttpSession session) throws BaseException, IOException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(documentRepertoire.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 30)
            throw BaseException.FAILED(400,"该项目状态有误");
        //存档申请列表
        DocumentApplication[] documentApplications = JSON.parseObject(documentJson, DocumentApplication[].class);
        User fromSession = userService.getFromSession(session);
        for(DocumentApplication documentApplication : documentApplications){
            documentApplication.setCreatetime(new Date());
            documentApplication.setCreateuserid(fromSession.getId());
            documentApplicationMapper.insert(documentApplication);
        }
        //存档资讯表
        documentRepertoire.setFinalreportannex(uploadUtil.upload(finalreportannexFile,"finalreportannex/"));
        documentRepertoire.setApplicanttime(new Date());
        documentRepertoire.setApplicantuserid(fromSession.getId());
        documentRepertoireMapper.insert(documentRepertoire);

        projectInfo.setStatus(31);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);
        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),30);
        return "OK";
    }

    /* 31、申请存档 */
    /**
     * 进入申请存档页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/documentLeaderSignInput")
    public ModelAndView documentLeaderSignInput(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "documentLeaderSignInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        List<DocumentApplication> documentApplications = documentApplicationMapper.selectByProjectid(projectInfoId);
        DocumentRepertoire documentRepertoire = documentRepertoireMapper.selectByPrimaryKey(projectInfoId);
        mav.addObject("documentApplications",documentApplications);
        mav.addObject("documentRepertoire",documentRepertoire);
        mav.addObject("projectInfo",projectInfo);
        return mav;
    }

    /**
     * 领导签名
     * @param documentRepertoire
     * @param session
     * @return
     * @throws BaseException
     * @throws IOException
     */
    @RequestMapping("/documentLeaderSign")
    @ResponseBody
    public String documentLeaderSign(DocumentRepertoire documentRepertoire, HttpSession session) throws BaseException, IOException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(documentRepertoire.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 31)
            throw BaseException.FAILED(400,"该项目状态有误");
        if(documentRepertoireMapper.selectByPrimaryKey(documentRepertoire.getId()) == null)
            throw BaseException.FAILED(404,"找不到该存档资讯表");

        User fromSession = userService.getFromSession(session);
        documentRepertoire.setLeaderuserid(fromSession.getId());
        documentRepertoire.setLeadertime(new Date());
        documentRepertoireMapper.updateByPrimaryKeySelective(documentRepertoire);

        //更新项目状态
        if(projectInfo.getName().contains("(退回)")){
            projectInfo.setName(projectInfo.getName().replace("(退回)","" ));
        }
        projectInfo.setStatus(32);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);
        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),31);
        return "OK";
    }

    /**
     * 领导退回
     * @param projectId
     * @param session
     * @return
     * @throws BaseException
     */
    @RequestMapping("/documentLeaderSignBack")
    @ResponseBody
    public String documentLeaderSignBack(Integer projectId, HttpSession session) throws BaseException{
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectId);
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 31)
            throw BaseException.FAILED(400,"该项目状态有误");

        //删除存档申请列表和存档资讯表
        documentApplicationMapper.deleteByProjectid(projectId);
        documentRepertoireMapper.deleteByPrimaryKey(projectId);

        //退回申请存档
        projectInfo.setName(projectInfo.getName() + "(退回)");
        projectInfo.setStatus(30);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),31);
        return "OK";
    }



    /* 32、存档 */
    /**
     * 进入存档页面
     * @param projectInfoId
     * @return
     */
    @RequestMapping("/documentEnterInput")
    public ModelAndView documentEnterInput(Integer projectInfoId) throws BaseException {
        ModelAndView mav = new ModelAndView(MATTER + "documentEnterInput");
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectInfoId); //搜索该项目
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        List<DocumentApplication> documentApplications = documentApplicationMapper.selectByProjectid(projectInfoId);
        DocumentRepertoire documentRepertoire = documentRepertoireMapper.selectByPrimaryKey(projectInfoId);

        //退回历史
        List<ProjectOperationRecord> recordByProjectId = projectOperationRecordService.getRecordByProjectId(projectInfoId);
        List<ProjectOperationRecord> backRecords = new ArrayList<>();
        for(ProjectOperationRecord projectOperationRecord : recordByProjectId){
            if(projectOperationRecord.getProjectinfostatus() == 31 || projectOperationRecord.getProjectinfostatus() == 32){
                backRecords.add(projectOperationRecord);
            }
        }

        int back1 = 0;
        int back2 = 0;
        List<ProjectOperationRecord> records = new ArrayList<>();
        for(ProjectOperationRecord projectOperationRecord : backRecords){
            if(projectOperationRecord.getProjectinfostatus() == 31 && back1 != 0){
                records.add(projectOperationRecord);
            }
            else if(projectOperationRecord.getProjectinfostatus() == 32 && back2 != 0){
                records.add(projectOperationRecord);
            } else {
                if(projectOperationRecord.getProjectinfostatus() == 31)
                    back1 = 1;
                else
                    back2 = 1;
            }
        }



        mav.addObject("documentApplications",documentApplications);
        mav.addObject("documentRepertoire",documentRepertoire);
        mav.addObject("projectInfo",projectInfo);
        mav.addObject("records", records);
        return mav;
    }


    /**
     * 存档
     * @param documentRepertoire
     * @param session
     * @return
     * @throws BaseException
     * @throws IOException
     */
    @RequestMapping("/documentEnter")
    @ResponseBody
    public String documentEnter(DocumentRepertoire documentRepertoire, HttpSession session) throws BaseException, IOException {
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(documentRepertoire.getId());
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 32)
            throw BaseException.FAILED(400,"该项目状态有误");
        if(documentRepertoireMapper.selectByPrimaryKey(documentRepertoire.getId()) == null)
            throw BaseException.FAILED(404,"找不到该存档资讯表");

        User fromSession = userService.getFromSession(session);
        documentRepertoire.setDocumentuserid(fromSession.getId());
        documentRepertoire.setDocumenttime(new Date());
        documentRepertoireMapper.updateByPrimaryKeySelective(documentRepertoire);

        //更新项目状态
        projectInfo.setStatus(33);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);
        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),32);
        return "OK";
    }

    /**
     * 退回
     * @param projectId
     * @param session
     * @return
     * @throws BaseException
     */
    @RequestMapping("/documentEnterBack")
    @ResponseBody
    public String documentEnterBack(Integer projectId, HttpSession session) throws BaseException{
        ProjectInfo projectInfo = projectInfoMapper.selectByPrimaryKey(projectId);
        if (projectInfo == null)
            throw BaseException.FAILED(404,"找不到该项目");
        if(projectInfo.getStatus() != 32)
            throw BaseException.FAILED(400,"该项目状态有误");

        //删除存档申请列表和存档资讯表
        documentApplicationMapper.deleteByProjectid(projectId);
        documentRepertoireMapper.deleteByPrimaryKey(projectId);

        //退回申请存档
        projectInfo.setName(projectInfo.getName() + "(退回)");
        projectInfo.setStatus(30);
        projectInfo.setUpdatetime(new Date());
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);

        //插入操作记录表
        projectOperationRecordService.addRecord(session,projectInfo.getId(),32);
        return "OK";
    }
}
