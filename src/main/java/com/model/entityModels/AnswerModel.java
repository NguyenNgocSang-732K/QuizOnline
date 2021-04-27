package com.model.entityModels;

import java.util.Date;

public class AnswerModel {
    private Integer id;
    private String content;
    private boolean iscorrect;
    private Date createdDate;
    private int createdBy;
    private boolean status;

    private QuestionModel questionModel;

    public AnswerModel() {
    }

    public AnswerModel(Integer id, String content, boolean iscorrect, Date createdDate, int createdBy, boolean status, QuestionModel questionModel) {
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

    public boolean isIscorrect() {
        return iscorrect;
    }

    public void setIscorrect(boolean iscorrect) {
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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public QuestionModel getQuestionModel() {
        return questionModel;
    }

    public void setQuestionModel(QuestionModel questionModel) {
        this.questionModel = questionModel;
    }
}
