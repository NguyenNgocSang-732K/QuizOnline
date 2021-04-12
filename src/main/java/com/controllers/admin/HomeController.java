package com.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController extends AdminBaseController {
	@RequestMapping(value = { "dashboard" }, method = RequestMethod.GET)
	public String dashboard(ModelMap modelMap) {
		return View("Dashboard", modelMap);
	}
}
