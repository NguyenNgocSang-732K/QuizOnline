package com.controllers.user;

import com.constant.AuthenManager;
import java.text.SimpleDateFormat;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("student")
public class StudentBaseController {

	protected static SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

	protected String View(String viewName, ModelMap map) {
		map.put("Current_User", AuthenManager.Current_User);
		map.put("Current_Account", AuthenManager.Current_Account);
		return "user/" + viewName;
	}

	protected String Redirect(String viewName) {
		return "redirect:/user/" + viewName;
	}
}
