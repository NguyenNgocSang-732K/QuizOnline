package com.repository;

import com.model.entities.StudentAnswer;

import java.util.List;

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
	List<StudentAnswer> FindStudentAnswerByAccountExamQuestion(@Param("accountId") int accountId,@Param("examQuestionId") int examQuestionId);
	
	@Query(nativeQuery = true, value = "SELECT * "
			+ "FROM student_answer "
			+ "WHERE	account_Id=:accountId "
			+ "AND		exam_question_Id=:examQuestionId "
			+ "AND		answer_id=:answerId")
	List<StudentAnswer> FindStudentAnswerByAccountExamQuestionAnswer(@Param("accountId") int accountId,@Param("examQuestionId") int examQuestionId,@Param("answerId") int answerId);
	
}
