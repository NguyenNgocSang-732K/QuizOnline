package com.services;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.model.entities.StudentAnswer;
import com.model.models.ApiAnswerModel;
import com.model.models.ApiStudentAnswerModel;

public interface IApiAnswerService {

	Integer countTotalAnswer(Integer question_id);

	// lấy danh sách những câu tl của câu hỏi đó
	List<StudentAnswer> userAnswer(Integer account_id, Integer exam_question_id);

	//lấy danh sách những câu tl thuộc câu hỏi
	List<ApiAnswerModel> getAnswer(Integer question_id);
	
}


