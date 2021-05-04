package com.model.models;

public class ApiAnswersOfStudent {

	private Integer exam_id;
	private Integer question_id;
	private Integer answer_id;

	public ApiAnswersOfStudent(Integer exam_id, Integer question_id, Integer answer_id) {
		super();
		this.exam_id = exam_id;
		this.question_id = question_id;
		this.answer_id = answer_id;
	}

	public ApiAnswersOfStudent() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getExam_id() {
		return exam_id;
	}

	public void setExam_id(Integer exam_id) {
		this.exam_id = exam_id;
	}

	public Integer getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(Integer question_id) {
		this.question_id = question_id;
	}

	public Integer getAnswer_id() {
		return answer_id;
	}

	public void setAnswer_id(Integer answer_id) {
		this.answer_id = answer_id;
	}

}
