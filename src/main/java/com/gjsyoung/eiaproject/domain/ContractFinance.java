package com.gjsyoung.eiaproject.domain;

import org.springframework.data.annotation.Transient;

import java.util.Date;

public class ContractFinance {
    private Integer id;

    private Integer financeuserid;

    private String financeopinions;

    private Date createtime;

    @Transient
    private User user;

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

    public Integer getFinanceuserid() {
        return financeuserid;
    }

    public void setFinanceuserid(Integer financeuserid) {
        this.financeuserid = financeuserid;
    }

    public String getFinanceopinions() {
        return financeopinions;
    }

    public void setFinanceopinions(String financeopinions) {
        this.financeopinions = financeopinions == null ? null : financeopinions.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}