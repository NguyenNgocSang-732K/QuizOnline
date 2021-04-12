package com.services;

import com.model.entities.Answer;
import com.model.entityModels.AnswerModel;
import com.model.mapper.AnswerMapper;
import com.repository.AnswerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service("answerService")
public class AnswerService implements IAnswerService{
    @Qualifier("answerRepository")
    private @Autowired
    AnswerRepository _answerRepository;

    @Override
    public List<AnswerModel> GetAll(int questionId) {

        return _answerRepository.findAnswerByQuestion_IdOrderById(questionId)
                .stream()
                .map(AnswerMapper::ToAnswerModel)
                .collect(Collectors.toList());
    }
}
