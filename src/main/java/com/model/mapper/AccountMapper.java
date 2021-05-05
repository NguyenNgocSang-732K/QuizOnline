package com.model.mapper;

import com.constant.AccountTypeEnum;
import com.constant.StatusEnum;
import com.model.entities.Account;
import com.model.entityModels.CurrentUserProfile;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.ArrayList;
import java.util.List;

public class AccountMapper {
	public static CurrentUserProfile ToCurrentUserProfile(Account account) {

		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		String role_name = AccountTypeEnum.getKey(account.getAccountType()).getValue();
		roles.add(new SimpleGrantedAuthority(role_name));

		CurrentUserProfile currentUser = new CurrentUserProfile();
		currentUser.setAuthorities(roles);
		currentUser.setId(account.getId());
		currentUser.setEmail(account.getEmail());
		currentUser.setPhone(account.getPhone());
		currentUser.setPhoto(
				(account.getPhoto() == null || account.getPhoto().isEmpty()) ? "LearnPlus.png" : account.getPhoto());
		currentUser.setUsername(account.getUsername());
		currentUser.setPassword(account.getPassword());
		currentUser.setStatus(StatusEnum.VISIBLE == StatusEnum.getKey(account.getStatus()));

		return currentUser;
	}
}
