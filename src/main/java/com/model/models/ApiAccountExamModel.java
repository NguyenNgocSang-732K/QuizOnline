package com.model.models;

public class ApiAccountExamModel {

	private double score;
	private Integer totalQuestion;
	private Integer totalQuestionTrue;
	private Integer exam_id;

	public ApiAccountExamModel(double score, Integer totalQuestion, Integer totalQuestionTrue, Integer exam_id) {
		super();
		this.score = score;
		this.totalQuestion = totalQuestion;
		this.totalQuestionTrue = totalQuestionTrue;
		this.exam_id = exam_id;
	}

	public ApiAccountExamModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public Integer getTotalQuestion() {
		return totalQuestion;
	}

	public void setTotalQuestion(Integer totalQuestion) {
		this.totalQuestion = totalQuestion;
	}

	public Integer getTotalQuestionTrue() {
		return totalQuestionTrue;
	}

	public void setTotalQuestionTrue(Integer totalQuestionTrue) {
		this.totalQuestionTrue = totalQuestionTrue;
	}

	public Integer getExam_id() {
		return exam_id;
	}

	public void setExam_id(Integer exam_id) {
		this.exam_id = exam_id;
	}

}
