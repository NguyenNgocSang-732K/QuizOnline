package com.services.apiService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.entities.Account;
import com.model.models.ApiAccountModel;
import com.repository.apiRepository.ApiAccountRepository;

@Service("apiAccountService")
public class ApiAccountService implements IApiAccountService {

	private @Autowired ApiAccountRepository apiAccountRepository;

	@Override
	public Account getUserCheckLogin(String username) {
		return apiAccountRepository.getUserCheckLogin(username);
	}

	@Override
	public ApiAccountModel getAccountInfo(int id) {
		return apiAccountRepository.getAccountInfo(id);
	}

	@Override
	public int checkUsername(String username) {
		return apiAccountRepository.checkUsername(username);
	}

	@Override
	public Account changPassword(Account account) {
		return apiAccountRepository.save(account);
	}

	@Override
	public Account register(Account account) {
		return apiAccountRepository.save(account);
	}

	@Override
	public Integer checkAccount(Integer id) {
		return apiAccountRepository.checkAccount(id);
	}
	
}
