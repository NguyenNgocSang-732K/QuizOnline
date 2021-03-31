package com.controllers.user;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping({ "account" })
public class AccountController {
	
	@RequestMapping(value = { "index" }, method = RequestMethod.GET)
	public String index() throws IOException {
		return "user/student-account-edit/index";
	}
	
	@RequestMapping(value = { "login" }, method = RequestMethod.GET)
	public String login() throws IOException {
		return "shared/login/index";
	}
	
	@RequestMapping(value = { "register" }, method = RequestMethod.GET)
	public String register() throws IOException {
		return "shared/register/index";
	}
}
