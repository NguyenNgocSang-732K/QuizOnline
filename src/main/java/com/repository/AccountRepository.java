package com.repository;

import com.model.entities.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("accountRepository")
public interface AccountRepository extends JpaRepository<Account, Integer> {

    public Account findByUsername(String username);

}
