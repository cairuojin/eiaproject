package com.gjsyoung.eiaproject.domain;

import java.util.Date;

public class FinalTrialReport {
    private Integer id;

    private Date createtime;

    private String finalopinionannex;

    private String finalannotationreport;

    private String approvalopinionannex;

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

    public String getFinalopinionannex() {
        return finalopinionannex;
    }

    public void setFinalopinionannex(String finalopinionannex) {
        this.finalopinionannex = finalopinionannex == null ? null : finalopinionannex.trim();
    }

    public String getFinalannotationreport() {
        return finalannotationreport;
    }

    public void setFinalannotationreport(String finalannotationreport) {
        this.finalannotationreport = finalannotationreport == null ? null : finalannotationreport.trim();
    }

    public String getApprovalopinionannex() {
        return approvalopinionannex;
    }

    public void setApprovalopinionannex(String approvalopinionannex) {
        this.approvalopinionannex = approvalopinionannex == null ? null : approvalopinionannex.trim();
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