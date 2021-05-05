package com.repository.apiRepository;

import java.util.Date;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.model.entities.Account;
import com.model.models.ApiAccountModel;

@Repository("apiAccountRepository")
public interface ApiAccountRepository extends CrudRepository<Account, Integer> {

	@Query("from Account where username=:username")
	public Account getUserCheckLogin(@Param("username") String username);

	// lấy thông tin của tài khoản
	@Query("select new com.model.models.ApiAccountModel(id,username,password,fullname,photo,email,phone,address,isActive,otp,accountType,createdBy,status) from Account where id=:id")
	public ApiAccountModel getAccountInfo(@Param("id") int id);

	@Query("select count(*) from Account where username=:username")
	public int checkUsername(@Param("username") String username);
	
	@Query("select count(*) from Account where id=:id")
	public Integer checkAccount(@Param("id") Integer id);

}
