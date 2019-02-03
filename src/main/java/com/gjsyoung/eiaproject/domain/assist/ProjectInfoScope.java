package com.gjsyoung.eiaproject.domain.assist;

import java.io.Serializable;

public class ProjectInfoScope  implements Serializable {
    private Integer id;

    private String name;

    private Integer filetypecombine;

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
}