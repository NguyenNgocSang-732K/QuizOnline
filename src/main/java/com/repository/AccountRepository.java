package com.repository;

import com.model.entities.Account;
import com.model.entities.Question;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("accountRepository")
public interface AccountRepository extends JpaRepository<Account, Integer> {
    Account findByUsername(String username);

    Page<Account> findByUsernameContainingOrFullnameContainingOrEmailContainingOrPhoneContaining(String searchUserName,
                                                                                                 String searchFullname,
                                                                      String searchEmail, String searchPhone, Pageable pageable);
}
