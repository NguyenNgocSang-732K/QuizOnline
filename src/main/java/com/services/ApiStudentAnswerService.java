package com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.entities.StudentAnswer;
import com.repository.ApiStudentAnswerRepository;

@Service("apiStudentAnswerService")
public class ApiStudentAnswerService implements IApiStudentAnswerService {

	private @Autowired ApiStudentAnswerRepository apiStudentAnswerRepository;

	@Override
	public StudentAnswer createStudentAnswer(StudentAnswer studentAnswer) {
		return apiStudentAnswerRepository.save(studentAnswer);
	}

	@Override
	public StudentAnswer checkStudentAnswer(int account_id, int exam_question_Id) {
		return apiStudentAnswerRepository.checkStudentAnswer(account_id, exam_question_Id);
	}
}
