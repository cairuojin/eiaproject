package com.gjsyoung.eiaproject.domain;

import org.springframework.data.annotation.Transient;

import java.util.Date;

/**
 * 项目主表
 */
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

    private Integer filetype;           //文件类型

    private Integer evaluationscope;    //评价范围

    private String contacts;

    private String buildercontact;

    private Integer subordinatedepartmentid;    //所属部门

    private Integer projectundertakeruserid;    //承接人

    private String contractmoney;

    private Integer status;

    private Integer createuserid;       //创建人

    private Integer organizinguserid;   //组织人

    private Integer hostuserid;         //主持人

    private Date undertaketime; //承接时间

    private Date createtime;

    private Date updatetime;

    private String remarks;

    @Transient
    private String provinceName;

    @Transient
    private String cityName;

    @Transient
    private String areaName;

    @Transient
    private String statusName;  //项目状态名称

    @Transient
    private Department department;  //所属部门对象

    @Transient
    private String filetypeName;    //文件类型名字

    @Transient
    private String evaluationscopeName;    //文件类型名字

    @Transient
    private User projectundertakeruser; //承接人对象

    @Transient
    private User createuser;            //创建人对象

    @Transient
    private User organizinguser;        //组织人对象

    @Transient
    private User hostuser;              //主持人对象

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getEvaluationscopeName() {
        return evaluationscopeName;
    }

    public void setEvaluationscopeName(String evaluationscopeName) {
        this.evaluationscopeName = evaluationscopeName;
    }

    public User getProjectundertakeruser() {
        return projectundertakeruser;
    }

    public void setProjectundertakeruser(User projectundertakeruser) {
        this.projectundertakeruser = projectundertakeruser;
    }

    public User getCreateuser() {
        return createuser;
    }

    public void setCreateuser(User createuser) {
        this.createuser = createuser;
    }

    public User getOrganizinguser() {
        return organizinguser;
    }

    public void setOrganizinguser(User organizinguser) {
        this.organizinguser = organizinguser;
    }

    public User getHostuser() {
        return hostuser;
    }

    public void setHostuser(User hostuser) {
        this.hostuser = hostuser;
    }

    public String getFiletypeName() {
        return filetypeName;
    }

    public void setFiletypeName(String filetypeName) {
        this.filetypeName = filetypeName;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

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

    public Date getUndertaketime() {
        return undertaketime;
    }

    public void setUndertaketime(Date undertaketime) {
        this.undertaketime = undertaketime;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }
}