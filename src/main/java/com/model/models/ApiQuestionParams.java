package com.model.models;

public class ApiQuestionParams {

	private Integer subject_id;
	private Integer level_id;

	public ApiQuestionParams() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ApiQuestionParams(Integer subject_id, Integer level_id) {
		super();
		this.subject_id = subject_id;
		this.level_id = level_id;
	}

	public Integer getSubject_id() {
		return subject_id;
	}

	public void setSubject_id(Integer subject_id) {
		this.subject_id = subject_id;
	}

	public Integer getLevel_id() {
		return level_id;
	}

	public void setLevel_id(Integer level_id) {
		this.level_id = level_id;
	}

}
