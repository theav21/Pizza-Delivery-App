<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Font Awesome -->
  <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
  <script src="https://apis.google.com/js/platform.js" async defer></script>
  <!--CSS Script-->
  <link rel="stylesheet" href="css/style.css">

</head>

<body>
  <!--navbar Section-->
  <header>
    <nav class="navbar" style="background-color:#fac664">
      <input type="checkbox" id="check">
      <label for="check" class="checkbtn"><i class="fas fa-bars"></i></label>
      <img class="logo" src="img/logo.png" style="width: 10%;">
      <ul>
        <li class=" nav_item"><a href="index.jsp">Home</a></li>
        <li class="nav_item"><a href="Admin/adminLogin.jsp">ADMIN</a></li>
        <!-- <li class="nav_item"><a href="#">Announcement</a></li> -->
      </ul>
    </nav>
  </header>

  <div class="container sign-up-mode">

    <div class="forms_container">
      <div class="signin-signup">
        <form action="loginAction.jsp" class="sign-in-form">
          <h2 class="signin-title">Sign in</h2>
          <div class="input-field">
            <i class="fas fa-user"></i>
            <input type="email" name="email" placeholder="Enter Email" required>
          </div>
          <div class="input-field">
            <i class="fas fa-lock"></i>
            <input type="password" name="pass" placeholder="Password" required>
          </div>
          <input type="submit" value="Login" class="btn solid">
          <%
          String msg = request.getParameter("msg");
          if("notExist".equals(msg)){
          %>
          <h3 id="error" style="color: red" ></h3>
          <br>
          <p>Don't have an Account ?<a href="signup.jsp"><b> Signup<b></b></a><p>
          <%} %>
          <%
          if("invalids".equals(msg)){
          %>
          <h3 id="msg" style="color: red" >Error!</h3>
          <%} %>
        </form>

        <form method="post" action="signupAction.jsp" class="sign-up-form">
          <h2 class="signin-title">Sign up</h2>
          <div class="input-field">
            <i class="fas fa-file-signature"></i>
            <input type="text" name="fname" placeholder="First name" required>
          </div>
          <div class="input-field">
            <i class="fas fa-file-signature"></i>
            <input type="text" name ="lname" placeholder="Last Name" required>
          </div>
          <div class="input-field">
            <i class="fas fa-envelope"></i>
            <input type="text" name="email" placeholder="Email" required>
          </div>
          <div class="input-field">
            <i class="fas fa-mobile"></i>
            <input type="number" name="phonenum" placeholder="PhoneNumber" required>
          </div>
          <div class="input-field">
            <i class="fas fa-lock"></i>
            <input type="password" name="pass" placeholder="Password" required>
          </div>
          <input type="submit" value="Sign up" class="btn solid">
           <%
        if("valid".equals(msg)){
        %>
        <h3 id="msg" style="text-align: center; color:green">registered successfully</h3>
        <%} %>
        <% if("exist".equals(msg)){
        %>
        <h3 id="msg" style="text-align: center; color:red">Email is already registered!</h3>
       <%} %>
        <% if("invalid".equals(msg)){
        %>
        <h3 id="msg" style="text-align: center; color:red">Error!</h3>
       <%} %>
        </form>
       

      </div>
    </div>
    <div class="panels-container">
      <div class="panel left-panel">
        <div class="content">
          <h3>New here ?</h3>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quaerat, necessitatibus.</p>
          <button class="btn transparent" id="sign-up-btn">Sign up</button>
        </div>
        <img src="img/Pizza_Isometric.svg" class="image" alt="">
      </div>

      <div class="panel right-panel">
        <div class="content">
          <h3>One of us ?</h3>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quaerat, necessitatibus.</p>
          <button class="btn transparent" id="sign-in-btn">Sign in</button>
        </div>
        <img src="img/Pizza_Monochromatic.svg" class="image" alt="">
      </div>
    </div>
  </div>
  <script src="https://unpkg.com/scrollreveal"></script>
  <script>
  const sign_in_btn = document.querySelector("#sign-in-btn");
  const sign_up_btn = document.querySelector("#sign-up-btn");
  const container = document.querySelector(".container");

  sign_up_btn.addEventListener("click", () => {
    container.classList.add("sign-up-mode");
  });

  sign_in_btn.addEventListener("click", () => {
    container.classList.remove("sign-up-mode");
  });
  
  let msg = document.getElementById("msg");
  setTimeout(() => {
      msg.innerHTML = '';
  }, 2000);
  
  let err = document.getElementById("error");
  err.innerHTML = "You Entered Wrong Credentials";
  alert(err.innerHTML);
</script>



</body>