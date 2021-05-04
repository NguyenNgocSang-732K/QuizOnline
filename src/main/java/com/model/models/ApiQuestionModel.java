package com.model.models;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class ApiQuestionModel {

	private Integer id;
	private String content;
	private Integer answerType;
	private String image;
	private Date createdDate;
	private int createdBy;
	private int status;
	private BigDecimal score;

	private int exam_id;

	private int totalAnswer;
//	private List<ApiAnswerModel> userAnswer;

	private List<ApiAnswerModel> answers;

	public ApiQuestionModel(Integer id, int exam_id, String content, Integer answerType, String image, Date createdDate,
			int createdBy, int status, BigDecimal score, int totalAnswer, List<ApiAnswerModel> answers) {
		super();
		this.id = id;
		this.exam_id = exam_id;
		this.content = content;
		this.answerType = answerType;
		this.image = image;
		this.createdDate = createdDate;
		this.createdBy = createdBy;
		this.status = status;
		this.score = score;
		this.totalAnswer = totalAnswer;
		this.answers = answers;
	}

	public ApiQuestionModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getExam_id() {
		return exam_id;
	}

	public void setExam_id(int exam_id) {
		this.exam_id = exam_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getAnswerType() {
		return answerType;
	}

	public void setAnswerType(Integer answerType) {
		this.answerType = answerType;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
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

	public BigDecimal getScore() {
		return score;
	}

	public void setScore(BigDecimal score) {
		this.score = score;
	}

	public int getTotalAnswer() {
		return totalAnswer;
	}

	public void setTotalAnswer(int totalAnswer) {
		this.totalAnswer = totalAnswer;
	}

	public List<ApiAnswerModel> getAnswers() {
		return answers;
	}

	public void setAnswers(List<ApiAnswerModel> answers) {
		this.answers = answers;
	}
}
