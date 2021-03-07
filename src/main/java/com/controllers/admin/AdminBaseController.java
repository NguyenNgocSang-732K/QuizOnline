package com.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import com.application.IAccountService;
import com.application.IClassesService;
import com.application.IRoleService;
import com.model.entities.Account;

@RequestMapping("admin")
public class AdminBaseController {

	protected @Autowired IAccountService iAccountService;

	protected @Autowired IRoleService iRoleService;

	protected @Autowired IClassesService iClassesService;

	protected Account Current_User;

	protected String View(String viewName) {
		return "admin/" + viewName;
	}
}
