package com.model.mapper;

import com.model.entities.Question;
import com.model.entityModels.QuestionModel;
import com.model.entityModels.QuestionUpdateModel;

public class QuestionMapper {
    public static QuestionModel ToQuestionModel(Question questionEntity) {
        QuestionModel questionModel = new QuestionModel();

        questionModel.setId(questionEntity.getId());
        questionModel.setContent(questionEntity.getContent());
        questionModel.setAnswerType(questionEntity.getAnswerType());
        questionModel.setImage(questionEntity.getImage());
        questionModel.setCreatedDate(questionEntity.getCreatedDate());
        questionModel.setCreatedBy(questionEntity.getCreatedBy());
        questionModel.setStatus(questionEntity.getStatus());
        questionModel.setLevelModel(LevelMapper.ToLevelModel(questionEntity.getLevel()));

        return questionModel;
    }

    public static QuestionUpdateModel ToQuestionUpdateModel(Question questionEntity) {
        QuestionUpdateModel questionUpdateModel = new QuestionUpdateModel();

        questionUpdateModel.setId(questionEntity.getId());
        questionUpdateModel.setContent(questionEntity.getContent());
        questionUpdateModel.setAnswerType(questionEntity.getAnswerType());
        questionUpdateModel.setImage(questionEntity.getImage());
        questionUpdateModel.setCreatedDate(questionEntity.getCreatedDate());
        questionUpdateModel.setCreatedBy(questionEntity.getCreatedBy());
        questionUpdateModel.setStatus(questionEntity.getStatus());
        questionUpdateModel.setLevelModel(LevelMapper.ToLevelModel(questionEntity.getLevel()));

        return questionUpdateModel;
    }
}
