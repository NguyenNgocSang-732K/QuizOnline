package com.services;


import org.springframework.security.core.userdetails.UserDetailsService;

import com.model.entities.Account;

public interface IAccountService extends UserDetailsService{
	
	public Account FindById(int id);
	
	public Account Save(Account account);
	
}
