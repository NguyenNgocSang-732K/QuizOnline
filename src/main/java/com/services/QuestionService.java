package com.services;

import com.model.entityModels.QuestionModel;
import com.model.mapper.QuestionMapper;
import com.repository.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service("questionService")
public class QuestionService implements IQuestionService {

    @Qualifier("questionRepository")
    private @Autowired
    QuestionRepository _questionRepository;

    @Override
    public List<QuestionModel> GetAll() {
        return _questionRepository.findAll().stream().map(p -> QuestionMapper.ToQuestionModel(p)).collect(Collectors.toList());
    }
}
