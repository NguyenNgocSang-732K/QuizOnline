package com.services.apiService;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.model.entities.StudentAnswer;

public interface IApiStudentAnswerService {

	StudentAnswer createStudentAnswer(StudentAnswer studentAnswer);

	StudentAnswer checkStudentAnswer(int account_id, int exam_question_Id);

	List<StudentAnswer> getStudentAnswer(int account_id, int exam_question_Id);
	
	boolean delete(int id);
	
	List<StudentAnswer> removeStudentAnswer(int id);
}
