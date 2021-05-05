package com.model.entityModels;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.model.entities.Subject;

public class QuestionModel {
	private Integer id;
	private String content;
	private Integer answerType;
	private String image;
	private BigDecimal score;
	private Date createdDate;
	private int createdBy;
	private boolean status;
	private LevelModel levelModel;
	private Subject subject;
	private List<AnswerModel> answerModels;

	public QuestionModel() {
	}

	public QuestionModel(Integer id, String content, Integer answerType, String image, BigDecimal score,
			Date createdDate, int createdBy, boolean status, LevelModel levelModel, Subject subject,
			List<AnswerModel> answerModels) {
		this.id = id;
		this.content = content;
		this.answerType = answerType;
		this.image = image;
		this.score = score;
		this.createdDate = createdDate;
		this.createdBy = createdBy;
		this.status = status;
		this.levelModel = levelModel;
		this.subject = subject;
		this.answerModels = answerModels;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public LevelModel getLevelModel() {
		return levelModel;
	}

	public void setLevelModel(LevelModel levelModel) {
		this.levelModel = levelModel;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public List<AnswerModel> getAnswerModels() {
		return answerModels;
	}

	public void setAnswerModels(List<AnswerModel> answerModels) {
		this.answerModels = answerModels;
	}

	public BigDecimal getScore() {
		return score;
	}

	public void setScore(BigDecimal score) {
		this.score = score;
	}
}
