package com.gjsyoung.eiaproject.domain;

import org.springframework.data.annotation.Transient;

import java.util.Date;

public class ContractLeader {
    private Integer id;

    private Integer leaderuserid;

    private String leaderopinions;

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

    public Integer getLeaderuserid() {
        return leaderuserid;
    }

    public void setLeaderuserid(Integer leaderuserid) {
        this.leaderuserid = leaderuserid;
    }

    public String getLeaderopinions() {
        return leaderopinions;
    }

    public void setLeaderopinions(String leaderopinions) {
        this.leaderopinions = leaderopinions == null ? null : leaderopinions.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}