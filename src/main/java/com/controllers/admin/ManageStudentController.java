package com.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ManageStudentController extends AdminBaseController {

	@RequestMapping(value = { "ManageStudent" }, method = RequestMethod.GET)
	public String Index(ModelMap modelMap) {
		
		return View("student/index");
	}

}
