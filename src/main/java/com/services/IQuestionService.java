package com.services;

import java.util.List;

import com.model.entities.Question;
import com.model.entityModels.PaginationModel;
import com.model.entityModels.QuestionCreateModel;
import com.model.entityModels.QuestionModel;
import com.model.entityModels.QuestionUpdateModel;

public interface IQuestionService {

	PaginationModel<QuestionModel> GetAll(int page, int pageSize, String searchText);

	QuestionModel findById(int questionId);

	int UpdateQuestion(QuestionUpdateModel questionUpdate);

	int CreateQuestion(QuestionCreateModel questionCreateModel, int adminId);

	boolean UpdateStatus(int questionId, boolean status);

	List<Question> FindRandomQuestionbySubjectLevel(int subjectId, int levelId, int quantity);
	
	List<Question> FindAllQuestionByExam(int examId);
}
