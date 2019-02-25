package com.gjsyoung.eiaproject.domain;

import java.util.Date;

public class DocumentApplication {
    private Integer id;

    private Integer projectid;

    private Integer documentid;

    private String archivelist;

    private Integer archivenumber;

    private Date createtime;

    private Integer createuserid;

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

    public Integer getDocumentid() {
        return documentid;
    }

    public void setDocumentid(Integer documentid) {
        this.documentid = documentid;
    }

    public String getArchivelist() {
        return archivelist;
    }

    public void setArchivelist(String archivelist) {
        this.archivelist = archivelist == null ? null : archivelist.trim();
    }

    public Integer getArchivenumber() {
        return archivenumber;
    }

    public void setArchivenumber(Integer archivenumber) {
        this.archivenumber = archivenumber;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getCreateuserid() {
        return createuserid;
    }

    public void setCreateuserid(Integer createuserid) {
        this.createuserid = createuserid;
    }
}