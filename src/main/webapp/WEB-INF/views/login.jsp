<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap');
*
{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Quicksand', sans-serif;
}
.body 
{
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background: #000;
}
section 
{
  position: absolute;
  width: 100vw;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 2px;
  flex-wrap: wrap;
  overflow: hidden;
}

section .login
{
  position: absolute;
  width: 400px;
  background: #222;  
  z-index: 1000;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 40px;
  border-radius: 4px;
  box-shadow: 0 15px 35px rgba(0,0,0,9);
  margin-top: 75px;
}
section .login .content 
{
  position: relative;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  gap: 10px;
}
section .login .content h2 
{
  font-size: 2em;
  color: #0f0;
  text-transform: uppercase;
}
section .login .content .form 
{
  width: 100%;
  display: flex;
  flex-direction: column;
  gap: 25px;
}
section .login .content .form .inputBox
{
  position: relative;
  width: 100%;
}
section .login .content .form .inputBox input 
{
  position: relative;
  width: 100%;
  background: #333;
  border: none;
  outline: none;
  padding: 25px 10px 7.5px;
  border-radius: 4px;
  color: #fff;
  font-weight: 500;
  font-size: 1em;
}
section .login .content .form .inputBox i 
{
  position: absolute;
  left: 0;
  padding: 15px 10px;
  font-style: normal;
  color: #aaa;
  transition: 0.5s;
  pointer-events: none;
}
.login .content .form .inputBox input:focus ~ i,
.login .content .form .inputBox input:valid ~ i
{
  transform: translateY(-7.5px);
  font-size: 0.8em;
  color: #fff;
}
.login .content .form .links 
{
  position: relative;
  width: 100%;
  display: flex;
  justify-content: space-between;
}
.login .content .form .links a 
{
  color: #fff;
  text-decoration: none;
}
.login .content .form .links a:nth-child(2)
{
  color: #0f0;
  font-weight: 600;
}
.login .content .form .inputBox input[type="submit"]
{
  padding: 10px;
  background: #0f0;
  color: #000;
  font-weight: 600;
  font-size: 1.35em;
  letter-spacing: 0.05em;
  cursor: pointer;
}
input[type="submit"]:active
{
  opacity: 0.6;
}
</style>

<body>
    <jsp:include page="navbar.jsp" />
    <div class="body">

    
   

    <% 
        // Retrieve cookies
    Cookie[] cookies = request.getCookies();
        if(cookies!=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("username")){
                    response.sendRedirect("/web01/page/services");
                }
            }
        }

        %>
         <section>
            <div class="login">
              <div class="content">
                <h2>Log in</h2>
                <% 
                if(cookies!=null){
               for(Cookie cookie : cookies){
               if(cookie.getName().equals("loginFaild")){ 
                 %>
               <p style="color: #c5422d;">Username or password incorrect!</p>
               <% 
               // Set additional settings 
               cookie.setPath("/"); 
               cookie.setMaxAge(0);
               response.addCookie(cookie);
                break;
              } 
             } 
             } 
               
               %>
                
                <form action="/web01/login" method="post" class="form">
                  <div class="inputBox">
                    <input type="text" name="username" required /> <i>Username</i>
                  </div>
      
                  <div class="inputBox">
                    <input type="password" name="password" required /> <i>Password</i>
                  </div>
      
                  <div class="links"> 
                    <a href="#">Forgot Password</a> <a href="/web01/page/signup">Sign up</a>
                    
                  </div>
      
                  <div class="inputBox">
                    <input type="submit" value="Log in" />
                  </div>
                </form>
              </div>
            </div>
          </section>
        </div>
</body>
</html>