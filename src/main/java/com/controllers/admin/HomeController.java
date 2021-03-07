package com.controllers.admin;

import java.util.Date;
import java.util.HashSet;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model.entities.Account;
import com.model.entities.Classes;
import com.model.entities.Role;
import com.model.entities.RoleAccount;
import com.model.models.LoginModel;

@Controller
public class HomeController extends AdminBaseController {

	@RequestMapping(value = { "login" }, method = RequestMethod.GET)
	public String Login(ModelMap modelMap) {
		LoginModel loginModel = new LoginModel("username1", "");
		modelMap.put("loginModel", loginModel);
		return "account/admin/login";
	}

	@RequestMapping(value = { "dashboard" }, method = RequestMethod.GET)
	public String Index(ModelMap modelMap) {

//		Account account = new Account();
//		account.setBirthday(new Date());
//		account.setClasses(new Classes("Class test", new Date(), true));
//		account.setCreateDate(new Date());
//		account.setName("Account test");
//		account.setPassword("aaa");
//		account.setStatus(true);
//		HashSet<RoleAccount> roleAccounts = new HashSet<RoleAccount>();
//		roleAccounts.add(new RoleAccount(account, new Role("Role_test", false, new Date())));
//		account.setRoleAccounts(roleAccounts);
//		account.setUsername("username_test");
//		iAccountService.Save(account);
		return View("home/dashboard");
	}

}
