package com.controllers;

import java.text.SimpleDateFormat;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.constant.AuthenManager;
import com.model.entityModels.AccountLoginModel;

@RequestMapping("/")
@Controller
public class BaseController {

	protected static SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

	protected String Admin_View(String viewName, ModelMap map) {
		map.put("Current_User", AuthenManager.Current_User);
		map.put("Current_Account", AuthenManager.Current_Account);
		return "admin/" + viewName;
	}

	protected String Student_View(String viewName, ModelMap map) {
		map.put("Current_User", AuthenManager.Current_User);
		map.put("Current_Account", AuthenManager.Current_Account);
		return "user/" + viewName;
	}

	protected String Redirect(String viewName) {
		return "redirect:/admin/" + viewName;
	}

	@RequestMapping(value = { "login" }, method = RequestMethod.GET)
	public String Login(ModelMap modelMap) {
		modelMap.put("account", new AccountLoginModel("", ""));
		return "shared/login/index";
	}

	@RequestMapping(value = { "dashboard" }, method = RequestMethod.GET)
	public String Dashboard(ModelMap modelMap) {
		
		if (AuthenManager.IsMod()) {
			return "redirect:admin/dashboard";
		}

		if (AuthenManager.IsStudent()) {
			return "redirect:student/dashboard";
		}

		return "redirect:shared/accessdenied";
	}
}
