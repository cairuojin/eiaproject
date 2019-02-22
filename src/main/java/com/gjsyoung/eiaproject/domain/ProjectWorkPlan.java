package com.gjsyoung.eiaproject.domain;

import org.springframework.data.annotation.Transient;

import java.util.Date;

public class ProjectWorkPlan {
    private Integer id;

    private Integer projectid;

    private Integer status;

    private Integer makeplanuserid;

    private Date workplantime;

    private String workplancontent;

    private String partybperson;

    private String responsibleparty;

    private String remarks;

    private Date createtime;

    private Integer implementsplanuserid;

    private Date implementsplantime;

    private String implementsremarks;

    private Date updatetime;

    @Transient
    ProjectInfo projectinfo;

    public ProjectInfo getProjectinfo() {
        return projectinfo;
    }

    public void setProjectinfo(ProjectInfo projectinfo) {
        this.projectinfo = projectinfo;
    }

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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getMakeplanuserid() {
        return makeplanuserid;
    }

    public void setMakeplanuserid(Integer makeplanuserid) {
        this.makeplanuserid = makeplanuserid;
    }

    public Date getWorkplantime() {
        return workplantime;
    }

    public void setWorkplantime(Date workplantime) {
        this.workplantime = workplantime;
    }

    public String getWorkplancontent() {
        return workplancontent;
    }

    public void setWorkplancontent(String workplancontent) {
        this.workplancontent = workplancontent == null ? null : workplancontent.trim();
    }

    public String getPartybperson() {
        return partybperson;
    }

    public void setPartybperson(String partybperson) {
        this.partybperson = partybperson == null ? null : partybperson.trim();
    }

    public String getResponsibleparty() {
        return responsibleparty;
    }

    public void setResponsibleparty(String responsibleparty) {
        this.responsibleparty = responsibleparty == null ? null : responsibleparty.trim();
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getImplementsplanuserid() {
        return implementsplanuserid;
    }

    public void setImplementsplanuserid(Integer implementsplanuserid) {
        this.implementsplanuserid = implementsplanuserid;
    }

    public Date getImplementsplantime() {
        return implementsplantime;
    }

    public void setImplementsplantime(Date implementsplantime) {
        this.implementsplantime = implementsplantime;
    }

    public String getImplementsremarks() {
        return implementsremarks;
    }

    public void setImplementsremarks(String implementsremarks) {
        this.implementsremarks = implementsremarks == null ? null : implementsremarks.trim();
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }
}