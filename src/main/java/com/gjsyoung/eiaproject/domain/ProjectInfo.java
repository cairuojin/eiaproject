package com.gjsyoung.eiaproject.domain;

import java.util.Date;

public class ProjectInfo {
    private Integer id;

    private String number;

    private String name;

    private String builder;

    private String province;

    private String city;

    private String area;

    private String filingdepartment;

    private String constructionsite;

    private Integer filetype;

    private Integer evaluationscope;

    private String contacts;

    private String buildercontact;

    private Integer subordinatedepartmentid;

    private Integer projectundertakeruserid;

    private String contractmoney;

    private Integer status;

    private Integer createuserid;

    private Integer organizinguserid;

    private Integer hostuserid;

    private Date createtime;

    private Date updatetime;

    private String remarks;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getBuilder() {
        return builder;
    }

    public void setBuilder(String builder) {
        this.builder = builder == null ? null : builder.trim();
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getFilingdepartment() {
        return filingdepartment;
    }

    public void setFilingdepartment(String filingdepartment) {
        this.filingdepartment = filingdepartment == null ? null : filingdepartment.trim();
    }

    public String getConstructionsite() {
        return constructionsite;
    }

    public void setConstructionsite(String constructionsite) {
        this.constructionsite = constructionsite == null ? null : constructionsite.trim();
    }

    public Integer getFiletype() {
        return filetype;
    }

    public void setFiletype(Integer filetype) {
        this.filetype = filetype;
    }

    public Integer getEvaluationscope() {
        return evaluationscope;
    }

    public void setEvaluationscope(Integer evaluationscope) {
        this.evaluationscope = evaluationscope;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts == null ? null : contacts.trim();
    }

    public String getBuildercontact() {
        return buildercontact;
    }

    public void setBuildercontact(String buildercontact) {
        this.buildercontact = buildercontact == null ? null : buildercontact.trim();
    }

    public Integer getSubordinatedepartmentid() {
        return subordinatedepartmentid;
    }

    public void setSubordinatedepartmentid(Integer subordinatedepartmentid) {
        this.subordinatedepartmentid = subordinatedepartmentid;
    }

    public Integer getProjectundertakeruserid() {
        return projectundertakeruserid;
    }

    public void setProjectundertakeruserid(Integer projectundertakeruserid) {
        this.projectundertakeruserid = projectundertakeruserid;
    }

    public String getContractmoney() {
        return contractmoney;
    }

    public void setContractmoney(String contractmoney) {
        this.contractmoney = contractmoney == null ? null : contractmoney.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getCreateuserid() {
        return createuserid;
    }

    public void setCreateuserid(Integer createuserid) {
        this.createuserid = createuserid;
    }

    public Integer getOrganizinguserid() {
        return organizinguserid;
    }

    public void setOrganizinguserid(Integer organizinguserid) {
        this.organizinguserid = organizinguserid;
    }

    public Integer getHostuserid() {
        return hostuserid;
    }

    public void setHostuserid(Integer hostuserid) {
        this.hostuserid = hostuserid;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }
}