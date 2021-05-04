package com.services.apiService;

import org.springframework.data.repository.query.Param;

import com.model.entities.Account;
import com.model.models.ApiAccountModel;

public interface IApiAccountService {

	Account getUserCheckLogin(String username);

	ApiAccountModel getAccountInfo(int id);

	int checkUsername(String username);

	Account changPassword(Account account);

	Account register(Account account);

	Integer checkAccount(Integer id);
}