<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <!--CSS Script-->
    <link rel="stylesheet" href="css/menu.css">
	<link href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" rel="stylesheet" />
</head>

<body>
<header>
        <nav class="navbar">
        
        <%String email=(String)session.getAttribute("email"); %>
            <!-- <input type="checkbox" id="check"> -->
            <!-- <label for="check" class="checkbtn"><i class="fas fa-bars"></i></label> -->
            <img class="logo" src="img/output-onlinepngtools (10).png" style="width: 10%;">
            <ul>
            	<li class=" nav_item"><%out.println(email);%></li>
                <li class=" nav_item"><a href="home.jsp">Home</a></li>
                <li class="nav_item"><a href="searchPage2.jsp">Store</a></li>
                <li class="nav_item"><a href="cart.jsp">cart</a></li>
                <li class="nav_item"><a href="logout.jsp">logout</a></li>
                
            </ul>
           
	     	
        </nav>
    </header>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
        crossorigin="anonymous"></script>
</body>
</html>