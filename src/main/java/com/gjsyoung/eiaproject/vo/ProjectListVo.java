package com.gjsyoung.eiaproject.vo;

import com.gjsyoung.eiaproject.domain.ProjectInfo;

import java.util.List;

public class ProjectListVo {


    //查询字段
    private String number = null;    //项目编号
    private String name = null;    //项目名称
    private Integer filetype = -1;  //文件类型
    private Integer status = -1;    //项目状态


    private Integer roleType = -1;  //角色身份 组织0 承接1 主持2
    private String roleName = null; //查询上面字段对应的角色姓名

    private Integer subordinateDepartmentId = -1;   //所属部门id

    private Integer approvalLevel = -1; //审批级别 todo


    private String province = null;
    private String city = null;
    private String area = null;     //项目地域

    //todo 合同编号  档案编号 承接时间

    private Integer firstTrialUserId = -1; //初审人id

    //分页字段
    private Integer pageSize = 10;   //单页显示多个
    private Integer pageNow = 1;    //当前第几页
    private Integer pageTotal = 0;  //总页码
    private Long sizeTotal = 0L;  //总个数
    private List<ProjectInfo> projectInfos = null;  //结果

    public Integer getFirstTrialUserId() {
        return firstTrialUserId;
    }

    public void setFirstTrialUserId(Integer firstTrialUserId) {
        this.firstTrialUserId = firstTrialUserId;
    }

    public List<ProjectInfo> getProjectInfos() {
        return projectInfos;
    }

    public void setProjectInfos(List<ProjectInfo> projectInfos) {
        this.projectInfos = projectInfos;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getFiletype() {
        return filetype;
    }

    public void setFiletype(Integer filetype) {
        this.filetype = filetype;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getRoleType() {
        return roleType;
    }

    public void setRoleType(Integer roleType) {
        this.roleType = roleType;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Integer getSubordinateDepartmentId() {
        return subordinateDepartmentId;
    }

    public void setSubordinateDepartmentId(Integer subordinateDepartmentId) {
        this.subordinateDepartmentId = subordinateDepartmentId;
    }

    public Integer getApprovalLevel() {
        return approvalLevel;
    }

    public void setApprovalLevel(Integer approvalLevel) {
        this.approvalLevel = approvalLevel;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageNow() {
        return pageNow;
    }

    public void setPageNow(Integer pageNow) {
        this.pageNow = pageNow;
    }

    public Integer getPageTotal() {
        return pageTotal;
    }

    public void setPageTotal(Integer pageTotal) {
        this.pageTotal = pageTotal;
    }

    public Long getSizeTotal() {
        return sizeTotal;
    }

    public void setSizeTotal(Long sizeTotal) {
        this.sizeTotal = sizeTotal;
    }
}
