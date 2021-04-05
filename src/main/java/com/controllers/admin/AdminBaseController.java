package com.controllers.admin;

import com.model.entities.Account;
import com.model.entityModels.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.services.IAccountService;

@RequestMapping("admin")
public class AdminBaseController {

	protected @Autowired IAccountService iAccountService;

	protected Account Current_Account;

	protected CurrentUserProfile Current_User;

	protected String View(String viewName, ModelMap map) {
		map.put("currentUser", Current_User);
		return "admin/" + viewName;
	}

	protected String Redirect(String viewName) {
		return "redirect:/admin/" + viewName;
	}
}
