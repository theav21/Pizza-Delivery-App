
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
  <link rel="stylesheet" href="../css/style.css">

</head>

<body class="adminpage">
  <!--navbar Section-->
  <header>
    <nav class="navbar">
      <input type="checkbox" id="check">
      <label for="check" class="checkbtn"><i class="fas fa-bars"></i></label>
      <img class="logo" src="../img/logo.png" style="width: 10%;">
      <ul>
        <li class=" nav_item"><a href="../index.jsp">Home</a></li>
        <li class="nav_item"><a href="index.html">ADMIN</a></li>
        <!-- <li class="nav_item"><a href="#">Announcement</a></li> -->
      </ul>
    </nav>
  </header>

  <div class="Acontainer Asign-up-mode">

    <div class="Aforms_container">
      <div class="Asignin-signup" style="margin-top:200px">
        <form action="adminLoginAction.jsp" class="Asign-in-form">
          <h2 class="Asignin-title">Admin Sign In</h2>
          <div class="input-field">
            <i class="fas fa-user"></i>
            <input type="email" name="email" placeholder="Email" required>
          </div>
          <div class="input-field">
            <i class="fas fa-lock"></i>
            <input type="password" name="pass" placeholder="Password" required>
          </div>
          <input type="submit" value="Login" class="btn solid">
          <br>
          <%
          String msg = request.getParameter("msg");
          if("notExist".equals(msg)){
          %>
          <h4 style="color:red">Your admin email or password is incorrect!</h4>
          <%} %>
        </form>
      </div>
    </div>
  

</body>