package com.gjsyoung.eiaproject.domain.assist;

import java.io.Serializable;
import java.util.Date;

public class ProjectInfoFileTypeDocument implements Serializable{
    private Integer id;

    private Integer filetypeid;

    private String requirements;

    private String archivelist;

    private Integer archivenumber;

    private Integer createuserid;

    private Date createtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFiletypeid() {
        return filetypeid;
    }

    public void setFiletypeid(Integer filetypeid) {
        this.filetypeid = filetypeid;
    }

    public String getRequirements() {
        return requirements;
    }

    public void setRequirements(String requirements) {
        this.requirements = requirements == null ? null : requirements.trim();
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

    public Integer getCreateuserid() {
        return createuserid;
    }

    public void setCreateuserid(Integer createuserid) {
        this.createuserid = createuserid;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}