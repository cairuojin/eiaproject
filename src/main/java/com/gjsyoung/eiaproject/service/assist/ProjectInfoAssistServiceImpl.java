package com.gjsyoung.eiaproject.service.assist;

import com.gjsyoung.eiaproject.domain.assist.ProjectInfoFileType;
import com.gjsyoung.eiaproject.domain.assist.ProjectInfoScope;
import com.gjsyoung.eiaproject.mapper.assist.ProjectInfoFileTypeMapper;
import com.gjsyoung.eiaproject.mapper.assist.ProjectInfoScopeMapper;
import com.gjsyoung.eiaproject.utils.RedisCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/**
 * create by cairuojin on 2019/02/01
 */
@Service
public class ProjectInfoAssistServiceImpl implements ProjectInfoAssistService {

    @Autowired
    ProjectInfoFileTypeMapper projectInfoFileTypeMapper;

    @Autowired
    ProjectInfoScopeMapper projectInfoScopeMapper;

    @Autowired
    RedisCache redisCache;

    /**
     * 延迟加载项目文件类型
     * @return
     */
    @Override
    public List loadFileTypeList() {
        List<ProjectInfoFileType> projectInfoFileTypes = null;
        Object object = redisCache.getObject("projectInfoFileType");
        if(object == null){
            projectInfoFileTypes = projectInfoFileTypeMapper.selectAll();
            redisCache.putObject("projectInfoFileType" , projectInfoFileTypes);
        } else {
            projectInfoFileTypes = (List<ProjectInfoFileType>) object;
        }
        return projectInfoFileTypes;
    }

    @Override
    public ProjectInfoFileType getFileType(Integer fileTypeId) {
        List<ProjectInfoFileType> list = loadFileTypeList();
        for(ProjectInfoFileType projectInfoFileType : list){
            if(projectInfoFileType.getId().intValue() == fileTypeId.intValue()){
                return projectInfoFileType;
            }
        }
        return null;
    }

    /**
     * 根据文件类型加载评价范围
     * @param fileTypeId
     * @return
     */
    @Override
    public List getScope(Integer fileTypeId) {
        ProjectInfoFileType fileType = getFileType(fileTypeId);
        if(fileType == null)
            return null;
        List<ProjectInfoScope> projectInfoScopes = null;
        Object object = redisCache.getObject("projectInfoScope_" + fileType.getFiletypecombine());
        if(object == null){
            Map<String , List> data = new HashMap();
            List<ProjectInfoScope> all = projectInfoScopeMapper.selectAll();
            for (ProjectInfoScope scope : all){
                Integer filetypeid = scope.getFiletypecombine();
                List list = data.get(filetypeid + "");
                if(list == null){
                    list = new ArrayList();
                    data.put(filetypeid + "" , list);
                }
                list.add(scope);
            }
            for (Entry entry : data.entrySet()){
                redisCache.putObject("projectInfoScope_" + entry.getKey() , entry.getValue());
                projectInfoScopes = data.get(fileType.getFiletypecombine() + "");
            }
        } else
            projectInfoScopes = (List<ProjectInfoScope>) object;
        return projectInfoScopes;
    }
}
