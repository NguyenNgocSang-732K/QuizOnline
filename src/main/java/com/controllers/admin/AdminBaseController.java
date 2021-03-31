package com.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import com.model.entities.Account;
import com.services.IAccountService;

@RequestMapping("admin")
public class AdminBaseController {

	protected @Autowired IAccountService iAccountService;

	protected Account Current_User;

	protected String View(String viewName) {
		return "admin/" + viewName;
	}
}
