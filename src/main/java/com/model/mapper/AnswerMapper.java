package com.model.mapper;

import com.model.entities.Answer;
import com.model.entityModels.AnswerModel;

public class AnswerMapper {
    public static AnswerModel ToAnswerModel(Answer answerEntity) {
        AnswerModel answerModel = new AnswerModel();

        answerModel.setId(answerEntity.getId());
        answerModel.setContent(answerEntity.getContent());
        answerModel.setIscorrect(answerEntity.getIscorrect());
        answerModel.setCreatedDate(answerEntity.getCreatedDate());
        answerModel.setCreatedBy(answerEntity.getCreatedBy());
        answerModel.setStatus(answerEntity.getStatus());
        answerModel.setQuestionModel(QuestionMapper.ToQuestionModel(answerEntity.getQuestion()));

        return answerModel;
    }
}
