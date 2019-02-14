package com.gjsyoung.eiaproject.domain;

import org.springframework.data.annotation.Transient;

import java.util.Date;

public class ProjectReconnaissance {
    private Integer id;

    private Integer reconnaissanceuserid;

    private String informationlist;

    private String siteconditions;

    private String existingproblems;

    private String annex;

    private String maplng;

    private String maplat;

    private String filepic1;

    private String filepic2;

    private String filepic3;

    private String filepic4;

    private String filepic5;

    private String filepicname1;

    private String filepicname2;

    private String filepicname3;

    private String filepicname4;

    private String filepicname5;

    private Date createtime;

    @Transient
    private User user;  //踏勘人员

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

    public Integer getReconnaissanceuserid() {
        return reconnaissanceuserid;
    }

    public void setReconnaissanceuserid(Integer reconnaissanceuserid) {
        this.reconnaissanceuserid = reconnaissanceuserid;
    }

    public String getInformationlist() {
        return informationlist;
    }

    public void setInformationlist(String informationlist) {
        this.informationlist = informationlist == null ? null : informationlist.trim();
    }

    public String getSiteconditions() {
        return siteconditions;
    }

    public void setSiteconditions(String siteconditions) {
        this.siteconditions = siteconditions == null ? null : siteconditions.trim();
    }

    public String getExistingproblems() {
        return existingproblems;
    }

    public void setExistingproblems(String existingproblems) {
        this.existingproblems = existingproblems == null ? null : existingproblems.trim();
    }

    public String getAnnex() {
        return annex;
    }

    public void setAnnex(String annex) {
        this.annex = annex == null ? null : annex.trim();
    }

    public String getMaplng() {
        return maplng;
    }

    public void setMaplng(String maplng) {
        this.maplng = maplng == null ? null : maplng.trim();
    }

    public String getMaplat() {
        return maplat;
    }

    public void setMaplat(String maplat) {
        this.maplat = maplat == null ? null : maplat.trim();
    }

    public String getFilepic1() {
        return filepic1;
    }

    public void setFilepic1(String filepic1) {
        this.filepic1 = filepic1 == null ? null : filepic1.trim();
    }

    public String getFilepic2() {
        return filepic2;
    }

    public void setFilepic2(String filepic2) {
        this.filepic2 = filepic2 == null ? null : filepic2.trim();
    }

    public String getFilepic3() {
        return filepic3;
    }

    public void setFilepic3(String filepic3) {
        this.filepic3 = filepic3 == null ? null : filepic3.trim();
    }

    public String getFilepic4() {
        return filepic4;
    }

    public void setFilepic4(String filepic4) {
        this.filepic4 = filepic4 == null ? null : filepic4.trim();
    }

    public String getFilepic5() {
        return filepic5;
    }

    public void setFilepic5(String filepic5) {
        this.filepic5 = filepic5 == null ? null : filepic5.trim();
    }

    public String getFilepicname1() {
        return filepicname1;
    }

    public void setFilepicname1(String filepicname1) {
        this.filepicname1 = filepicname1 == null ? null : filepicname1.trim();
    }

    public String getFilepicname2() {
        return filepicname2;
    }

    public void setFilepicname2(String filepicname2) {
        this.filepicname2 = filepicname2 == null ? null : filepicname2.trim();
    }

    public String getFilepicname3() {
        return filepicname3;
    }

    public void setFilepicname3(String filepicname3) {
        this.filepicname3 = filepicname3 == null ? null : filepicname3.trim();
    }

    public String getFilepicname4() {
        return filepicname4;
    }

    public void setFilepicname4(String filepicname4) {
        this.filepicname4 = filepicname4 == null ? null : filepicname4.trim();
    }

    public String getFilepicname5() {
        return filepicname5;
    }

    public void setFilepicname5(String filepicname5) {
        this.filepicname5 = filepicname5 == null ? null : filepicname5.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}