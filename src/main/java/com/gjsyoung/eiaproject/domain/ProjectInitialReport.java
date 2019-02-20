package com.gjsyoung.eiaproject.domain;

import java.util.Date;

public class ProjectInitialReport {
    private Integer id;

    private Integer initialreportuserid;

    private Date createtime;

    private String firsttrialreportannex;

    private Integer firsttrialuserid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getInitialreportuserid() {
        return initialreportuserid;
    }

    public void setInitialreportuserid(Integer initialreportuserid) {
        this.initialreportuserid = initialreportuserid;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getFirsttrialreportannex() {
        return firsttrialreportannex;
    }

    public void setFirsttrialreportannex(String firsttrialreportannex) {
        this.firsttrialreportannex = firsttrialreportannex == null ? null : firsttrialreportannex.trim();
    }

    public Integer getFirsttrialuserid() {
        return firsttrialuserid;
    }

    public void setFirsttrialuserid(Integer firsttrialuserid) {
        this.firsttrialuserid = firsttrialuserid;
    }
}