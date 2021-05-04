package com.repository;

import com.model.entities.ExamQuestion;
import com.model.entities.Level;
import com.model.entities.Question;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("examQuestionRepository")
public interface ExamQuestionRepository extends JpaRepository<ExamQuestion, Integer> {
	@Query(nativeQuery = true,value = "select e.* "
			+ "from exam_question eq, exam e, question q "
			+ "where	eq.exam_Id=e.id "
			+ "AND		eq.question_Id=q.id "
			+ "AND		e.id=:examId")
	List<Question> findQuestionByExamId(@Param("examId") int examId);
}
