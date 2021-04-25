package com.model.mapper;

import com.constant.StatusEnum;
import com.model.entities.Answer;
import com.model.entities.Question;
import com.model.entityModels.AnswerInputModel;
import com.model.entityModels.AnswerModel;

public class AnswerMapper {
    public static AnswerModel ToAnswerModel(Answer answerEntity) {
        AnswerModel answerModel = new AnswerModel();

        answerModel.setId(answerEntity.getId());
        answerModel.setContent(answerEntity.getContent());
        answerModel.setIscorrect(answerEntity.isIscorrect());
        answerModel.setCreatedDate(answerEntity.getCreatedDate());
        answerModel.setCreatedBy(answerEntity.getCreatedBy());

        if(answerEntity.getStatus() == StatusEnum.VISIBLE.getKey()){
            answerModel.setStatus(true);
        }else if(answerEntity.getStatus() == StatusEnum.INVISIBLE.getKey()){
            answerModel.setStatus(false);
        }

        answerModel.setQuestionModel(QuestionMapper.ToQuestionModel(answerEntity.getQuestion()));

        return answerModel;
    }

    public static AnswerInputModel ToAnswerInputModel(AnswerModel answerModel){
        AnswerInputModel answerInput = new AnswerInputModel();
        answerInput.setAnswerId(answerModel.getId());
        answerInput.setContent(answerModel.getContent());
        answerInput.setCorrect(answerModel.isIscorrect());
        answerInput.setQuestionId(answerModel.getQuestionModel().getId());

        return answerInput;
    }
}
