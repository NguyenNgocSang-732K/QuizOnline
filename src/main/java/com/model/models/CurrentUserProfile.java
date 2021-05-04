package com.model.models;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CurrentUserProfile implements UserDetails {

	private Collection<? extends GrantedAuthority> authorities;

	private int id;

	private String email;

	private String phone;

	private String password;

	private String username;

	private boolean status;

	private boolean credentialsNonExpired;

	private boolean enabled;

	private boolean accountNonExpired;

	private boolean accountNonLocked;

	public CurrentUserProfile() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CurrentUserProfile(Collection<? extends GrantedAuthority> authorities, int id, String email, String phone,
			String password, String username, Boolean status, boolean credentialsNonExpired, Boolean enabled,
			Boolean accountNonExpired, Boolean accountNonLocked) {
		super();
		this.authorities = authorities;
		this.id = id;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.username = username;
		this.status = status;
		this.credentialsNonExpired = credentialsNonExpired;
		this.enabled = enabled;
		this.accountNonExpired = accountNonExpired;
		this.accountNonLocked = accountNonLocked;
	}

//	@Override
//	public Collection<? extends GrantedAuthority> getAuthorities() {
//		// TODO Auto-generated method stub
//		return this.authorities;
//	}
//
//	@Override
//	public String getPassword() {
//		// TODO Auto-generated method stub
//		return this.password;
//	}
//
//	@Override
//	public String getUsername() {
//		// TODO Auto-generated method stub
//		return this.username;
//	}
//
//	@Override
//	public boolean isAccountNonExpired() {
//		// TODO Auto-generated method stub
//		return this.accountNonExpired;
//	}
//
//	@Override
//	public boolean isAccountNonLocked() {
//		// TODO Auto-generated method stub
//		return this.accountNonLocked;
//	}
//
//	@Override
//	public boolean isCredentialsNonExpired() {
//		// TODO Auto-generated method stub
//		return this.credentialsNonExpired;
//	}
//
//	@Override
//	public boolean isEnabled() {
//		// TODO Auto-generated method stub
//		return this.enabled;
//	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
		this.authorities = authorities;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setCredentialsNonExpired(boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public void setAccountNonExpired(boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}

	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return this.authorities;
	}

	public String getPassword() {
		// TODO Auto-generated method stub
		return this.password;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.username;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
}
