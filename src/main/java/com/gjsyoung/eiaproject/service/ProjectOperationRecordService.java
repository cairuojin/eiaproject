package com.gjsyoung.eiaproject.service;

import com.gjsyoung.eiaproject.vo.BaseException;

import javax.servlet.http.HttpSession;

/**
 * @Classname ProjectOperationRecordService
 * @Description 项目操作记录
 * @Date 2019/2/9 14:04
 * @Created by cairuojin
 */
public interface ProjectOperationRecordService {

    public void addRecord(HttpSession session, Integer projectId, Integer status)  throws BaseException;
}
