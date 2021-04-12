package com.services;

import com.model.entityModels.AnswerModel;

import java.util.List;

public interface IAnswerService {
    List<AnswerModel> GetAll(int questionId);
}
