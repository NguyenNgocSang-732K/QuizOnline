package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.model.entities.AccountExam;
import com.model.entities.Exam;
import com.model.models.ApiExamModel;

@Repository("accountExamRepository")
public interface ApiAccountExamRepository extends CrudRepository<AccountExam, Integer> {

	@Query("select ae from AccountExam ae where account_Id=:account_id and exam_Id=:exam_id ")
	public AccountExam fetchAllExamOfAccount(@Param("account_id") int account_id, @Param("exam_id") int exam_id);

	@Query("select count(*) from AccountExam where account_Id=:account_id and status = 1 and score != null")
	public Integer countTotalExamUserDone(@Param("account_id") Integer account_id);

}
