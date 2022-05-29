<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
</head>

<body>
    <!--navbar Section-->
    <%String msg=request.getParameter("msg");
        if("exist".equals(msg)){
        %>
        <div id="msg" class="alert alert-success alert-dismissible fade show" style="position:absolute;z-index:2;left:0px" role="alert">
		  <strong>Item is already in cart!</strong>Quantity Increased 
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
        <%} %>
        <%
        if("added".equals(msg)){
        %>
        <div class="alert alert-success alert-dismissible fade show" style="position:absolute;z-index:2;left:0px" role="alert">
		  <strong>Item is added to cart!</strong> 
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
        <%} %>
        <%
        if("invalid".equals(msg)){
        %>
        <div class="alert alert-danger alert-dismissible fade show" style="position:absolute;z-index:2;left:0px" role="alert">
		  <strong>Something went Wrong!</strong>
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
        <%} %>
    <div class="menu row" >
        <div class="heading">
        <div class="row align-items-center" >
        	<div class="col-9">
	            <h1>PIZZA</h1>
	            <h3>&mdash; MENU &mdash; </h3>
            </div>
            <div class="col-3">
            <h6>Search Below For Your Nearby Stores</h6>
             <form action="searchPage.jsp" method="post" class="d-flex m-3 " style="position:relative;padding-right:10px">
		        <input class="form-control me-2" type="search" name="search" placeholder="Enter location" aria-label="Search">
		        <button class="btn btn-outline-warning text-white" type="submit">Search</button>
	     	</form>
	     	</div>
	     </div>
        </div>
       
        <%
        try{
        	Connection con=ConnectionDatabase.createConnection();
        	Statement st = con.createStatement();
        	ResultSet rs=st.executeQuery("select * from pizza_items");
        	while(rs.next())
        	{
        %>
        <div class="food-items col-md-3 col-sm-4 col-lg-2">
            <img src="img/<%= rs.getString(6) %>.png">
            <div class="details">
                <div class="details-sub">
                	<h6>Item Id:<%=rs.getString(1) %></h6>
                	<br>
                    <h6>Name:<%=rs.getString(2) %></h6>
                    <br>
                    <h6>Category:<%=rs.getString(3) %></h6>
                    <br>
                    <h6>Price :&#8377 <%=rs.getString(4) %></h6>
                </div>
                <p>Store Id : <%=rs.getString(5) %></p>
                <button><a href="addToCartAction.jsp?id=<%= rs.getString(1) %>" >Add To Cart</a></button>
            </div>
        </div>
         
        <%
        }
        }
        catch(Exception e){
        	System.out.println(e);
        }%>
        </div>

      
    
        <footer>
            <p>Copyright &copy; 2022 Pizza Ordering Site</p>
        </footer>
       <!--  
        <script>
        
        let msg = document.getElementById("msg");
        setTimeout(() => {
            msg.innerHTML = `<div id="msg" class="alert alert-success alert-dismissible fade show" style="position:absolute;z-index:2;right:0px" role="alert">
		 
							</div> `
        }, 2000);</script> -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
            crossorigin="anonymous"></script>
</body>

</html>