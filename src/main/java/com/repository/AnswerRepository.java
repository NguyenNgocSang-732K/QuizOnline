package com.repository;

import com.model.entities.Answer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("answerRepository")
public interface AnswerRepository extends JpaRepository<Answer, Integer> {
    List<Answer> findAnswerByQuestion_IdOrderById(int questionId);
}
