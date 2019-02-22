package com.gjsyoung.eiaproject.domain;

import java.util.Date;

public class ApprovalAnnexOpinion {
    private Integer id;

    private String mettingsummaryannex;

    private Integer mettinguserid;

    private Date mettingtime;

    private String approvalreportannex;

    private String approvalexpertopinionsannex;

    private Integer approvaluserid;

    private Date approvaltime;

    private Integer implementstatus;

    private String implementremarks;

    private Integer implementuserid;

    private Date implementtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMettingsummaryannex() {
        return mettingsummaryannex;
    }

    public void setMettingsummaryannex(String mettingsummaryannex) {
        this.mettingsummaryannex = mettingsummaryannex == null ? null : mettingsummaryannex.trim();
    }

    public Integer getMettinguserid() {
        return mettinguserid;
    }

    public void setMettinguserid(Integer mettinguserid) {
        this.mettinguserid = mettinguserid;
    }

    public Date getMettingtime() {
        return mettingtime;
    }

    public void setMettingtime(Date mettingtime) {
        this.mettingtime = mettingtime;
    }

    public String getApprovalreportannex() {
        return approvalreportannex;
    }

    public void setApprovalreportannex(String approvalreportannex) {
        this.approvalreportannex = approvalreportannex == null ? null : approvalreportannex.trim();
    }

    public String getApprovalexpertopinionsannex() {
        return approvalexpertopinionsannex;
    }

    public void setApprovalexpertopinionsannex(String approvalexpertopinionsannex) {
        this.approvalexpertopinionsannex = approvalexpertopinionsannex == null ? null : approvalexpertopinionsannex.trim();
    }

    public Integer getApprovaluserid() {
        return approvaluserid;
    }

    public void setApprovaluserid(Integer approvaluserid) {
        this.approvaluserid = approvaluserid;
    }

    public Date getApprovaltime() {
        return approvaltime;
    }

    public void setApprovaltime(Date approvaltime) {
        this.approvaltime = approvaltime;
    }

    public Integer getImplementstatus() {
        return implementstatus;
    }

    public void setImplementstatus(Integer implementstatus) {
        this.implementstatus = implementstatus;
    }

    public String getImplementremarks() {
        return implementremarks;
    }

    public void setImplementremarks(String implementremarks) {
        this.implementremarks = implementremarks == null ? null : implementremarks.trim();
    }

    public Integer getImplementuserid() {
        return implementuserid;
    }

    public void setImplementuserid(Integer implementuserid) {
        this.implementuserid = implementuserid;
    }

    public Date getImplementtime() {
        return implementtime;
    }

    public void setImplementtime(Date implementtime) {
        this.implementtime = implementtime;
    }
}