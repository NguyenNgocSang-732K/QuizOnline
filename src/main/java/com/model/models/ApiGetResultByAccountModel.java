package com.model.models;

import java.util.List;

public class ApiGetResultByAccountModel {

	private List<ApiSubjectModel> subjects;
	private List<ApiExamModel> exams;

	public ApiGetResultByAccountModel(List<ApiSubjectModel> subjects, List<ApiExamModel> exams) {
		super();
		this.subjects = subjects;
		this.exams = exams;
	}

	public ApiGetResultByAccountModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public List<ApiSubjectModel> getSubjects() {
		return subjects;
	}

	public void setSubjects(List<ApiSubjectModel> subjects) {
		this.subjects = subjects;
	}

	public List<ApiExamModel> getExams() {
		return exams;
	}

	public void setExams(List<ApiExamModel> exams) {
		this.exams = exams;
	}

}
