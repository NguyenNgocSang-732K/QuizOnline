package com.configurations;

import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.StringContent;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.constant.AuthenManager;
import com.model.entityModels.CurrentUserProfile;

public class BasicAuth implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Object user = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		boolean userIsNull = user == null || user.toString().equalsIgnoreCase("anonymousUser")
				|| user.toString().isEmpty();
		String currentURI = request.getRequestURI().toLowerCase();
		if(!userIsNull) {
			AuthenManager.Current_User = (CurrentUserProfile) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
		}
		if (!currentURI.equalsIgnoreCase("/admin/login")) {
			if (userIsNull) {
				response.sendRedirect("/admin/login");
				return false;
			}
		}else {
			if(!userIsNull) {
				response.sendRedirect("/admin/dashboard");
				return false;
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//System.out.println("Log postHandle");
		// System.out.println("Log 4: Host - " + request.getRemoteHost());
		// System.out.println("Log 4: Port - " + request.getRemotePort());
		// System.out.println("Log 4: User - " + request.getRemoteUser());
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		//System.out.println("Log afterCompletion");
		// TODO Auto-generated method stub

	}

}