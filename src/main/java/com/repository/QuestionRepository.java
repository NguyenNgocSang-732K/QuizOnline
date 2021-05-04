package com.repository;

import com.model.entities.Question;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("questionRepository")
public interface QuestionRepository extends JpaRepository<Question, Integer> {
	@Override
	Page<Question> findAll(Pageable pageable);

	Page<Question> findByContentContainingOrLevel_NameContainingOrderByIdAsc(String searchContent, String searchLevel,
			Pageable pageable);

	@Query(nativeQuery = true, value = "FindRandomQuestionBySubjectLevel @Subject_Id=:Subject_Id, @Level_Id=:Level_Id,@Quantity=:Quantity")
	List<Question> FindRandomQuestionBySubjectLevel(@Param("Subject_Id") int subjectId, @Param("Level_Id") int levelId,
			@Param("Quantity") int quantity);
	
	@Query(nativeQuery = true, value = "SELECT	q.* "
									+ "FROM	question q, exam_question eq "
									+ "WHERE	q.id = eq.question_Id "
									+ "AND		eq.exam_Id=:Exam_Id")
	List<Question> FindAllQuestionByExam(@Param("Exam_Id") int examId);
}
