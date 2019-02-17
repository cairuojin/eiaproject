package com.gjsyoung.eiaproject.domain;

import java.util.Date;

public class ContractMessage {
    private Integer id;

    private Integer entryuserid;

    private String contractnumber;      //合同编号

    private Date contractsigntime;      //签订日期

    private Integer contractamount;     //份数

    private String contractannexurl;    //附件地址

    private Double contractmoney;       //合同款

    private String contractsummary;     //合同摘要

    private Date createtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getEntryuserid() {
        return entryuserid;
    }

    public void setEntryuserid(Integer entryuserid) {
        this.entryuserid = entryuserid;
    }

    public String getContractnumber() {
        return contractnumber;
    }

    public void setContractnumber(String contractnumber) {
        this.contractnumber = contractnumber == null ? null : contractnumber.trim();
    }

    public Date getContractsigntime() {
        return contractsigntime;
    }

    public void setContractsigntime(Date contractsigntime) {
        this.contractsigntime = contractsigntime;
    }

    public Integer getContractamount() {
        return contractamount;
    }

    public void setContractamount(Integer contractamount) {
        this.contractamount = contractamount;
    }

    public String getContractannexurl() {
        return contractannexurl;
    }

    public void setContractannexurl(String contractannexurl) {
        this.contractannexurl = contractannexurl == null ? null : contractannexurl.trim();
    }

    public Double getContractmoney() {
        return contractmoney;
    }

    public void setContractmoney(Double contractmoney) {
        this.contractmoney = contractmoney;
    }

    public String getContractsummary() {
        return contractsummary;
    }

    public void setContractsummary(String contractsummary) {
        this.contractsummary = contractsummary == null ? null : contractsummary.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}