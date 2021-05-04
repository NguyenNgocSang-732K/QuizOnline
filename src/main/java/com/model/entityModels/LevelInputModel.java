package com.model.entityModels;

public class LevelInputModel {
    private Integer id;
    private String name;
    private int createdBy;
    private int stt;


    public LevelInputModel() {
    }

    public LevelInputModel(Integer id, String name, int createdBy, int stt) {
        this.id = id;
        this.name = name;
        this.createdBy = createdBy;
        this.stt = stt;
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

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public int getStt() {
        return stt;
    }

    public void setStt(int stt) {
        this.stt = stt;
    }
}
