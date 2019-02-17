package com.gjsyoung.eiaproject.domain;

import java.util.Date;

public class CollectionPlan {
    private Integer id;

    private Integer collectionuserid;

    private Date collectiontime;

    private Double collectionmoney; //收款金额

    private Double collectionbepaidmoney;       //待收款金额

    private String remarks;

    private Date createtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCollectionuserid() {
        return collectionuserid;
    }

    public void setCollectionuserid(Integer collectionuserid) {
        this.collectionuserid = collectionuserid;
    }

    public Date getCollectiontime() {
        return collectiontime;
    }

    public void setCollectiontime(Date collectiontime) {
        this.collectiontime = collectiontime;
    }

    public Double getCollectionmoney() {
        return collectionmoney;
    }

    public void setCollectionmoney(Double collectionmoney) {
        this.collectionmoney = collectionmoney;
    }

    public Double getCollectionbepaidmoney() {
        return collectionbepaidmoney;
    }

    public void setCollectionbepaidmoney(Double collectionbepaidmoney) {
        this.collectionbepaidmoney = collectionbepaidmoney;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}