package com.model.entityModels;

import java.util.Date;
import java.util.List;

public class QuestionModel {
    private Integer id;
    private String content;
    private Integer answerType;
    private String image;
    private Date createdDate;
    private int createdBy;
    private boolean status;
    private LevelModel levelModel;
    private List<AnswerModel> answerModels;

    public QuestionModel() {
    }

    public QuestionModel(Integer id, String content, Integer answerType, String image, Date createdDate, int createdBy, boolean status, LevelModel levelModel, List<AnswerModel> answerModels) {
        this.id = id;
        this.content = content;
        this.answerType = answerType;
        this.image = image;
        this.createdDate = createdDate;
        this.createdBy = createdBy;
        this.status = status;
        this.levelModel = levelModel;
        this.answerModels = answerModels;
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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public LevelModel getLevelModel() {
        return levelModel;
    }

    public void setLevelModel(LevelModel levelModel) {
        this.levelModel = levelModel;
    }

    public List<AnswerModel> getAnswerModels() {
        return answerModels;
    }

    public void setAnswerModels(List<AnswerModel> answerModels) {
        this.answerModels = answerModels;
    }
}
