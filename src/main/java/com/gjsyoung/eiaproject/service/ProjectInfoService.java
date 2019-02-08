package com.gjsyoung.eiaproject.service;

import com.gjsyoung.eiaproject.vo.ProjectListVo;

public interface ProjectInfoService {

    /**
     * 根据ProjectListVo查询项目列表
     * @param projectListVo
     * @return
     */
    public ProjectListVo selectAndQuery(ProjectListVo projectListVo);
}
