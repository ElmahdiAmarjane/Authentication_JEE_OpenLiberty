<%@ page import="java.util.Objects" %>
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign up</title>
  <!--  <link rel="stylesheet" href="./../css/signup.css" /> -->
  </head>
  <style>
    @import url("https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap");
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Quicksand", sans-serif;
    }
    .body {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      background: #000;
    }
    section {
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

    section .signup {
      position: absolute;
      width: 400px;
      background: #222;
      z-index: 1000;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 40px;
      border-radius: 4px;
      box-shadow: 0 15px 35px rgba(0, 0, 0, 9);
      margin-top: 75px;
    }
  
    section .signup .content {
      position: relative;
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      gap: 10px;
    }
    section .signup .content h2 {
      font-size: 2em;
      color: #0f0;
      text-transform: uppercase;
    }
    section .signup .content .form {
      width: 100%;
      display: flex;
      flex-direction: column;
      gap: 25px;
    }
    section .signup .content .form .inputBox {
      position: relative;
      width: 100%;
    }
    section .signup .content .form .inputBox input {
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
    section .signup .content .form .inputBox i {
      position: absolute;
      left: 0;
      padding: 15px 10px;
      font-style: normal;
      color: #aaa;
      transition: 0.5s;
      pointer-events: none;
    }
    .signup .content .form .inputBox input:focus ~ i,
    .signup .content .form .inputBox input:valid ~ i {
      transform: translateY(-7.5px);
      font-size: 0.8em;
      color: #fff;
    }
    .signup .content .form .links {
      position: relative;
      width: 100%;
      display: flex;
      justify-content: space-between;
    }
    .signup .content .form .links a {
      color: #fff;
      text-decoration: none;
    }
    .signup .content .form .links a:nth-child(2) {
      color: #0f0;
      font-weight: 600;
    }
    .signup .content .form .inputBox input[type="submit"] {
      padding: 10px;
      background: #0f0;
      color: #000;
      font-weight: 600;
      font-size: 1.35em;
      letter-spacing: 0.05em;
      cursor: pointer;
    }
    input[type="submit"]:active {
      opacity: 0.6;
    }
    .errUserExists h1 {
      color: #c5422d;
    }
  </style>

  <body>
    <jsp:include page="navbar.jsp" />
    <div class="body">
      
    <section>
      <div class="signup">
        <div class="content">
          <h2>Sign Up</h2>
          <% Cookie[] cookies = request.getCookies();
           if(cookies!=null){
          for(Cookie cookie : cookies){
          if(cookie.getName().equals("userExists")){ 
            %>
          <p style="color: #c5422d;">User Already exist, try again</p>
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
          
          <form action="/web01/signup" method="post" class="form">
            <div class="inputBox">
              <input type="text" name="username" required /> <i>Username</i>
            </div>

            <div class="inputBox">
              <input type="password" name="password" required /> <i>Password</i>
            </div>

            <div class="links"> 
              <a href="/web01/page/login">Already have account </a> <a href="/web01/page/login">Log in</a>
            </div>

            <div class="inputBox">
              <input type="submit" value="sign up" />
            </div>
          </form>
        </div>
      </div>
    </section>
    
  </div>
  </body>
</html>
