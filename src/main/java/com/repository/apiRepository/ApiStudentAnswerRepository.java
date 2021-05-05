package com.repository.apiRepository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.model.entities.StudentAnswer;
import com.model.entities.Subject;
import com.model.models.ApiSubjectModel;

@Repository("apiStudentAnswerRepository")
public interface ApiStudentAnswerRepository extends CrudRepository<StudentAnswer, Integer> {

//	@Query("from StudentAnswer")
//	public List<Subject> getAllSubjectInEntities();

	@Query("from StudentAnswer where account_Id = :account_id and exam_question_Id = :exam_question_Id")
	public StudentAnswer checkStudentAnswer(@Param("account_id") int account_id,
			@Param("exam_question_Id") int exam_question_Id);

	@Query("from StudentAnswer where account_Id = :account_id and exam_question_Id = :exam_question_Id")
	public List<StudentAnswer> getStudentAnswer(@Param("account_id") int account_id,
			@Param("exam_question_Id") int exam_question_Id);

	@Query("from StudentAnswer where exam_question_Id=:id")
	public List<StudentAnswer> removeStudentAnswer(@Param("id") int id);
	
}
