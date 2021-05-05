package com.services.apiService;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.model.entities.Exam;
import com.model.models.ApiExamModel;

public interface IApiExamService {

//	List<ApiExamModel> fetchAllExamBySubject(int subject_id);
//
//	List<ApiExamModel> fetchAllExamByListIds(List<Integer> listExamIds);
//
//	List<ApiExamModel> fetchAllExamByLevel(Integer level_id);
//
//	List<ApiExamModel> fetchAllExamByLevel();
//
//	List<Exam> fetchAll();

	//
	Integer countExamInSubject(Integer subject_id);

	List<Exam> getListExams(Integer subject_id);

	List<Exam> getExamsById(Integer id);

	Exam creatExam(Exam exam);

	Exam checkExam(Integer level_id, Integer subject_id, Integer created_by);
}
