package com.gjsyoung.eiaproject.service.assist;

import com.gjsyoung.eiaproject.domain.assist.ProjectInfoFileType;

import java.util.List;

/**
 * create by cairuojin on 2019/02/01
 */
public interface ProjectInfoAssistService {

    /**
     * 加载文件类型
     * @return
     */
    public List loadFileTypeList();

    /**
     * 根据文件类型
     * @return
     */
    public ProjectInfoFileType getFileType(Integer fileTypeId);


    /**
     * 获得评价范围类别
     */
    public List getScope(Integer fileTypeId);
}
