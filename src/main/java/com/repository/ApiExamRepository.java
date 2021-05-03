package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.model.entities.Exam;
import com.model.entities.ExamQuestion;
import com.model.models.ApiExamModel;
import com.model.models.ApiLevelModel;

@Repository("examRepository")
public interface ApiExamRepository extends CrudRepository<Exam, Integer> {

//	@Query("select new com.model.models.ApiExamModel(id,code,name,status,createdDate,createdBy) from Exam where subject_Id=:subject_id")
//	public List<ApiExamModel> fetchAllExamBySubject(@Param("subject_id") int subject_id);
//
//	@Query("select new com.model.models.ApiExamModel(id,code,name,status,createdDate,createdBy) from Exam where id in (:listExamIds)")
//	public List<ApiExamModel> fetchAllExamByListIds(@Param("listExamIds") List<Integer> listExamIds);
//
//	@Query("select new com.model.models.ApiExamModel(id,code,name,status,createdDate,createdBy) from Exam where level_Id=:level_id")
//	public List<ApiExamModel> fetchAllExamByLevel(@Param("level_id") Integer level_id);
//
//	@Query("select new com.model.models.ApiExamModel(id,code,name,status,createdDate,createdBy) from Exam")
//	public List<ApiExamModel> fetchAllExamByLevel();
//
//	@Query("from Exam")
//	public List<Exam> fetchAll();

	// đếm số bài thi trong một môn
	@Query("select count(*) from Exam e where subject_Id=:subject_id")
	public Integer countExamInSubject(@Param("subject_id") Integer subject_id);

	// lấy danh sách những bài thi của môn đó
	@Query("from Exam where subject_Id=:subject_id")
	public List<Exam> getListExams(@Param("subject_id") Integer subject_id);

	// lấy danh sách những bài thi của môn đó theo id của nó
	@Query("from Exam where id=:id")
	public List<ApiExamModel> getExamsById(@Param("id") Integer id);
	
	@Query("from Exam where level_Id = :level_id and subject_Id = :subject_id and created_By = :created_by")
	public Exam checkExam(@Param("level_id") Integer level_id, @Param("subject_id") Integer subject_id,
			@Param("created_by") Integer created_by);
}
