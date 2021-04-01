package com.services;


import com.model.entities.Account;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface IAccountService extends UserDetailsService{
    Account findByUsername(String username);
}
