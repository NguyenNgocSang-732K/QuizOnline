package com.controllers.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.model.entityModels.CurrentUserProfile;

@Controller
public class AuthenticationController extends AdminBaseController {
	@RequestMapping(value = { "setAuthentication" }, method = RequestMethod.GET)
	public String SetAuthentication(HttpServletRequest request) {
		Current_User = (CurrentUserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Current_Account = iAccountService.FindById(Current_User.getId());
		RootPathImage = request.getSession().getServletContext().getRealPath("/uploads/images/");
		return Redirect("dashboard");
	}
}