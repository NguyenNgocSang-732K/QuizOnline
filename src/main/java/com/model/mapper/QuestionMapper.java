package com.model.mapper;

import com.constant.StatusEnum;
import com.model.entities.Answer;
import com.model.entities.Question;
import com.model.entityModels.AnswerModel;
import com.model.entityModels.QuestionModel;
import com.model.entityModels.QuestionUpdateModel;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class QuestionMapper {
    public static QuestionModel ToQuestionModel(Question questionEntity) {
        QuestionModel questionModel = new QuestionModel();

        questionModel.setId(questionEntity.getId());
        questionModel.setContent(questionEntity.getContent());
        questionModel.setAnswerType(questionEntity.getAnswerType());
        questionModel.setImage(questionEntity.getImage());
        questionModel.setCreatedDate(questionEntity.getCreatedDate());
        questionModel.setCreatedBy(questionEntity.getCreatedBy());

        if (StatusEnum.VISIBLE.getKey() == questionEntity.getStatus()) {
            questionModel.setStatus(true);
        } else if (StatusEnum.INVISIBLE.getKey() == questionEntity.getStatus()) {
            questionModel.setStatus(false);
        }

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

        if (StatusEnum.VISIBLE.getKey() == questionEntity.getStatus()) {
            questionUpdateModel.setStatus(true);
        } else if (StatusEnum.INVISIBLE.getKey() == questionEntity.getStatus()) {
            questionUpdateModel.setStatus(false);
        }

        questionUpdateModel.setLevelModel(LevelMapper.ToLevelModel(questionEntity.getLevel()));
        questionUpdateModel.setAnswerModels(questionEntity.getAnswers()
                .stream()
                .map(p -> AnswerMapper.ToAnswerModel(p))
                .collect(Collectors.toList()));

        return questionUpdateModel;
    }

    public static QuestionUpdateModel ToQuestionUpdateModel(QuestionModel questionModel) {
        QuestionUpdateModel questionUpdateModel = new QuestionUpdateModel();

        questionUpdateModel.setId(questionModel.getId());
        questionUpdateModel.setContent(questionModel.getContent());
        questionUpdateModel.setAnswerType(questionModel.getAnswerType());
        questionUpdateModel.setImage(questionModel.getImage());
        questionUpdateModel.setCreatedDate(questionModel.getCreatedDate());
        questionUpdateModel.setCreatedBy(questionModel.getCreatedBy());
        questionUpdateModel.setStatus(questionModel.isStatus());
        questionUpdateModel.setLevelModel(questionModel.getLevelModel());
        questionUpdateModel.setAnswerModels(questionModel.getAnswerModels());

        return questionUpdateModel;
    }
}
