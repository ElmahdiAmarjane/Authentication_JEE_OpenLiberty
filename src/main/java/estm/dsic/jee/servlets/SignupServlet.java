package estm.dsic.jee.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import estm.dsic.jee.dao.UserDAO;
import estm.dsic.jee.models.User;
@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        try {
            UserDAO userDAO = new UserDAO();
            if (userDAO.getUserByEmailAndPassword(username, password) != null) {
                Cookie userCookie = new Cookie("userExists", "");
                // Set the cookie's max age (in seconds) - you can customize this
                  userCookie.setMaxAge(3600); // 1 hour
                    // Set the cookie's path - adjust as needed
                     userCookie.setPath("/");
                        // Add the cookie to the response
                      resp.addCookie(userCookie);
                resp.sendRedirect("page/signup");   
            } else {
                userDAO.addUser(new User(username, password));
                Cookie userCookie = new Cookie("userNoExists", "");
                // Set the cookie's max age (in seconds) - you can customize this
                  userCookie.setMaxAge(3600); // 1 hour
                    // Set the cookie's path - adjust as needed
                     userCookie.setPath("/");
                        // Add the cookie to the response
                      resp.addCookie(userCookie);
                resp.sendRedirect("page/login");  
             
            }
        } catch (SQLException e) {
            // Handle SQLException appropriately for your application
            e.printStackTrace(); // Log or handle the exception
        }
    }
}