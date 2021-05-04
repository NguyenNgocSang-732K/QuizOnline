package com.model.entityModels;

import java.util.Date;
import java.util.List;

public class SubjectModel {
    private Integer id;
    private String name;
    private Date createdDate;
    private String image;
    private int createdBy;
    private boolean status;
    private List<QuestionModel> questions;

    public SubjectModel() {
    }

    public SubjectModel(Integer id, String name, Date createdDate, String image, int createdBy, boolean status, List<QuestionModel> questions) {
        this.id = id;
        this.name = name;
        this.createdDate = createdDate;
        this.image = image;
        this.createdBy = createdBy;
        this.status = status;
        this.questions = questions;
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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public List<QuestionModel> getQuestions() {
        return questions;
    }

    public void setQuestions(List<QuestionModel> questions) {
        this.questions = questions;
    }
}
