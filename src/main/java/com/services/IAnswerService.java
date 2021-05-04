package com.services;

import com.model.entityModels.AnswerInputModel;
import com.model.entityModels.AnswerModel;

import java.util.List;

public interface IAnswerService {
    List<AnswerModel> GetAll(int questionId);

    AnswerModel GetById(int answerId);

    AnswerModel Save(int questionId, AnswerInputModel answerInputModel, int userId);

    boolean RemoveAnswer(int answerId, int questionId);

    boolean UpdateStatus(int answerId, boolean status);
}
