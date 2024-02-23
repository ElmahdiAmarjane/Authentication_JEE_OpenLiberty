package estm.dsic.jee.servlets;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
      
     @Override
     protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            // Retrieve cookies
    Cookie[] cookies = req.getCookies();

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("username")) {
                System.out.println("hello from cookies loop");
                // Delete the cookie by setting its age to 0
               
                // Set additional settings
                cookie.setPath("/");

                // Delete the cookie by setting its age to 0
                cookie.setMaxAge(0);
                resp.addCookie(cookie);
                break; // Break after finding the desired cookie
            }
        }
    }
          resp.sendRedirect("page/login");
     }
}
