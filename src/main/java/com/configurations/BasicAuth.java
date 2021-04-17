package com.configurations;

import com.constant.AuthenManager;
import com.model.entityModels.CurrentUserProfile;
import com.services.IAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BasicAuth implements HandlerInterceptor {

    private @Autowired
    IAccountService iAccountService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        Object user = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        boolean userIsNull = user == null || user.toString().equalsIgnoreCase("anonymousUser")
                || user.toString().isEmpty();
        String currentURI = request.getRequestURI().toLowerCase();
        if (!userIsNull) {
            AuthenManager.Current_User = (CurrentUserProfile) SecurityContextHolder.getContext().getAuthentication()
                    .getPrincipal();
            AuthenManager.Current_Account = iAccountService.FindById(AuthenManager.Current_User.getId());
        }

        if (currentURI.startsWith("/resources")) {
            return true;
        }

        if (!currentURI.equalsIgnoreCase("/login")) {
            if (userIsNull) {
                response.sendRedirect("/login");
                return false;
            }
        } else {
            if (!userIsNull) {
                String area = AuthenManager.IsMod() ? "admin" : "student";
                response.sendRedirect("/" + area + "/dashboard");
                return false;
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        // System.out.println("Log postHandle");
        // System.out.println("Log 4: Host - " + request.getRemoteHost());
        // System.out.println("Log 4: Port - " + request.getRemotePort());
        // System.out.println("Log 4: User - " + request.getRemoteUser());
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // System.out.println("Log afterCompletion");
        // TODO Auto-generated method stub

    }

}