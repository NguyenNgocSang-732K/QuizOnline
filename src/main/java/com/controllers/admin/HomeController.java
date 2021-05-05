package com.controllers.admin;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.constant.AuthenManager;
import com.model.entityModels.AccountLoginModel;

@Controller
public class HomeController extends AdminBaseController {
	@RequestMapping(value = { "dashboard" }, method = RequestMethod.GET)
	public String dashboard(ModelMap modelMap) {
        if(AuthenManager.Current_User!=null) {
			return View(AuthenManager.IsMod()?"admin/Dashboard":"student/Dashboard", modelMap);	
		}
		return Redirect("login", null);
	}
	
    @RequestMapping(value = {"login"}, method = RequestMethod.GET)
    public String Login(ModelMap modelMap) {
		/*
		 * BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(); String
		 * encodedPassword = passwordEncoder.encode("123");
		 * System.out.println(encodedPassword);
		 */
        modelMap.put("account", new AccountLoginModel("", ""));
        return "shared/login/index";
    }

    @RequestMapping(value = {"accessdenied"}, method = RequestMethod.GET)
    protected String AccessDenied(ModelMap modelMap) {
        modelMap.put("content", "401 - UnAuthorized");
        return "shared/error";
    }

    @RequestMapping(value = {"notfound"}, method = RequestMethod.GET)
    protected String NotFound(ModelMap modelMap) {
        modelMap.put("content", "404 - Not Found");
        return "shared/error";
    }
}
