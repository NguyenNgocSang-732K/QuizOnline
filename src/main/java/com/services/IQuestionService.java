package com.services;

import com.model.entityModels.PaginationModel;
import com.model.entityModels.QuestionModel;
import com.model.entityModels.QuestionUpdateModel;

import java.util.List;

public interface IQuestionService {
    PaginationModel<QuestionModel> GetAll(int page, int pageSize, String searchText);

    QuestionUpdateModel findById(int questionId);
}
