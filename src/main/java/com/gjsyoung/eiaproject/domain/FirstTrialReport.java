package com.gjsyoung.eiaproject.domain;

import java.util.Date;

public class FirstTrialReport {
    private Integer id;

    private Date createtime;

    private String firstopinionannex;

    private String firstannotationreport;

    private String finalopinionannex;

    private Integer finaltrialuserid;

    private Integer status;

    private String remarks;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getFirstopinionannex() {
        return firstopinionannex;
    }

    public void setFirstopinionannex(String firstopinionannex) {
        this.firstopinionannex = firstopinionannex == null ? null : firstopinionannex.trim();
    }

    public String getFirstannotationreport() {
        return firstannotationreport;
    }

    public void setFirstannotationreport(String firstannotationreport) {
        this.firstannotationreport = firstannotationreport == null ? null : firstannotationreport.trim();
    }

    public String getFinalopinionannex() {
        return finalopinionannex;
    }

    public void setFinalopinionannex(String finalopinionannex) {
        this.finalopinionannex = finalopinionannex == null ? null : finalopinionannex.trim();
    }

    public Integer getFinaltrialuserid() {
        return finaltrialuserid;
    }

    public void setFinaltrialuserid(Integer finaltrialuserid) {
        this.finaltrialuserid = finaltrialuserid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }
}