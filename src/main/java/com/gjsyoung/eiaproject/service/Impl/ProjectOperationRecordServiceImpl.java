package com.gjsyoung.eiaproject.service.Impl;

import com.gjsyoung.eiaproject.domain.ProjectOperationRecord;
import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.mapper.ProjectOperationRecordMapper;
import com.gjsyoung.eiaproject.service.ProjectOperationRecordService;
import com.gjsyoung.eiaproject.service.UserService;
import com.gjsyoung.eiaproject.utils.RedisCache;
import com.gjsyoung.eiaproject.vo.BaseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

import static com.gjsyoung.eiaproject.vo.CacheKey.projectRecord;

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

    @Autowired
    RedisCache redisCache;

    /**
     * 添加操作记录
     * @param session 获得用户
     * @param projectId 项目id
     * @param status 操作的状态
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

        redisCache.removeObject(projectRecord + projectId);
    }

    @Override
    public List<ProjectOperationRecord> getRecordByProjectId(Integer projectId) {
        Object object = redisCache.getObject(projectRecord + projectId);
        if(object != null){
            return (List<ProjectOperationRecord>) object;
        } else {
            List<ProjectOperationRecord> projectOperationRecords = projectOperationRecordMapper.selectByProjectId(projectId);
            redisCache.putObject(projectRecord + projectId, projectOperationRecords);
            return projectOperationRecords;
        }
    }
}
