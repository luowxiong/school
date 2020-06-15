package com.luowx.utils;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.Cookie;

public class CookieUtils {

    public static Map<String, String> cookiesToMap(Cookie[] cookies) {
        Map<String, String> map = new HashMap<>();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                map.put(cookie.getName(), cookie.getValue());
            }
        }


        return map;
    }
}
