package com.repository;

import com.model.entities.AccountExam;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository("accountExamRepository")
public interface AccountExamRepository extends JpaRepository<AccountExam, Integer> {
	@Query(nativeQuery = true,value = "SELECT * FROM account_exam WHERE account_Id=:accountId")
	List<AccountExam> FindExamByAccount(@Param("accountId") int accountId);


	@Query(nativeQuery = true,value = "SELECT * FROM account_exam WHERE account_Id=:accountId AND exam_Id=:examId")
	AccountExam FindExamByAccountExam(@Param("accountId") int accountId,@Param("examId") int examId);
}
