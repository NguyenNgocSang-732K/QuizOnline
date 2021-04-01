package com.services;

import com.constant.AccountTypeEnum;
import com.model.entities.Account;
import com.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("accountService")
public class AccountService implements IAccountService {

    private @Autowired
    @Qualifier("accountRepository")
    AccountRepository accountRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Account account = accountRepository.findByUsername(username);

        if (account == null) {
            return null;
        }

        List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
        String role_name = AccountTypeEnum.getValue(account.getAccountType()).toString();
        roles.add(new SimpleGrantedAuthority(role_name));
        return new User(account.getUsername(), account.getPassword(), roles);
    }

    @Override
    public Account findByUsername(String username) {
        return accountRepository.findByUsername(username);
    }
}
