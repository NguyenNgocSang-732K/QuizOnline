package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.model.entities.Exam;
import com.model.entities.ExamQuestion;
import com.model.entities.Question;
import com.model.models.ApiExamModel;
import com.model.models.ApiLevelModel;
import com.model.models.ApiQuestionExamModel;

@Repository("questionExamRepository")
public interface ApiQuestionExamRepository extends CrudRepository<ExamQuestion, Integer> {

	// lấy tất cả câu hỏi của bài thi đó
	@Query("from ExamQuestion where exam_Id = :exam_id")
	public List<ExamQuestion> getQuestion(@Param("exam_id") Integer exam_id);

	// đếm tất cả những câu hỏi của bài thi đó
	@Query("select count(*) from ExamQuestion where exam_Id = :exam_id")
	public Integer countTotalQuestion(@Param("exam_id") Integer exam_id);

	// lấy exam_question_id khi người dùng truyền vào
	@Query("select new com.model.models.ApiQuestionExamModel(id) from ExamQuestion where exam_Id = :exam_id and question_Id = :question_id")
	public ApiQuestionExamModel getQuestionExamId(@Param("exam_id") Integer exam_id,
			@Param("question_id") Integer question_id);
	
}
