package com.repository;

import com.model.entities.Question;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("questionRepository")
public interface QuestionRepository extends JpaRepository<Question, Integer> {
    @Override
    Page<Question> findAll(Pageable pageable);

    Page<Question> findByContentContainingOrLevel_NameContaining(String searchContent,
                                                            String searchLevel, Pageable pageable);
}
