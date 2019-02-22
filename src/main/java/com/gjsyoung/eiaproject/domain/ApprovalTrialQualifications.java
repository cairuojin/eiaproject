package com.gjsyoung.eiaproject.domain;

import java.util.Date;

public class ApprovalTrialQualifications {
    private Integer id;

    private Integer approvaluserid;

    private Date createtime;

    private Integer qualificationnumber;

    private String qualificationremarks;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getApprovaluserid() {
        return approvaluserid;
    }

    public void setApprovaluserid(Integer approvaluserid) {
        this.approvaluserid = approvaluserid;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getQualificationnumber() {
        return qualificationnumber;
    }

    public void setQualificationnumber(Integer qualificationnumber) {
        this.qualificationnumber = qualificationnumber;
    }

    public String getQualificationremarks() {
        return qualificationremarks;
    }

    public void setQualificationremarks(String qualificationremarks) {
        this.qualificationremarks = qualificationremarks == null ? null : qualificationremarks.trim();
    }
}