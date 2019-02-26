package com.gjsyoung.eiaproject.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gjsyoung.eiaproject.domain.*;
import com.gjsyoung.eiaproject.domain.assist.ProjectInfoFileType;
import com.gjsyoung.eiaproject.domain.assist.ProjectInfoFileTypeDocument;
import com.gjsyoung.eiaproject.domain.assist.ProjectInfoStatus;
import com.gjsyoung.eiaproject.domain.assist.Provinces;
import com.gjsyoung.eiaproject.mapper.*;
import com.gjsyoung.eiaproject.mapper.assist.ProjectInfoFileTypeDocumentMapper;
import com.gjsyoung.eiaproject.service.DepartmentService;
import com.gjsyoung.eiaproject.service.ProjectInfoService;
import com.gjsyoung.eiaproject.service.RoleService;
import com.gjsyoung.eiaproject.service.UserService;
import com.gjsyoung.eiaproject.service.assist.AreasService;
import com.gjsyoung.eiaproject.service.assist.ProjectInfoAssistService;
import com.gjsyoung.eiaproject.vo.BaseException;
import com.gjsyoung.eiaproject.vo.ProjectListVo;
import com.gjsyoung.eiaproject.vo.UserListVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * create by cairuojin on 2019/01/22
 * 进入页面Controller
 */
@Controller
@RequestMapping("/${authentication}/iframe")
public class adminIframeController {


    public final static String MATTER = "MATTER_";      //待办事项
    public final static String PROJECT = "PROJECT_";    //项目管理
    public final static String SYSTEM = "SYSTEM_";      //系统管理
    public final static String USER = "USER_";          //个人设置

    @Autowired
    RoleService roleService;

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    DepartmentService departmentService;

    @Autowired
    UserMapper userMapper;

    @Autowired
    UserService userService;

    @Autowired
    AreasService areasService;

    @Autowired
    ProjectInfoAssistService projectInfoAssistService;

    @Autowired
    ProjectInfoMapper projectInfoMapper;

    @Autowired
    ProjectInfoService projectInfoService;

    @Autowired
    CollectionPlanMapper collectionPlanMapper;

    @Autowired
    ProjectWorkPlanMapper projectWorkPlanMapper;

    @Autowired
    ApprovalAnnexOpinionMapper approvalAnnexOpinionMapper;

    @Autowired
    ApprovalAgreelQualificationsMapper approvalAgreelQualificationsMapper;

    @Autowired
    ApprovalTrialQualificationsMapper approvalTrialQualificationsMapper;

    @Autowired
    ProjectInfoFileTypeDocumentMapper projectInfoFileTypeDocumentMapper;

    /* 1、待办事项 */

    //项目列表
    /**
     * 人员分配/踏勘情况     列表
     * @param projectListVo 筛选字段
     * @return
     */
    @RequestMapping(
                {
                    "/allotmentList",
                    "/reconnaissanceList",
                    "/riskAnalysisList",
                    "/departmentUndertakeList",
                    "/generalUndertakeList",
                    "/managerUndertakeList",
                    "/contractEntryList",
                    "/contractLeaderList",
                    "/contractFinanceList",
                    "/contractSignatureList",
                    "/collectionPlanList",
                    "/collectionManageList",
                    "/workPlanMakeList",
                    "/monitoringProgrammeList",
                    "/initialReportsList",
                    "/firstTrialList",
                    "/firstTrialEditList",
                    "/firstTrialImplementList",
                    "/finalTrialList",
                    "/finalTrialEditList",
                    "/finalTrialImplementList",
                    "/approvalTrialQualificationsList",
                    "/approvalMettingList",
                    "/approvalReportList",
                    "/approvalOpinionList",
                    "/approvalAgreelQualificationsList",
                    "/approvalReplyList",
                    "/projectQualificationsList",
                    "/documentApplicationList",
                    "/documentLeaderSignList"
                }
            )
    public ModelAndView projectList(ProjectListVo projectListVo, HttpSession session, HttpServletRequest request) throws BaseException {
        String requestURI = request.getRequestURI();    //获得请求地址
        requestURI = requestURI.substring(requestURI.lastIndexOf('/') + 1, requestURI.length());    //截取到方法地址

        User fromSession = userService.getFromSession(session);
        if (fromSession.getRole() != 0)          //非管理员只能看见他自己的部门
            projectListVo.setSubordinateDepartmentId(fromSession.getDepartment());

        ModelAndView mav = new ModelAndView(MATTER + requestURI);
        switch (requestURI){
            case "allotmentList":projectListVo.setStatus(1);break;  //搜索对应状态的项目
            case "reconnaissanceList":projectListVo.setStatus(2);break;
            case "riskAnalysisList":projectListVo.setStatus(3);break;
            case "departmentUndertakeList":projectListVo.setStatus(4);break;
            case "generalUndertakeList":projectListVo.setStatus(5);break;
            case "managerUndertakeList":projectListVo.setStatus(6);break;
            case "contractEntryList":projectListVo.setStatus(7);break;
            case "contractLeaderList":projectListVo.setStatus(8);break;
            case "contractFinanceList":projectListVo.setStatus(9);break;
            case "contractSignatureList":{
                projectListVo.setStatus(10);    //加载部门列表和文件类型列表
                List<Department> departments = departmentService.getDepartments();
                departmentService.queryParentName(departments);
                List<ProjectInfoFileType> projectInfoFileTypes = projectInfoAssistService.loadFileTypeList();
                mav.addObject("departments", departments);
                mav.addObject("projectInfoFileTypes", projectInfoFileTypes);
                break;
            }
            case "collectionPlanList":projectListVo.setStatus(11);break;
            case "collectionManageList":projectListVo.setStatus(12);break;
            case "workPlanMakeList":projectListVo.setStatus(13);break;
            case "monitoringProgrammeList":projectListVo.setStatus(15);break;
            case "initialReportsList":projectListVo.setStatus(16);break;
            case "firstTrialList":{
                projectListVo.setStatus(17);
                projectListVo.setFirstTrialUserId(fromSession.getId());   //初审 只查初审人是自己的项目
                break;
            }
            case "firstTrialEditList":{
                projectListVo.setStatus(18);
                projectListVo.setInitialReportUserId(fromSession.getId());//初审修改情况，只查提交报告人是自己的项目
                break;
            }
            case "firstTrialImplementList":{
                projectListVo.setStatus(19);
                projectListVo.setFirstTrialUserId(fromSession.getId());   //初审落实 只查初审人是自己的项目
                break;
            }
            case "finalTrialList":{
                projectListVo.setStatus(20);
                projectListVo.setFinalTrialUserId(fromSession.getId());   //复审 只查复审人是自己的项目
                break;
            }
            case "finalTrialEditList":{
                projectListVo.setStatus(21);
                projectListVo.setInitialReportUserId(fromSession.getId());//复审修改情况，只查提交报告人是自己的项目
                break;
            }
            case "finalTrialImplementList":{
                projectListVo.setStatus(22);
                projectListVo.setFinalTrialUserId(fromSession.getId());   //复审落实 只查初审人是自己的项目
                break;
            }
            case "approvalTrialQualificationsList":projectListVo.setStatus(23);break;
            case "approvalMettingList":projectListVo.setStatus(24);break;
            case "approvalReportList":projectListVo.setStatus(25);break;
            case "approvalOpinionList":projectListVo.setStatus(26);break;
            case "approvalAgreelQualificationsList":projectListVo.setStatus(27);break;
            case "approvalReplyList":projectListVo.setStatus(28);break;
            case "projectQualificationsList":projectListVo.setStatus(29);break;
            case "documentApplicationList":projectListVo.setStatus(30);break;
            case "documentLeaderSignList":projectListVo.setStatus(31);break;
        }
        projectListVo = projectInfoService.selectAndQuery(projectListVo);   //搜索项目列表

        if("collectionManageList".equals(requestURI)){  //收款记录列表必须查出收款计划表
            for (ProjectInfo projectInfo : projectListVo.getProjectInfos()){
                CollectionPlan collectionPlan = collectionPlanMapper.selectByPrimaryKey(projectInfo.getId());
                projectInfo.getSubObject().put("collectionPlan",collectionPlan );
            }
        }

        if("approvalOpinionList".equals(requestURI)){    //评委会意见落实必须查报审附件表
            for(ProjectInfo projectInfo : projectListVo.getProjectInfos()){
                ApprovalAnnexOpinion approvalAnnexOpinion = approvalAnnexOpinionMapper.selectByPrimaryKey(projectInfo.getId());
                projectInfo.getSubObject().put("approvalAnnexOpinion",approvalAnnexOpinion);
            }
        }

        if("projectQualificationsList".equals(requestURI)){ //出资质必须查询两个表都是否有资质
            List<ProjectInfo> projectInfos = new ArrayList<>();
            for (ProjectInfo projectInfo : projectListVo.getProjectInfos()){
                ApprovalAgreelQualifications approvalAgreelQualifications = approvalAgreelQualificationsMapper.selectByPrimaryKey(projectInfo.getId()); //报批版资质
                ApprovalTrialQualifications approvalTrialQualifications = approvalTrialQualificationsMapper.selectByPrimaryKey(projectInfo.getId());    //报审版资质
                if(approvalTrialQualifications.getQualificationserialnumber() == null){
                    projectInfo.getSubObject().put("qualifications", approvalTrialQualifications);
                    projectInfos.add(projectInfo);
                }
                try {
                    projectInfo = (ProjectInfo) projectInfo.clone();    //克隆对象
                } catch (CloneNotSupportedException e) {
                    e.printStackTrace();
                }
                if(approvalAgreelQualifications.getQualificationserialnumber() == null){
                    projectInfo.getSubObject().put("qualifications", approvalAgreelQualifications);
                    projectInfos.add(projectInfo);
                }

            }
            projectListVo.setProjectInfos(projectInfos);
        }




        mav.addObject("projectListVo",projectListVo);
        return mav;
    }


    /**
     * 进入落实工作
     * @param
     * @return
     */
    @RequestMapping("/workPlanImplement")
    public ModelAndView workPlanImplement(@RequestParam(defaultValue = "1") Integer pageNow){
        ModelAndView mav = new ModelAndView(MATTER + "workPlanImplement");
        PageHelper.startPage(pageNow, 20,true);
        List<ProjectWorkPlan> projectWorkPlans = projectWorkPlanMapper.selectAllByStatus(0);
        PageInfo pageInfo = new PageInfo<>(projectWorkPlans,20);  //分页信息
        mav.addObject("projectWorkPlans",projectWorkPlans);
        mav.addObject("pageInfo",pageInfo);
        return mav;
    }




    /* 2、项目管理 */

    /**
     * 项目列表
     * @return
     */
    @RequestMapping("/projectInfo")
    public ModelAndView projectInfo(ProjectListVo projectListVo, HttpSession session) throws BaseException {
        ModelAndView mav = new ModelAndView(PROJECT + "projectInfo");


        List<ProjectInfoFileType> projectInfoFileTypes = projectInfoAssistService.loadFileTypeList();//加载文件类型列表
        List<ProjectInfoStatus> projectInfoStatuses = projectInfoAssistService.loadStatus();    //加载状态列表

        //非管理员只加载自己部门项目
        List<Department> departments = new ArrayList<>();
        User fromSession = userService.getFromSession(session);
        if (fromSession.getRole() != 0) {   //自己部门
            departments.add(departmentService.getDepartmentById(fromSession.getDepartment()));
            projectListVo.setSubordinateDepartmentId(fromSession.getDepartment());//搜索该部门的项目
        } else {
            departments = departmentService.getDepartments();  //部门列表
        }
        departmentService.queryParentName(departments);

        projectListVo = projectInfoService.selectAndQuery(projectListVo);   //todo 项目高级搜索


        List<Provinces> provinces = areasService.getProvinces();    //省份列表

        mav.addObject("projectListVo",projectListVo);
        mav.addObject("projectInfoFileTypes",projectInfoFileTypes);
        mav.addObject("projectInfoStatuses",projectInfoStatuses);
        mav.addObject("departments",departments);
        mav.addObject("provinces",provinces);
        return mav;
    }

    /**
     * 新增项目
     * @return
     */
    @RequestMapping("/projectInfo_add")
    public ModelAndView projectInfo_add(){
        ModelAndView mav = new ModelAndView(PROJECT + "projectInfo_add");
        List<Provinces> provinces = areasService.getProvinces();    //省份列表
        List fileTypeList = projectInfoAssistService.loadFileTypeList();    //文件类型列表
        List<Department> departments = departmentService.getDepartments();  //部门列表
        departmentService.queryParentName(departments);
        mav.addObject("provinces",provinces);
        mav.addObject("fileTypeList",fileTypeList);
        mav.addObject("departments",departments);
        return mav;
    }




    /**
     * 我的项目列表
     * @param projectListVo 筛选字段
     * @return
     */
    @RequestMapping(
            {
                    "/myUndertakeProjectList",
                    "/myHostProjectList",
                    "/myFirstTrialProjectList",
                    "/myFinalTrialProjectList"
            }
    )
    public ModelAndView myProjectList(ProjectListVo projectListVo, HttpSession session, HttpServletRequest request) throws BaseException {
        String requestURI = request.getRequestURI();    //获得请求地址
        requestURI = requestURI.substring(requestURI.lastIndexOf('/') + 1, requestURI.length());    //截取到方法地址

        User fromSession = userService.getFromSession(session);
        ModelAndView mav = new ModelAndView(SYSTEM + requestURI);
        switch (requestURI){
            case "myUndertakeProjectList"  :projectListVo.setProjectUndertakerUserId(fromSession.getId());break;    //我承接的项目
            case "myHostProjectList"  :projectListVo.setHostUserId(fromSession.getId());break;    //我主持的项目
            case "myFirstTrialProjectList"  :projectListVo.setFirstTrialUserId(fromSession.getId());break;    //我初审的项目
            case "myFinalTrialProjectList"  :projectListVo.setFinalTrialUserId(fromSession.getId());break;    //我定审的项目

        }
        projectListVo = projectInfoService.selectAndQuery(projectListVo);   //搜索项目列表

        mav.addObject("projectListVo",projectListVo);
        return mav;
    }


    /* 3、系统管理 */

    /**
     * 用户信息
     * @return
     */
    @RequestMapping("/userList")
    public ModelAndView userList(UserListVo userListVo){
        ModelAndView mav = new ModelAndView(SYSTEM + "userList");
        userListVo = userService.selectAndQueryOtherName(userListVo);//获得用户列表
        List<Role> roleList = roleService.getList();    //获得角色列表
        mav.addObject("userListVo",userListVo);
        mav.addObject("roleList",roleList);
        return mav;
    }


    /**
     * 部门信息，获得部门导航
     * @return
     */
    @RequestMapping("/department")
    public ModelAndView department(){
        ModelAndView mav = new ModelAndView(SYSTEM + "department");
        List<Department> departments = departmentService.getDepartments();  //获得部门列表
        mav.addObject("departments", departments);
        return mav;
    }

    /**
     * 根据id获得该部门详细信息
     * @param id 部门id
     * @return
     */
    @RequestMapping("/department/info")
    public ModelAndView departmentInfo(@RequestParam(defaultValue = "1") Integer id){
        ModelAndView mav = new ModelAndView(SYSTEM + "department_info");
        Department department = departmentService.getDepartmentById(id);
        mav.addObject("department", department);
        return mav;
    }

    /**
     * 进入新增部门页面
     * @return
     */
    @RequestMapping("/department/add")
    public ModelAndView departmentAdd(){
        ModelAndView mav = new ModelAndView(SYSTEM + "department_add");
        return mav;
    }



    /**
     * 存档要求清单
     * @return
     */
    @RequestMapping("/documentRequirementsList")
    public ModelAndView documentRequirementsList(){
        ModelAndView mav = new ModelAndView(SYSTEM + "documentRequirementsList");
        List<ProjectInfoFileType> projectInfoFileTypes = projectInfoAssistService.loadFileTypeList();   //获得问卷类型列表
        mav.addObject("projectInfoFileTypes", projectInfoFileTypes);
        return mav;
    }

    /**
     * 根据id获得该文件类型详细信息
     * @param id 文件类型
     * @return
     */
    @RequestMapping("/documentDetail")
    public ModelAndView documentDetail(@RequestParam(defaultValue = "1") Integer id){
        ModelAndView mav = new ModelAndView(SYSTEM + "documentDetail");
        ProjectInfoFileType fileType = projectInfoAssistService.getFileType(id);    //获得文件类型
        List<ProjectInfoFileTypeDocument> fileTypeDocuments = projectInfoAssistService.getFileTypeDocumentsById(id);
        mav.addObject("fileType", fileType);
        mav.addObject("fileTypeDocuments",fileTypeDocuments);
        return mav;
    }

    /**
     * 进入新增存档要求页面
     * @param id    文件类型id
     * @return
     */
    @RequestMapping("/documentDetail/add")
    public ModelAndView documentDetailAdd(@RequestParam(defaultValue = "1") Integer id){
        ModelAndView mav = new ModelAndView(SYSTEM + "documentDetailadd");
        ProjectInfoFileType fileType = projectInfoAssistService.getFileType(id);
        mav.addObject("fileType", fileType);
        return mav;
    }

    /**
     * 进入修改存档要求
     * @param id 存档要求id
     * @return
     */
    @RequestMapping("/documentDetail/update")
    public ModelAndView documentDetailUpdate(@RequestParam(defaultValue = "1") Integer id){
        ModelAndView mav = new ModelAndView(SYSTEM + "documentDetailupdate");
        ProjectInfoFileTypeDocument projectInfoFileTypeDocument = projectInfoFileTypeDocumentMapper.selectByPrimaryKey(id);
        ProjectInfoFileType fileType = projectInfoAssistService.getFileType(id);
        mav.addObject("fileType", fileType);
        mav.addObject("projectInfoFileTypeDocument", projectInfoFileTypeDocument);
        return mav;
    }



    /* 4、个人设置 */

    /**
     * 个人信息设置
     * @param session
     * @return
     */
    @RequestMapping("/personalInfo")
    public ModelAndView personalInfo(HttpSession session){
        ModelAndView mav = new ModelAndView(USER + "personalInfo");
        List<Role> list = roleService.getList();    //获得身份列表
        List<Department> departments = departmentService.getDepartments();  //获得部门列表
        departmentService.queryParentName(departments);
        mav.addObject("roleList",list );
        mav.addObject("departments",departments);
        return mav;
    }

    /**
     * 进入修改密码页面
     * @param session
     * @return
     */
    @RequestMapping("/changepassword")
    public ModelAndView changepassword(HttpSession session){
        ModelAndView mav = new ModelAndView(USER + "changepassword");
        return mav;
    }

}
