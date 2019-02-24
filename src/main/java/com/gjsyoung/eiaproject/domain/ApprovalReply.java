package com.gjsyoung.eiaproject.domain;

import java.util.Date;

public class ApprovalReply {
    private Integer id;

    private Integer createuserid;

    private Date createtime;

    private String replynumber;

    private Date replytime;

    private String replymessageannex;

    private String remarks;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getReplynumber() {
        return replynumber;
    }

    public void setReplynumber(String replynumber) {
        this.replynumber = replynumber == null ? null : replynumber.trim();
    }

    public Date getReplytime() {
        return replytime;
    }

    public void setReplytime(Date replytime) {
        this.replytime = replytime;
    }

    public String getReplymessageannex() {
        return replymessageannex;
    }

    public void setReplymessageannex(String replymessageannex) {
        this.replymessageannex = replymessageannex == null ? null : replymessageannex.trim();
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }
}