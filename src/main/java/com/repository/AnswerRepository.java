package com.repository;

import com.model.entities.Answer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("answerRepository")
public interface AnswerRepository extends JpaRepository<Answer, Integer> {
}
