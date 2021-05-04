package com.services.apiService;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.model.entities.Exam;
import com.model.entities.ExamQuestion;
import com.model.entities.Question;
import com.model.models.ApiExamModel;
import com.model.models.ApiQuestionExamModel;

public interface IApiQuestionExamService {

	// lấy tất cả Question của exam
	List<ExamQuestion> getQuestion(Integer exam_id);

	// đếm số câu hỏi trong bài thi
	Integer countTotalQuestion(Integer exam_id);

	// lấy question_exam_id
	ApiQuestionExamModel getQuestionExamId(Integer exam_id, Integer question_id);

	ExamQuestion createExamQuestion(ExamQuestion examQuestion);
	
 }
