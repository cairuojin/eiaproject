package com.gjsyoung.eiaproject.domain;

import java.util.Date;

public class FirstTrialOpinion {
    private Integer id;

    private Integer projectid;

    private String firstopinion;

    private Date createtime;

    private String updateopinion;

    private Date updatetime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProjectid() {
        return projectid;
    }

    public void setProjectid(Integer projectid) {
        this.projectid = projectid;
    }

    public String getFirstopinion() {
        return firstopinion;
    }

    public void setFirstopinion(String firstopinion) {
        this.firstopinion = firstopinion == null ? null : firstopinion.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getUpdateopinion() {
        return updateopinion;
    }

    public void setUpdateopinion(String updateopinion) {
        this.updateopinion = updateopinion == null ? null : updateopinion.trim();
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }
}