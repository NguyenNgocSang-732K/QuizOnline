package com.repository;

import com.model.entities.StudentAnswer;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository("studentAnswerRepository")
public interface StudentAnswerRepository extends JpaRepository<StudentAnswer, Integer> {
	@Query(nativeQuery = true, value = "SELECT * "
			+ "FROM student_answer "
			+ "WHERE	account_Id=:accountId "
			+ "AND		exam_question_Id=:examQuestionId")
	StudentAnswer FindStudentAnswerByAccountExamQuestion(@Param("accountId") int accountId,@Param("examQuestionId") int examQuestionId);
}
