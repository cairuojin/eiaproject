package com.gjsyoung.eiaproject.domain;

import java.util.Date;

public class ProjectDepartmentUndertake {
    private Integer id;

    private Integer undertakinguserid;

    private String undertakingopinions;

    private Integer undertakingsituation;

    private Date createtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUndertakinguserid() {
        return undertakinguserid;
    }

    public void setUndertakinguserid(Integer undertakinguserid) {
        this.undertakinguserid = undertakinguserid;
    }

    public String getUndertakingopinions() {
        return undertakingopinions;
    }

    public void setUndertakingopinions(String undertakingopinions) {
        this.undertakingopinions = undertakingopinions == null ? null : undertakingopinions.trim();
    }

    public Integer getUndertakingsituation() {
        return undertakingsituation;
    }

    public void setUndertakingsituation(Integer undertakingsituation) {
        this.undertakingsituation = undertakingsituation;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}