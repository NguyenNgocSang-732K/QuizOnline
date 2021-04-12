package com.model.entityModels;

import java.util.List;

public class QuestionUpdateModel extends QuestionModel{
    private List<Integer> answerUpdateModel;

    public List<Integer> getAnswerUpdateModel() {
        return answerUpdateModel;
    }

    public void setAnswerUpdateModel(List<Integer> answerUpdateModel) {
        this.answerUpdateModel = answerUpdateModel;
    }
}
