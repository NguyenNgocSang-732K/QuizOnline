package com.application;


import org.springframework.security.core.userdetails.UserDetailsService;

import com.model.entities.Account;

public interface IAccountService extends UserDetailsService, IServices<Account, Integer>{
}
