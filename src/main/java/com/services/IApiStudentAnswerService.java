package com.services;

import org.springframework.data.repository.query.Param;

import com.model.entities.StudentAnswer;

public interface IApiStudentAnswerService {

	StudentAnswer createStudentAnswer(StudentAnswer studentAnswer);

	StudentAnswer checkStudentAnswer(int account_id, int exam_question_Id);

}
