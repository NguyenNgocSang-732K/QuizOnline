package com.model.entityModels;

public class AccountLoginModel {
	private String username;
	private String password;

	public AccountLoginModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AccountLoginModel(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
