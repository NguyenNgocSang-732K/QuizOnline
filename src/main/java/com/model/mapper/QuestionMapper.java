package com.model.mapper;

import com.model.entities.Question;
import com.model.entityModels.QuestionModel;

public class QuestionMapper {
    public static QuestionModel ToQuestionModel(Question questionEntity) {
        return new QuestionModel(questionEntity.getId(), questionEntity.getContent(), questionEntity.getAnswerType(),
                questionEntity.getImage(),
                questionEntity.getCreatedDate(), questionEntity.getCreatedBy(),
                questionEntity.getStatus(), LevelMapper.ToLevelModel(questionEntity.getLevel()));
    }
}
