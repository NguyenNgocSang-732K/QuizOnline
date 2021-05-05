package com.services;


import com.model.entityModels.AccountModel;
import com.model.entityModels.PaginationModel;
import com.model.entityModels.SubjectModel;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.model.entities.Account;

public interface IAccountService extends UserDetailsService{
	
	public Account FindById(int id);
	
	public Account Save(Account account);

	PaginationModel<AccountModel> GetAll(int page, int pageSize, String searchText);

	boolean UpdateStatus(int accountId, boolean status);
}
