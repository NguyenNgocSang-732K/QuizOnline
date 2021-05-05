package com.repository.apiRepository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.model.entities.Question;

@Repository("apiQuestionRepository")
public interface ApiQuestionRepository extends CrudRepository<Question, Integer> {

	// lấy tất cả câu hỏi của bài thi
//	@Query("select q from ExamQuestion where id in (:list_ids_question)")
//	public List<ApiQuestionModel> getQuestion(@Param("list_ids_question") List<Integer> list_ids_question);

	@Query("select q from Question q where level_Id = :level_id and subject_Id = :subject_id")
	public List<Question> getQuestion(@Param("level_id") int level_id, @Param("subject_id") int subject_id);

}
