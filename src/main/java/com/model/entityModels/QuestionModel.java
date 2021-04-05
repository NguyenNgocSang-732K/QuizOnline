package com.model.entityModels;

import java.util.Date;

public class QuestionModel {
    private Integer id;
    private String content;
    private Integer answerType;
    private String image;
    private Date createdDate;
    private int createdBy;
    private int status;
    private LevelModel levelModel;

    public QuestionModel(Integer id, String content, Integer answerType, String image, Date createdDate, int createdBy, int status, LevelModel levelModel) {
        this.id = id;
        this.content = content;
        this.answerType = answerType;
        this.image = image;
        this.createdDate = createdDate;
        this.createdBy = createdBy;
        this.status = status;
        this.levelModel = levelModel;
    }

    public QuestionModel() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getAnswerType() {
        return answerType;
    }

    public void setAnswerType(Integer answerType) {
        this.answerType = answerType;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public LevelModel getLevelModel() {
        return levelModel;
    }

    public void setLevelModel(LevelModel levelModel) {
        this.levelModel = levelModel;
    }
}
