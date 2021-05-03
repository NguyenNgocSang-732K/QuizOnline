package com.services;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.model.entities.Exam;
import com.model.entities.Question;
import com.model.models.ApiExamModel;

public interface IApiQuestionService {

//	List<Question> getQuestion(List<Integer> list_ids_question);

	List<Question> getQuestion(int level_id, int subject_id);

}
