package com.model.entityModels;

import java.util.Date;

public class LevelModel {
    private Integer id;
    private String name;
    private Date createdDate;
    private int createdBy;
    private int status;

    public LevelModel() {
    }

    public LevelModel(Integer id, String name, Date createdDate, int createdBy, int status) {
        this.id = id;
        this.name = name;
        this.createdDate = createdDate;
        this.createdBy = createdBy;
        this.status = status;
    }

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
        this.name = name;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
