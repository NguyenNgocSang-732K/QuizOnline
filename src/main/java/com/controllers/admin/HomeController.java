package com.controllers.admin;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model.models.LoginModel;

@Controller
public class HomeController extends AdminBaseController {

	@RequestMapping(value = { "login" }, method = RequestMethod.GET)
	public String Login(ModelMap modelMap) {
		LoginModel loginModel = new LoginModel("admin", "123");
		
//		String pw_hash = BCrypt.hashpw("123", BCrypt.gensalt());
//		System.out.println(pw_hash);
		UserDetails a =  iAccountService.loadUserByUsername("ngoctu");
		modelMap.put("loginModel", loginModel);
		return "account/admin/login";
	}

	@RequestMapping(value = { "dashboard" }, method = RequestMethod.GET)
	public String Index(ModelMap modelMap) {
		return View("home/dashboard");
	}

}
