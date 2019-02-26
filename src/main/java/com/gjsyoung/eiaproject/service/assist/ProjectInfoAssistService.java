package com.gjsyoung.eiaproject.service.assist;

import com.gjsyoung.eiaproject.domain.assist.ProjectInfoFileType;
import com.gjsyoung.eiaproject.domain.assist.ProjectInfoFileTypeDocument;
import com.gjsyoung.eiaproject.domain.assist.ProjectInfoStatus;

import java.util.List;

/**
 * create by cairuojin on 2019/02/01
 */
public interface ProjectInfoAssistService {

    /**
     * 加载文件类型
     * @return
     */
    public List<ProjectInfoFileType> loadFileTypeList();

    /**
     * 根据文件类型
     * @return
     */
    public ProjectInfoFileType getFileType(Integer fileTypeId);


    /**
     * 获得评价范围类别
     */
    public List getScope(Integer fileTypeId);

    /**
     * 加载项目状态列表
     * @return
     */
    public List<ProjectInfoStatus> loadStatus();

    /**
     * 根据id获得状态对象
     * @param id
     * @return
     */
    public ProjectInfoStatus getStatus(Integer id);

    /**
     * 根据id获得文件类型存档要求
     * @param id
     * @return
     */
    List<ProjectInfoFileTypeDocument> getFileTypeDocumentsById(Integer id);
}
