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

@WebServlet("/login")
public class loginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          String username = request.getParameter("username");
          String password = request.getParameter("password");
          System.out.println("username :"+username +" || password :"+password);
           
        try {
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserByEmailAndPassword(username, password);
            System.out.println("user : "+user); 
            if (user!=null) {
                  // Create a cookie with the user's information
               Cookie userCookie = new Cookie("username", user.getUsername());
              // Set the cookie's max age (in seconds) - you can customize this
                userCookie.setMaxAge(3600); // 1 hour
                  // Set the cookie's path - adjust as needed
                   userCookie.setPath("/");
                      // Add the cookie to the response
                    response.addCookie(userCookie);
              response.sendRedirect("page/services");  
              System.out.println(user.getUsername());          
            }
            else {
                   // Create a cookie with the user's information
               Cookie userCookie = new Cookie("loginFaild", "");
               // Set the cookie's max age (in seconds) - you can customize this
                 userCookie.setMaxAge(3600); // 1 hour
                   // Set the cookie's path - adjust as needed
                    userCookie.setPath("/");
                       // Add the cookie to the response
                     response.addCookie(userCookie);
              response.sendRedirect("page/login");  
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
          
    }
    
}
