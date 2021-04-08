package com.model.entityModels;

import com.model.entities.Question;

import java.util.Date;

public class AnswerModel {
    private Integer id;
    private String content;
    private int iscorrect;
    private Date createdDate;
    private int createdBy;
    private int status;

    private QuestionModel questionModel;

    public AnswerModel() {
    }

    public AnswerModel(Integer id, String content, int iscorrect, Date createdDate, int createdBy, int status, QuestionModel questionModel) {
        this.id = id;
        this.content = content;
        this.iscorrect = iscorrect;
        this.createdDate = createdDate;
        this.createdBy = createdBy;
        this.status = status;
        this.questionModel = questionModel;
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

    public int getIscorrect() {
        return iscorrect;
    }

    public void setIscorrect(int iscorrect) {
        this.iscorrect = iscorrect;
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

    public QuestionModel getQuestionModel() {
        return questionModel;
    }

    public void setQuestionModel(QuestionModel questionModel) {
        this.questionModel = questionModel;
    }
}
