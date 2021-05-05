package com.model.models;

import java.util.Date;

public class ApiSubjectModel {

	private Integer id;
	private String name;
	private Date createdDate;
	private int createdBy;
	private int status;
	private String image;
	private int totalExam;
	private int totalExamUserDone;

	public ApiSubjectModel(Integer id, String name, Date createdDate, int createdBy, int status, String image) {
		super();
		this.id = id;
		this.name = name;
		this.createdDate = createdDate;
		this.createdBy = createdBy;
		this.status = status;
		this.image = image;
	}

	public ApiSubjectModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public int getTotalExam() {
		return totalExam;
	}

	public void setTotalExam(int totalExam) {
		this.totalExam = totalExam;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getTotalExamUserDone() {
		return totalExamUserDone;
	}

	public void setTotalExamUserDone(int totalExamUserDone) {
		this.totalExamUserDone = totalExamUserDone;
	}

}
