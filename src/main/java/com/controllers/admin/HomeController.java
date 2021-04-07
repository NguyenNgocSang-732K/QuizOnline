package com.controllers.admin;

import com.model.entityModels.AccountLoginModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController extends AdminBaseController {

    @RequestMapping(value = {"login"}, method = RequestMethod.GET)
    public String Login(ModelMap modelMap) {
        if (Current_User != null && Current_User.getId() > 0) {
            return "redirect:/admin/dashboard";
        }
//        --Pass admin
//		String pw_hash = BCrypt.hashpw("123", BCrypt.gensalt());
//		System.out.println(pw_hash);

        modelMap.put("account", new AccountLoginModel("", ""));
        return "shared/login/index";
    }

    @RequestMapping(value = {"dashboard"}, method = RequestMethod.GET)
    public String dashboard(ModelMap modelMap) {

        return "admin/Dashboard";
    }

//    @RequestMapping(value = {"dashboard"}, method = RequestMethod.GET)
//    public String Index(ModelMap modelMap) {
//        return View("home/Dashboard", modelMap);
//    }

}
