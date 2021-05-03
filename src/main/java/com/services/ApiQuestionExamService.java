package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.entities.ExamQuestion;
import com.model.entities.Question;
import com.model.models.ApiQuestionExamModel;
import com.repository.ApiQuestionExamRepository;

@Service("apiQuestionExamService")
public class ApiQuestionExamService implements IApiQuestionExamService {

	private @Autowired ApiQuestionExamRepository apiQuestionExamRepository;

	// lất tất cả câu hỏi của bài thi đó
	@Override
	public List<ExamQuestion> getQuestion(Integer exam_id) {
		return apiQuestionExamRepository.getQuestion(exam_id);
	}

	// đếm sô câu hỏi trong một bài thi
	@Override
	public Integer countTotalQuestion(Integer exam_id) {
		return apiQuestionExamRepository.countTotalQuestion(exam_id);
	}

	// lấy question_exam_id
	@Override
	public ApiQuestionExamModel getQuestionExamId(Integer exam_id, Integer question_id) {
		return apiQuestionExamRepository.getQuestionExamId(exam_id, question_id);
	}

	@Override
	public ExamQuestion createExamQuestion(ExamQuestion examQuestion) {
		return apiQuestionExamRepository.save(examQuestion);
	}

}
