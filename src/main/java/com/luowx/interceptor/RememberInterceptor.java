package com.luowx.interceptor;

import com.luowx.utils.CookieUtils;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;

public class RememberInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {

        HttpSession session = request.getSession();
        Cookie[] cookies = request.getCookies();
        Map<String, String> map =  CookieUtils.cookiesToMap(cookies);
        String userId = map.get("userId");
        String password = map.get("password");
        session.setAttribute("userId", userId);
        session.setAttribute("password", password);
        return true;
    }
}
