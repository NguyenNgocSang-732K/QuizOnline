package com.configurations;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.model.entityModels.CurrentUserProfile;

public class BasicAuth implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Object user = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (!request.getRequestURI().equalsIgnoreCase("/admin/login")
				&& (user == null || user.toString().equalsIgnoreCase("anonymousUser") || user.toString().isEmpty())) {
			response.sendRedirect("/admin/login");
			return false;
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