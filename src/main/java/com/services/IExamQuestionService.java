package com.services;

import java.util.List;

import com.model.entities.ExamQuestion;
import com.model.entities.Question;
import com.model.entityModels.PaginationModel;
import com.model.entityModels.QuestionCreateModel;
import com.model.entityModels.QuestionModel;
import com.model.entityModels.QuestionUpdateModel;

public interface IExamQuestionService {
	
	List<Question> FindAllByExam(int examId);
	
	ExamQuestion FindById(int questionId);

	ExamQuestion Update(ExamQuestion entity);

	ExamQuestion Create(ExamQuestion entity);
	
	List<ExamQuestion> CreateRange(List<ExamQuestion> entities);
	
}
