package com.services;

import com.model.entities.Question;
import com.model.entityModels.PaginationModel;
import com.model.entityModels.QuestionModel;
import com.model.mapper.QuestionMapper;
import com.repository.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service("questionService")
public class QuestionService implements IQuestionService {

    @Qualifier("questionRepository")
    private @Autowired
    QuestionRepository _questionRepository;

    @Override
    public PaginationModel<QuestionModel> GetAll(int page, int pageSize, String searchText) {

        // Declare pageable with page and pageSize
        Pageable paging = PageRequest.of(page, pageSize);


        Page<Question> pageTuts;

        // Find data with paging and searchText parameter
        if (searchText.isEmpty()) {
            pageTuts = _questionRepository.findAll(paging);
        } else {
            pageTuts = _questionRepository.findByContentContainingOrLevel_NameContaining(searchText, searchText,
                    paging);
        }

        List<QuestionModel> questionModels = pageTuts.getContent()
                .stream()
                .map(QuestionMapper::ToQuestionModel)
                .collect(Collectors.toList());

        PaginationModel<QuestionModel> paginationModel = new PaginationModel<QuestionModel>();
        paginationModel.setCurrentPage(pageTuts.getNumber());
        paginationModel.setData(questionModels);
        paginationModel.setTotalPages(pageTuts.getTotalPages());
        paginationModel.setTotalItems(pageTuts.getTotalElements());

        return paginationModel;
    }
}
