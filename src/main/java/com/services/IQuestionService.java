package com.services;

import com.model.entityModels.PaginationModel;
import com.model.entityModels.QuestionCreateModel;
import com.model.entityModels.QuestionModel;
import com.model.entityModels.QuestionUpdateModel;

public interface IQuestionService {
    PaginationModel<QuestionModel> GetAll(int page, int pageSize, String searchText);

    QuestionUpdateModel findById(int questionId);

    int UpdateQuestion(QuestionUpdateModel questionUpdate);

    int CreateQuestion(QuestionCreateModel questionCreateModel, int adminId);

    boolean UpdateStatus(int questionId, boolean status);
}
