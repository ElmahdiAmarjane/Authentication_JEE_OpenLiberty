<%@ page import="estm.dsic.jee.servlets.CheckCookiesUser" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body style="text-align: center;">
    <% 

        if (!CheckCookiesUser.isUserLoggedIn(request)) {
            CheckCookiesUser.redirectToLoginPage(response);
    }

    Cookie[] cookies = request.getCookies();
    String username = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                     username = cookie.getValue();
                    // Now you have the value of the "username" cookie
                    System.out.println("Username: " + username);
                    break;
                }
            }
        }
        %>
   <h1 style="font-family:sans-serif; font-size:50px;">welcome <span style="color: #974fda;" ><%= username %></span>  
    , navigate <span style="color: green;">
        anywhere</span></h1>
     <h1><a style="text-decoration: none;padding: 5px 20px; background-color: #b14e3a;color: white;cursor: pointer;" href="/web01/logout">logout</a></h1>
</body>
</html>