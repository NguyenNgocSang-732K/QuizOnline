package com.controllers.admin;

import com.model.entityModels.AccountLoginModel;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController extends AdminBaseController {

    @RequestMapping(value = {"login"}, method = RequestMethod.GET)
    public String Login(ModelMap modelMap) {
        modelMap.put("account", new AccountLoginModel("", ""));
        return "shared/login/index";
    }

    @RequestMapping(value = {"login"}, method = RequestMethod.POST)
    public String LoginProcess(@ModelAttribute(value = "account") AccountLoginModel accountLoginModel,
                               ModelMap modelMap, Authentication authentication) {
//		//--Pass admin
//		String pw_hash = BCrypt.hashpw("123", BCrypt.gensalt());
//		System.out.println(pw_hash);

        String adminName = authentication.getName();
        iAccountService.findByUsername(accountLoginModel.getUsername());
        return "shared/login/index";
    }

    @RequestMapping(value = {"dashboard"}, method = RequestMethod.GET)
    public String Index(ModelMap modelMap) {
        return View("home/dashboard");
    }

}
