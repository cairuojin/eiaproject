package com.gjsyoung.eiaproject.vo;

import com.gjsyoung.eiaproject.domain.User;

import java.util.List;

/**
 * @author cairuojin
 * @create 2019-01-28 21:59
 */
public class UserListVo {
    //排序字段
    private String orderString = null;

    //查询字段
    private String name = null;    //姓名
    private String departmentString = null;    //部门名
    private Integer roleId = -1;     //角色Id

    //分页字段
    private Integer pageSize = 10;   //单页显示多个
    private Integer pageNow = 1;    //当前第几页
    private Integer pageTotal = 0;  //总页码
    private Long sizeTotal = 0L;  //总个数

    private List<User> users;   //结果

    public String getOrderString() {
        return orderString;
    }

    public void setOrderString(String orderString) {
        this.orderString = orderString;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDepartmentString() {
        return departmentString;
    }

    public void setDepartmentString(String departmentString) {
        this.departmentString = departmentString;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
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

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
}