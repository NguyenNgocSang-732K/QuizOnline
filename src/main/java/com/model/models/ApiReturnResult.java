package com.model.models;

import java.util.List;

public class ApiReturnResult {
	private int statucCode;
	private List<? extends Object> data;
	private String statusMessage;

	public ApiReturnResult() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ApiReturnResult(int statucCode, List<Object> data, String statusMessage) {
		super();
		this.statucCode = statucCode;
		this.data = data;
		this.statusMessage = statusMessage;
	}

	public int getStatucCode() {
		return statucCode;
	}

	public void setStatucCode(int statucCode) {
		this.statucCode = statucCode;
	}

	public List<? extends Object> getData() {
		return data;
	}

	public void setData(List<? extends Object> data) {
		this.data = data;
	}

	public String getStatusMessage() {
		return statusMessage;
	}

	public void setStatusMessage(String statusMessage) {
		this.statusMessage = statusMessage;
	}

}
