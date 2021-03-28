package com.application;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.infrashtructure.AccountRepository;
import com.model.constant.AccountTypeEnum;
import com.model.entities.Account;

@Service("accountService")
public class AccountService extends Services<Account, Integer> implements IAccountService {

	private @Autowired @Qualifier("accountRepository") AccountRepository accountRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		Account account = accountRepository.FindByUsername(username);

		if (account == null) {
			return null;
		}

		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		String role_name = AccountTypeEnum.getValue(account.getAccountType()).toString();
		roles.add(new SimpleGrantedAuthority(role_name));
		return new User(account.getUsername(), account.getPassword(), roles);
	}
}
