package com.services;

import com.model.entityModels.PaginationModel;
import com.model.entityModels.QuestionModel;

import java.util.List;

public interface IQuestionService {
    PaginationModel<QuestionModel> GetAll(int page, int pageSize, String searchText);
}
