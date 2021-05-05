package com.model.viewModels;

import java.io.Serializable;

public class ExamSubmitModel implements Serializable{
	private int question_id;
	private int[] answer_ids;

	public ExamSubmitModel() {
		super();
	}

	public ExamSubmitModel(int question_id, int[] answer_ids) {
		super();
		this.question_id = question_id;
		this.answer_ids = answer_ids;
	}

	public int getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}

	public int[] getAnswer_ids() {
		return answer_ids;
	}

	public void setAnswer_ids(int[] answer_ids) {
		this.answer_ids = answer_ids;
	}

}
