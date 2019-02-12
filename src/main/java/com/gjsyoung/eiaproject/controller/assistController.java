package com.gjsyoung.eiaproject.controller;

import com.gjsyoung.eiaproject.service.assist.AreasService;
import com.gjsyoung.eiaproject.service.assist.ProjectInfoAssistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

}
