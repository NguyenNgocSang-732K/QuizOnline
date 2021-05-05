package com.services.apiService;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.entities.StudentAnswer;
import com.repository.apiRepository.ApiStudentAnswerRepository;

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

	@Override
	public List<StudentAnswer> getStudentAnswer(int account_id, int exam_question_Id) {
		return apiStudentAnswerRepository.getStudentAnswer(account_id, exam_question_Id);
	}

	@Override
	public boolean delete(int id) {
		
		
		Optional<StudentAnswer> optional = apiStudentAnswerRepository.findById(id);
		
		if(!optional.isPresent()) {
			return false;
		}
		
		StudentAnswer studa = optional.get();
		apiStudentAnswerRepository.delete(studa);
		return true;
	}

	@Override
	public List<StudentAnswer> removeStudentAnswer(int id) {
		return apiStudentAnswerRepository.removeStudentAnswer(id);
	}

}
