package com.services;

import com.model.entities.Answer;
import com.model.entities.Level;
import com.model.entities.Question;
import com.model.entityModels.PaginationModel;
import com.model.entityModels.QuestionModel;
import com.model.entityModels.QuestionUpdateModel;
import com.model.mapper.QuestionMapper;
import com.repository.AnswerRepository;
import com.repository.LevelRepository;
import com.repository.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service("questionService")
public class QuestionService implements IQuestionService {

    @Qualifier("questionRepository")
    private @Autowired
    QuestionRepository _questionRepository;

    @Qualifier("levelRepository")
    private @Autowired
    LevelRepository _levelRepository;

    @Qualifier("answerRepository")
    private @Autowired
    AnswerRepository _answerRepository;

    @Override
    public PaginationModel<QuestionModel> GetAll(int page, int pageSize, String searchText) {
        // Declare pageable with page and pageSize
        Pageable paging = PageRequest.of(page - 1, pageSize);
        Page<Question> pageTuts;

        // Find data with paging and searchText parameter
        if (searchText.isEmpty()) {
            pageTuts = _questionRepository.findAll(paging);
        } else {
            pageTuts = _questionRepository.findByContentContainingOrLevel_NameContainingOrderByIdAsc(searchText, searchText,
                    paging);
        }

        if (pageTuts.getTotalPages() == 0)
            return null;

        List<QuestionModel> questionModels = pageTuts.getContent()
                .stream()
                .map(QuestionMapper::ToQuestionModel)
                .collect(Collectors.toList());

        PaginationModel<QuestionModel> paginationModel = new PaginationModel<QuestionModel>();
        paginationModel.setCurrentPage(pageTuts.getNumber() + 1);
        paginationModel.setData(questionModels);
        paginationModel.setTotalPages(pageTuts.getTotalPages());
        paginationModel.setTotalItems(pageTuts.getTotalElements());

        return paginationModel;
    }

    @Override
    public QuestionUpdateModel findById(int questionId) {
        Optional<Question> question = _questionRepository.findById(questionId);

        return question.empty().isPresent() ? null :
                QuestionMapper.ToQuestionUpdateModel(question.get());
    }

    @Override
    public int UpdateQuestion(QuestionUpdateModel questionUpdate) {
        Level level = _levelRepository.findById(questionUpdate.getLevelModel().getId()).get();
        Question question = _questionRepository.findById(questionUpdate.getId()).get();
//        List<Answer> answers = _answerRepository.findAllById(questionUpdate.getAnswerUpdateModel());

        question.getAnswers().forEach(p -> p.setIscorrect(false));
        question.setLevel(level);

        for (int i: questionUpdate.getAnswerUpdateModel()) {
            question.getAnswers()
                    .stream()
                    .filter(p -> p.getId() == i)
                    .findFirst()
                    .get()
                    .setIscorrect(true);
        }

        question.setContent(questionUpdate.getContent());

        QuestionUpdateModel result = QuestionMapper.ToQuestionUpdateModel(_questionRepository.save(question));

        return result.getId();
    }
}
