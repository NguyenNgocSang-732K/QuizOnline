package com.model.models;

import java.util.Date;

public class ApiExamModel {

	private Integer id;
	private String code;
	private String name;
	private int status;
	private Date createdDate;
	private int createdBy;
	private double timeExam;

	private ApiLevelModel level;

	private double scoreExam;

	private boolean examDone;
	private int totalQuestion;
	private int totalQuestionTrue;

	private Integer subject_id;

	public ApiExamModel(Integer id, String code, String name, int status, Date createdDate, int createdBy,
			ApiLevelModel level, boolean examDone, int totalQuestion, int totalQuestionTrue, double scoreExam,
			double timeExam) {
		super();
		this.id = id;
		this.code = code;
		this.name = name;
		this.status = status;
		this.createdDate = createdDate;
		this.createdBy = createdBy;
		this.level = level;
		this.examDone = examDone;
		this.totalQuestion = totalQuestion;
		this.totalQuestionTrue = totalQuestionTrue;
		this.scoreExam = scoreExam;
		this.timeExam = timeExam;

	}

	public ApiExamModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
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

	public ApiLevelModel getLevel() {
		return level;
	}

	public void setLevel(ApiLevelModel level) {
		this.level = level;
	}

	public boolean isExamDone() {
		return examDone;
	}

	public void setExamDone(boolean examDone) {
		this.examDone = examDone;
	}

	public int getTotalQuestion() {
		return totalQuestion;
	}

	public void setTotalQuestion(int totalQuestion) {
		this.totalQuestion = totalQuestion;
	}

	public int getTotalQuestionTrue() {
		return totalQuestionTrue;
	}

	public void setTotalQuestionTrue(int totalQuestionTrue) {
		this.totalQuestionTrue = totalQuestionTrue;
	}

	public double getScoreExam() {
		return scoreExam;
	}

	public void setScoreExam(double scoreExam) {
		this.scoreExam = scoreExam;
	}

	public double getTimeExam() {
		return timeExam;
	}

	public void setTimeExam(double timeExam) {
		this.timeExam = timeExam;
	}

	public Integer getSubject_id() {
		return subject_id;
	}

	public void setSubject_id(Integer subject_id) {
		this.subject_id = subject_id;
	}

}
