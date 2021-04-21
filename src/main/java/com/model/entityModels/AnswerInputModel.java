package com.model.entityModels;

public class AnswerInputModel {
    private String content;
    private boolean correct;
    private int questionId;

    public AnswerInputModel() {
    }

    public AnswerInputModel(String content, boolean correct, int questionId) {
        this.content = content;
        this.correct = correct;
        this.questionId = questionId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public boolean isCorrect() {
        return correct;
    }

    public void setCorrect(boolean correct) {
        this.correct = correct;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }
}
