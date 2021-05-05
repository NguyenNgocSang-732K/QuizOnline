package com.model.entityModels;

public class SubjectInputModel {
    private Integer id;
    private String name;
    private String image;
    private int createdBy;


    public SubjectInputModel() {
    }

    public SubjectInputModel(Integer id, String name, String image, int createdBy) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.createdBy = createdBy;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }
}
