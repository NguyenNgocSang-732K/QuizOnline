package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.entities.Exam;
import com.model.models.ApiExamModel;
import com.repository.ApiExamRepository;

@Service("apiExamService")
public class ApiExamService implements IApiExamService {

	private @Autowired ApiExamRepository apiExamRepository;

//	@Override
//	public List<ApiExamModel> fetchAllExamBySubject(int subject_id) {
//		return apiExamRepository.fetchAllExamBySubject(subject_id);
//	}
//
//	@Override
//	public List<ApiExamModel> fetchAllExamByListIds(List<Integer> listExamIds) {
//		return apiExamRepository.fetchAllExamByListIds(listExamIds);
//	}
//
//	@Override
//	public List<ApiExamModel> fetchAllExamByLevel(Integer level_id) {
//		return apiExamRepository.fetchAllExamByLevel(level_id);
//	}
//
//	@Override
//	public List<ApiExamModel> fetchAllExamByLevel() {
//		return apiExamRepository.fetchAllExamByLevel();
//	}
//
//	@Override
//	public List<Exam> fetchAll() {
//		return apiExamRepository.fetchAll();
//	}

	//
	@Override
	public Integer countExamInSubject(Integer subject_id) {
		return apiExamRepository.countExamInSubject(subject_id);
	}

	@Override
	public List<Exam> getListExams(Integer subject_id) {
		return apiExamRepository.getListExams(subject_id);
	}

	@Override
	public List<Exam> getExamsById(Integer id) {
		return getExamsById(id);
	}

	@Override
	public Exam creatExam(Exam exam) {
		return apiExamRepository.save(exam); 
	}

	@Override
	public Exam checkExam(Integer level_id, Integer subject_id, Integer created_by) {
		return apiExamRepository.checkExam(level_id, subject_id, created_by);
	}
}
