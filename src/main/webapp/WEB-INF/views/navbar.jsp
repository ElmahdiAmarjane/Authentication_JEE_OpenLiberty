
<style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}
nav{
  position: fixed;
  z-index: 99;
  width: 100%;
  
  background: #242526;
}
nav .wrapper{
  position: relative;
  max-width: 1300px;
  padding: 0px 30px;
  height: 70px;
  line-height: 70px;
  margin: auto;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.wrapper .logo a{
  color: #f2f2f2;
  font-size: 30px;
  font-weight: 600;
  text-decoration: none;
}
.wrapper .nav-links{
  display: inline-flex;
}
.nav-links li{
  list-style: none;
}
.nav-links li a{
  color: #f2f2f2;
  text-decoration: none;
  font-size: 18px;
  font-weight: 500;
  padding: 9px 15px;
  border-radius: 5px;
  transition: all 0.3s ease;
}
.nav-links li a:hover{
  background: #3A3B3C;
}


.content .row header{
  color: #f2f2f2;
  font-size: 20px;
  font-weight: 500;
}



.wrapper .btn{
  color: #fff;
  font-size: 20px;
  cursor: pointer;
  display: none;
}
.wrapper .btn.close-btn{
  position: absolute;
  right: 30px;
  top: 10px;
}

@media screen and (max-width: 970px) {
  .wrapper .btn{
    display: block;
  }
  .wrapper .nav-links{
    position: fixed;
    height: 100vh;
    width: 100%;
    max-width: 350px;
    top: 0;
    left: -100%;
    background: #242526;
    display: block;
    padding: 50px 10px;
    line-height: 50px;
    overflow-y: auto;
    box-shadow: 0px 15px 15px rgba(0,0,0,0.18);
    transition: all 0.3s ease;
  }
  /* custom scroll bar */
  ::-webkit-scrollbar {
    width: 10px;
  }
  ::-webkit-scrollbar-track {
    background: #242526;
  }
  ::-webkit-scrollbar-thumb {
    background: #3A3B3C;
  }
  #menu-btn:checked ~ .nav-links{
    left: 0%;
  }
  #menu-btn:checked ~ .btn.menu-btn{
    display: none;
  }
  #close-btn:checked ~ .btn.menu-btn{
    display: block;
  }
  .nav-links li{
    margin: 15px 10px;
  }
  .nav-links li a{
    padding: 0 20px;
    display: block;
    font-size: 20px;
  }
  .content .row header{
    font-size: 19px;
  }
}
nav input{
  display: none;
}


</style>
<body>
       
<nav>
    <div class="wrapper">
      <div class="logo"><a href="#">JEE Training</a></div>
      <input type="radio" name="slider" id="menu-btn">
      <input type="radio" name="slider" id="close-btn">
      <ul class="nav-links">
        <label for="close-btn" class="btn close-btn"><i class="fas fa-times"></i></label>
        <li><a href="/web01/">Home</a></li>
        <li><a href="/web01/page/login">Log in</a></li>
       
        <li><a href="/web01/page/signup">Sign up</a></li>
      </ul>
      <label for="menu-btn" class="btn menu-btn"><i class="fas fa-bars"></i></label>
    </div>
  </nav>