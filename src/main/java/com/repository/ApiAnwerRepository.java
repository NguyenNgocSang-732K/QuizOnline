package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.model.entities.Answer;
import com.model.entities.StudentAnswer;
import com.model.models.ApiAnswerModel;
import com.model.models.ApiStudentAnswerModel;

@Repository("answerRepository")
public interface ApiAnwerRepository extends CrudRepository<Answer, Integer> {

	// đếm tất cả câu trả lời của câu hỏi đó
	@Query("select count(*) from Answer where question_Id = :question_id")
	public Integer countTotalAnswer(@Param("question_id") Integer question_id);

	// lấy câu hỏi mà người dùng đã trả lời
	@Query("from StudentAnswer sa where account_Id = :account_id and exam_question_Id = :exam_question_id")
	public List<StudentAnswer> userAnswer(@Param("account_id") Integer account_id,
			@Param("exam_question_id") Integer exam_question_id);

	// lấy tất cả danh sách các câu trả lời theo câu hỏi
	@Query("select new com.model.models.ApiAnswerModel(id,content,iscorrect,createdDate,createdBy,status) from Answer where question_Id = :question_id")
	public List<ApiAnswerModel> getAnswer(@Param("question_id") Integer question_id);
}
