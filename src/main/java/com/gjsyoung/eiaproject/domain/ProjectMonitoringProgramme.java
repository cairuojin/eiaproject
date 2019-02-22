package com.gjsyoung.eiaproject.domain;

import java.util.Date;

public class ProjectMonitoringProgramme {
    private Integer id;

    private Integer monitoringuserid;

    private Date createtime;

    private String designatedperson;

    private String monitoringprogramme;

    private String annux;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMonitoringuserid() {
        return monitoringuserid;
    }

    public void setMonitoringuserid(Integer monitoringuserid) {
        this.monitoringuserid = monitoringuserid;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getDesignatedperson() {
        return designatedperson;
    }

    public void setDesignatedperson(String designatedperson) {
        this.designatedperson = designatedperson == null ? null : designatedperson.trim();
    }

    public String getMonitoringprogramme() {
        return monitoringprogramme;
    }

    public void setMonitoringprogramme(String monitoringprogramme) {
        this.monitoringprogramme = monitoringprogramme == null ? null : monitoringprogramme.trim();
    }

    public String getAnnux() {
        return annux;
    }

    public void setAnnux(String annux) {
        this.annux = annux == null ? null : annux.trim();
    }
}