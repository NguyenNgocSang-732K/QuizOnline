package com.controllers.admin;

import com.constant.AuthenManager;
import org.springframework.lang.Nullable;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;

public class AdminBaseController {

    protected static SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

    protected String View(String viewName, ModelMap map) {
        map.put("Current_User", AuthenManager.Current_User);
        map.put("Current_Account", AuthenManager.Current_Account);
        return "/" + viewName;
    }

    protected String Redirect(String viewName, @Nullable String optional) {
        return "redirect:/" + (optional == null ? viewName : (viewName + "?op=" + optional));
    }
}
