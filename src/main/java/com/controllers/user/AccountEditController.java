package com.controllers.user;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping({ "accountEdit" })
public class AccountEditController {
	
	@RequestMapping(value = { "index" }, method = RequestMethod.GET)
	public String index() throws IOException {
		return "user/student-account-edit/index";
	}
	
	@RequestMapping(value = { "login" }, method = RequestMethod.GET)
	public String login() throws IOException {
		return "user/login/index";
	}
}
