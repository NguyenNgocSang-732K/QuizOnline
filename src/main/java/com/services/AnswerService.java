package com.services;

import com.constant.AnswerTypeEnum;
import com.constant.StatusEnum;
import com.model.entities.Answer;
import com.model.entities.Question;
import com.model.entityModels.AnswerInputModel;
import com.model.entityModels.AnswerModel;
import com.model.mapper.AnswerMapper;
import com.repository.AnswerRepository;
import com.repository.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service("answerService")
public class AnswerService implements IAnswerService {
    @Qualifier("answerRepository")
    private @Autowired
    AnswerRepository _answerRepository;

    @Qualifier("questionRepository")
    private @Autowired
    QuestionRepository _questionRepository;

    @Override
    public List<AnswerModel> GetAll(int questionId) {

        return _answerRepository.findAnswerByQuestion_IdOrderById(questionId)
                .stream()
                .map(AnswerMapper::ToAnswerModel)
                .collect(Collectors.toList());
    }

    @Override
    public AnswerModel GetById(int answerId) {

        Optional<Answer> optional = _answerRepository.findById(answerId);

        if (optional.isPresent()) {
            AnswerModel answerModel = AnswerMapper.ToAnswerModel(optional.get());

            return answerModel;
        }

        return null;
    }

    @Override
    public AnswerModel Save(int questionId, AnswerInputModel answerInputModel, int userId) {
        Question question = _questionRepository.findById(questionId).get();

        Answer answer = new Answer();
        answer.setId(answerInputModel.getAnswerId());
        answer.setContent(answerInputModel.getContent());
        answer.setQuestion(question);
        answer.setStatus(StatusEnum.VISIBLE.getKey());
        answer.setCreatedBy(userId);
        answer.setCreatedDate(new Date());

        List<Answer> answers = _answerRepository.findAnswerByQuestion_IdOrderById(questionId);

        if (answers.size() == 0) {
            answer.setIscorrect(true);
        } else {
            Answer answerOld = null;
            if (question.getAnswerType() == AnswerTypeEnum.RADIO.getKey() && answerInputModel.isCorrect()) {
                answerOld = answers.stream().filter(p -> p.isIscorrect()).findFirst().get();
                answerOld.setIscorrect(false);
                answer.setIscorrect(true);
                _answerRepository.save(answerOld);
            }else{
                answer.setIscorrect(answerInputModel.isCorrect());
            }
        }

        _answerRepository.save(answer);

        return AnswerMapper.ToAnswerModel(answer);
    }
}
