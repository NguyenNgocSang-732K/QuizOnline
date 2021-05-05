package com.repository;

import com.model.entities.Exam;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("examRepository")
public interface ExamRepository extends JpaRepository<Exam, Integer> {
	@Query(nativeQuery = true, value = "FindExamBySubjectLevelAccount @Account_Id=:accountId, @Level_Id =:levelId, @Subject_Id=:subjectId")
	List<Exam> FindAllExamByLevelSubjectAccount(@Param("levelId") int levelId, @Param("subjectId") int subjectId, @Param("accountId") int accountId);
	
	@Query(nativeQuery = true,value = "SELECT e.* "
			+ "FROM 	account_exam ae,exam e "
			+ "WHERE	ae.exam_Id=e.id "
			+ "AND		ae.account_Id=:accountId")
	List<Exam> FindExamByAccount(@Param("accountId") int accountId); 
}
