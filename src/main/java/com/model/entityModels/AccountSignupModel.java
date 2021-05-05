package com.model.entityModels;

public class AccountSignupModel {
	private String username;
	private String fullname;
	private String email;
	private String password;

	public AccountSignupModel() {
		super();
	}

	public AccountSignupModel(String username, String fullname, String email, String password) {
		super();
		this.username = username;
		this.fullname = fullname;
		this.email = email;
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
