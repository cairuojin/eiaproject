package com.gjsyoung.eiaproject.domain.assist;

import java.io.Serializable;

public class ProjectInfoFileType implements Serializable{
    private Integer id;

    private String name;

    private Integer filetypecombine;

    private String shortname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getFiletypecombine() {
        return filetypecombine;
    }

    public void setFiletypecombine(Integer filetypecombine) {
        this.filetypecombine = filetypecombine;
    }

    public String getShortname() {
        return shortname;
    }

    public void setShortname(String shortname) {
        this.shortname = shortname == null ? null : shortname.trim();
    }
}