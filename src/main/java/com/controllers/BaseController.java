package com.controllers;

import com.constant.AuthenManager;
import com.model.entityModels.AccountLoginModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.SimpleDateFormat;

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

    @RequestMapping(value = {"login"}, method = RequestMethod.GET)
    public String Login(ModelMap modelMap) {
        modelMap.put("account", new AccountLoginModel("", ""));
        return "shared/login/index";
    }

    @RequestMapping(value = {"dashboard"}, method = RequestMethod.GET)
    public String Dashboard(ModelMap modelMap) {

        if (AuthenManager.IsMod()) {
            return "redirect:admin/dashboard";
        }

        if (AuthenManager.IsStudent()) {
            return "redirect:student/dashboard";
        }

        return "redirect:/accessdenied";
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
