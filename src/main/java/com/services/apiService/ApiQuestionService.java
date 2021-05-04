package com.services.apiService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.entities.Question;
import com.repository.apiRepository.ApiQuestionRepository;

@Service("apiQuestionService")
public class ApiQuestionService implements IApiQuestionService {

	private @Autowired ApiQuestionRepository apiQuestionRepository;

	@Override
	public List<Question> getQuestion(int level_id, int subject_id) {
		// TODO Auto-generated method stub
		return apiQuestionRepository.getQuestion(level_id, subject_id);
	}

//	@Override
//	public List<Question> getQuestion(List<Integer> list_ids_question) {
//		return apiQuestionRepository.getQuestion(list_ids_question);
//	}
	
	

}
