package com.infrashtructure;

import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.model.entities.Account;

@Primary
@Repository("accountRepository")
public interface AccountRepository extends IRepository<Account, Integer>{

	//using Security
	@Query("from Account where username=:username")
	public Account FindByUsername(@Param("username") String username);

	

}
