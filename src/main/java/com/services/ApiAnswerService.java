package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.entities.Question;
import com.model.entities.StudentAnswer;
import com.model.models.ApiAnswerModel;
import com.model.models.ApiStudentAnswerModel;
import com.repository.ApiAnwerRepository;
import com.repository.ApiQuestionRepository;

@Service("apiAnswerService")
public class ApiAnswerService implements IApiAnswerService {

	private @Autowired ApiAnwerRepository apiAnwerRepository;

	// đếm số câu trả lời cho câu hỏi đó
	@Override
	public Integer countTotalAnswer(Integer question_id) {
		return apiAnwerRepository.countTotalAnswer(question_id);
	}

	// lấy danh sách câu trả lời của câu hỏi đó
	@Override
	public List<StudentAnswer> userAnswer(Integer account_id, Integer exam_question_id) {
		return apiAnwerRepository.userAnswer(account_id, exam_question_id);
	}

	// lấy danh sách các câu tl thuộc câu hỏi
	@Override
	public List<ApiAnswerModel> getAnswer(Integer question_id) {
		return apiAnwerRepository.getAnswer(question_id);
	}

}
