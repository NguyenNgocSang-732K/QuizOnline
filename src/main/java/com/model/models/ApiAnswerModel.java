package com.model.models;

import java.util.Date;
import java.util.List;

import com.model.entities.Question;

public class ApiAnswerModel {

	private Integer id;
	private String content;
	private boolean iscorrect;
	private Date createdDate;
	private int createdBy;
	private int status;

	private boolean isSelected;

	public ApiAnswerModel(Integer id, String content, boolean iscorrect, Date createdDate, int createdBy, int status) {
		super();
		this.id = id;
		this.content = content;
		this.iscorrect = iscorrect;
		this.createdDate = createdDate;
		this.createdBy = createdBy;
		this.status = status;
	}

	public ApiAnswerModel() {
		super();
		// TODO Auto-generated constructor stub
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

	public boolean getIscorrect() {
		return iscorrect;
	}

	public void setIscorrect(boolean iscorrect) {
		this.iscorrect = iscorrect;
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

	public boolean isSelected() {
		return isSelected;
	}

	public void setIsSelected(boolean isSelected) {
		this.isSelected = isSelected;
	}

}
