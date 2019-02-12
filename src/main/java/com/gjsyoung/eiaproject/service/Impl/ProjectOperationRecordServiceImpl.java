package com.gjsyoung.eiaproject.service.Impl;

import com.gjsyoung.eiaproject.domain.ProjectOperationRecord;
import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.mapper.ProjectOperationRecordMapper;
import com.gjsyoung.eiaproject.service.ProjectOperationRecordService;
import com.gjsyoung.eiaproject.service.UserService;
import com.gjsyoung.eiaproject.vo.BaseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * @Classname ProjectOperationRecordServiceImpl
 * @Description
 * @Date 2019/2/9 14:05
 * @Created by cairuojin
 */
@Service
public class ProjectOperationRecordServiceImpl implements ProjectOperationRecordService{

    @Autowired
    UserService userService;

    @Autowired
    ProjectOperationRecordMapper projectOperationRecordMapper;

    /**
     * 添加记录
     * @param session
     * @param projectId
     * @param status
     */
    @Override
    public void addRecord(HttpSession session, Integer projectId, Integer status) throws BaseException{
        ProjectOperationRecord projectOperationRecord = new ProjectOperationRecord();
        User fromSession = userService.getFromSession(session);
        if(fromSession != null){
            projectOperationRecord.setUserid(fromSession.getId());
        }
        projectOperationRecord.setProjectinfoid(projectId);
        projectOperationRecord.setProjectinfostatus(status);
        projectOperationRecord.setTime(new Date());
        projectOperationRecordMapper.insert(projectOperationRecord);
    }
}
