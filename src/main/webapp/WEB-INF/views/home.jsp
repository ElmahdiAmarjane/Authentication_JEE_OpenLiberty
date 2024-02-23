<%@ page import="estm.dsic.jee.servlets.CheckCookiesUser" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%  
    if (!CheckCookiesUser.isUserLoggedIn(request)) {
        CheckCookiesUser.redirectToLoginPage(response);
}
%>
     <h1>Hello from Home</h1>
</body>
</html>