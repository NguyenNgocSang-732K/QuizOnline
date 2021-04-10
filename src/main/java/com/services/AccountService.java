package com.services;

import com.constant.AccountTypeEnum;
import com.constant.StatusEnum;
import com.model.entities.Account;
import com.model.entityModels.*;
import com.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service("accountService")
public class AccountService implements IAccountService {

	private @Autowired @Qualifier("accountRepository") AccountRepository accountRepository;

	@Override
	public CurrentUserProfile loadUserByUsername(String username) throws UsernameNotFoundException {

		Account account = accountRepository.findByUsername(username);

		if (account == null) {
			return null;
		}

		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		String role_name = AccountTypeEnum.getValue(account.getAccountType()).toString();
		roles.add(new SimpleGrantedAuthority(role_name));

		CurrentUserProfile currentUser = new CurrentUserProfile();

		currentUser.setAuthorities(roles);
		currentUser.setId(account.getId());
		currentUser.setEmail(account.getEmail());
		currentUser.setPhone(account.getPhone());
		currentUser.setUsername(account.getUsername());
		currentUser.setPassword(account.getPassword());
		currentUser.setStatus(StatusEnum.VISIBLE == StatusEnum.getValue(account.getStatus()));
		return currentUser;
	}

	@Override
	public Account FindById(int id) {
		// TODO Auto-generated method stub
		Optional<Account> account = accountRepository.findById(id);
		if (!account.isPresent()) {
			return null;
		}
		return account.get();
	}

	@Override
	public Account Save(Account edit) {
		// TODO Auto-generated method stub
		Account account = null;
		if (edit.getId() == 0) {
			edit.setCreatedDate(new Date());
			edit.setStatus(1);
			account = edit;
		} else {
			account = accountRepository.findById(edit.getId()).get();
			//--
			account.setUsername(account.getUsername());
			//--			
			account.setAccountType(edit.getAccountType());
			account.setAddress(edit.getAddress());
			account.setCreatedBy(edit.getCreatedBy());
			account.setEmail(edit.getEmail());
			account.setFullname(edit.getFullname());
			account.setIsActive(edit.getIsActive());
			account.setPhone(edit.getPhone());
			account.setPhoto(edit.getPhoto());
			account.setStatus(edit.getStatus());
		}

		return accountRepository.save(account);
	}
}
