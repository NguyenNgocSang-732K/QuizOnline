package com.services;

import com.model.entityModels.QuestionModel;

import java.util.List;

public interface IQuestionService {
    List<QuestionModel> GetAll();
}
