package com.gjsyoung.eiaproject.domain;

import java.util.Date;

/**
 * 目录
 */
public class Category implements Comparable<Category>{
    private Integer id;

    private Integer parentId;   //父id

    private String name;        //内容

    private Integer status;     //状态  是否开启 0-开启 1删除

    private Integer sortOrder;  //排序id  小在前

    private Integer isParent;   //目录表树中位于第几层  0-横向   1竖父级 2竖子级

    private String role;        //何种身份可见

    private String engname;     //对应controller方法的值

    private Date createtime;

    private Date updatetime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }

    public Integer getIsParent() {
        return isParent;
    }

    public void setIsParent(Integer isParent) {
        this.isParent = isParent;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role == null ? null : role.trim();
    }

    public String getEngname() {
        return engname;
    }

    public void setEngname(String engname) {
        this.engname = engname == null ? null : engname.trim();
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


    @Override
    public int compareTo(Category o) {
        int isParent = this.isParent - o.getIsParent() ;
        int parentId = this.parentId - o.getParentId();
        return isParent == 0 ? parentId == 0 ? this.sortOrder - o.getSortOrder() : isParent : parentId;
    }
}