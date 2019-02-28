package com.gjsyoung.eiaproject.domain;

import org.springframework.data.annotation.Transient;

import java.io.Serializable;
import java.util.Date;

/**
 * 项目操作记录
 */
public class ProjectOperationRecord implements Serializable{
    private Integer id;

    private Date time;      //操作时间

    private Integer userid; //操作人

    private Integer projectinfoid;  //操作项目

    private Integer projectinfostatus;  //操作状态

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

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getProjectinfoid() {
        return projectinfoid;
    }

    public void setProjectinfoid(Integer projectinfoid) {
        this.projectinfoid = projectinfoid;
    }

    public Integer getProjectinfostatus() {
        return projectinfostatus;
    }

    public void setProjectinfostatus(Integer projectinfostatus) {
        this.projectinfostatus = projectinfostatus;
    }
}