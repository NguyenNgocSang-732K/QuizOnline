package com.model.models;

import java.util.List;

public class ApiResultAnswerStudentModel {

	private Integer id;
	private Double score;
	private boolean iscorrect;
	private List<ApiAnswerModel> answerUser;
	private int createdBy;
	private int status;

	public ApiResultAnswerStudentModel() {
		super();
	}

	public ApiResultAnswerStudentModel(Integer id, Double score, boolean iscorrect, List<ApiAnswerModel> answerUser,
			int createdBy, int status) {
		super();
		this.id = id;
		this.score = score;
		this.iscorrect = iscorrect;
		this.answerUser = answerUser;
		this.createdBy = createdBy;
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public boolean isIscorrect() {
		return iscorrect;
	}

	public void setIscorrect(boolean iscorrect) {
		this.iscorrect = iscorrect;
	}

	public List<ApiAnswerModel> getAnswerUser() {
		return answerUser;
	}

	public void setAnswerUser(List<ApiAnswerModel> answerUser) {
		this.answerUser = answerUser;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
