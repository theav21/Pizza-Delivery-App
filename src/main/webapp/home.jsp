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
    
    <div class="menu row">
        <div class="heading">
            <h1>PIZZA</h1>
            <h3>&mdash; MENU &mdash; </h3>
        </div>
        <%String msg=request.getParameter("msg");
        if("exist".equals(msg)){
        %>
        <h2>Item is already in cart .<b>quantity increased</b> </h2>
        <%} %>
        <%
        if("added".equals(msg)){
        %>
        <h2>Item is added to cart!</h2>
        <%} %>
        <%
        if("invalid".equals(msg)){
        %>
        <h2>Something went Wrong!</h2>
        <%} %>
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

       
        <footer style="margin-top:20px">
            <p>Copyright &copy; 2022 Pizza Ordering Site</p>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
            crossorigin="anonymous"></script>
</body>

</html>