package estm.dsic.jee.servlets;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckCookiesUser {
    public static boolean isUserLoggedIn(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    return true;
                }
            }
        }
        return false;
    }

    public static void redirectToLoginPage(HttpServletResponse response) throws IOException {
        response.sendRedirect("/web01/page/login");
    }
}
