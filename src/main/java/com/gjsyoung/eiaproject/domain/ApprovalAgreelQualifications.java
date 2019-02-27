package com.gjsyoung.eiaproject.domain;

import org.springframework.data.annotation.Transient;

import java.util.Date;

public class ApprovalAgreelQualifications {
    private Integer id;

    private Integer approvaluserid;

    private Date createtime;

    private Integer qualificationnumber;

    private String qualificationremarks;

    private String qualificationserialnumber;

    private Integer qualificationserialuserid;

    private Date qualificationserialtime;

    @Transient
    private Integer status = 1;

    @Transient
    private User user;

    @Transient
    private Integer isQualifications = 0;   //是否出资质  0未出 1已出

    public Integer getIsQualifications() {
        return isQualifications;
    }

    public void setIsQualifications(Integer isQualifications) {
        this.isQualifications = isQualifications;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

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

    public String getQualificationserialnumber() {
        return qualificationserialnumber;
    }

    public void setQualificationserialnumber(String qualificationserialnumber) {
        this.qualificationserialnumber = qualificationserialnumber == null ? null : qualificationserialnumber.trim();
    }

    public Integer getQualificationserialuserid() {
        return qualificationserialuserid;
    }

    public void setQualificationserialuserid(Integer qualificationserialuserid) {
        this.qualificationserialuserid = qualificationserialuserid;
    }

    public Date getQualificationserialtime() {
        return qualificationserialtime;
    }

    public void setQualificationserialtime(Date qualificationserialtime) {
        this.qualificationserialtime = qualificationserialtime;
    }
}