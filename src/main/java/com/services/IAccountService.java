package com.services;


import org.springframework.security.core.userdetails.UserDetailsService;

import com.model.entities.Account;

public interface IAccountService extends UserDetailsService{
	
	public Account FindById(int id);
	
	public Account FindByUsername(String username);
	
	public Account Save(Account account);
	
}
