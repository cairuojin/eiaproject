package com.gjsyoung.eiaproject.controller;

import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.mapper.ApprovalAgreelQualificationsMapper;
import com.gjsyoung.eiaproject.mapper.ApprovalTrialQualificationsMapper;
import com.gjsyoung.eiaproject.service.UserService;
import com.gjsyoung.eiaproject.service.assist.AreasService;
import com.gjsyoung.eiaproject.service.assist.ProjectInfoAssistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/** assist Controller
 * create by cairuojin on 2019/01/31
 */
@Controller
@RequestMapping("/${authentication}/assist")
public class assistController {

    @Autowired
    AreasService areasService;

    @Autowired
    ProjectInfoAssistService projectInfoAssistService;

    @Autowired
    UserService userService;

    @Autowired
    ApprovalTrialQualificationsMapper approvalTrialQualificationsMapper;

    @Autowired
    ApprovalAgreelQualificationsMapper approvalAgreelQualificationsMapper;

    /**
     * 根据省份获得城市
     * @param provinceid
     * @return
     */
    @RequestMapping("/getCities")
    @ResponseBody
    public List getCities(String provinceid){
        return areasService.getCites(provinceid);
    }

    /**
     * 根据城市获得区域
     * @return
     */
    @RequestMapping("/getAreas")
    @ResponseBody
    public List getAreas(String cityid){
        return areasService.getAreas(cityid);
    }

    /**
     * 根据文件类型获得评价范围
     * @param fileTypeId
     * @return
     */
    @RequestMapping("/getEvaluationScope")
    @ResponseBody
    public List getEvaluationScope(Integer fileTypeId){
        return projectInfoAssistService.getScope(fileTypeId);
    }

    /**
     * 在地图中查看标记点
     * @param lng
     * @param lat
     * @return
     */
    @RequestMapping("/gaodeMap")
    public ModelAndView gaodeMap(String lng, String lat){
        ModelAndView mav = new ModelAndView("ASSIST_gaodeMap");
        mav.addObject("lng",lng);
        mav.addObject("lat",lat);
        return mav;
    }


    /**
     * 根据部门id获得该部门下的属于该角色的用户
     * @param departmentId 部门id
     * @param roleList  角色列表
     * @return
     */
    @RequestMapping("/getUserListByDepartmentIdAndRole")
    @ResponseBody
    public List getUserListByDepartmentIdAndRole(String departmentId, @RequestParam("roleList[]") Integer[] roleList){
        return userService.getUserListByDepartmentAndRole(departmentId,roleList);
    }

    /**
     * 判断资质号是否存在
     * @return
     */
    @RequestMapping("/qualificationserialnumberExist")
    @ResponseBody
    public Boolean qualificationserialnumberExist(String qualificationserialnumber){
        int approvalAgreel = approvalAgreelQualificationsMapper.countByQualificationserialNumber(qualificationserialnumber);
        int approvalTrial = approvalTrialQualificationsMapper.countByQualificationserialNumber(qualificationserialnumber);
        if(approvalAgreel == 0 && approvalTrial == 0)
            return true;
        else
            return false;
    }

}
