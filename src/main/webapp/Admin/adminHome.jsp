<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="adminHeader.jsp" %>
<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
<!-- <link rel="stylesheet" href="../css/style.css"> -->
</head>
<body>
<%
	String msg=request.getParameter("msg");
	if("done".equals(msg)){
	%>
	  <div id="msg" class="alert alert-success alert-dismissible fade show" style="position:absolute;z-index:2;" role="alert">
		  <strong>Store Modified!</strong>
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	<%} %>
	<%
	if("undone".equals(msg)){
	%>
	  <div id="msg" class="alert alert-success alert-dismissible fade show" style="position:absolute;z-index:2;" role="alert">
		  <strong>Something Went Wrong!</strong>
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	<%} %>
	<%
	if("removed".equals(msg)){
	%>
	<div id="msg" class="alert alert-success alert-dismissible fade show" style="position:absolute;z-index:2;" role="alert">
		  <strong>Removed</strong> 
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	<%} %>
	<%
	if("error".equals(msg)){
	%>
	<div id="msg" class="alert alert-success alert-dismissible fade show" style="position:absolute;z-index:2;" role="alert">
		  <strong>Error Occured!</strong> Remove all items from store before removing the store :
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	<%} %>
	<h1 style="text-align:center;margin:50px">Welcome Admin</h1>
	<div class = "container row">
	<h3 style="margin:20px">Pizza Store Details</h3>
	<%
	try{
		Connection con=ConnectionDatabase.createConnection();
		Statement st=con.createStatement();
		Statement str = con.createStatement();
		ResultSet rs=st.executeQuery("select * from stores");
		/* String sql = "select * from cities where name='" +rs.getString(2)+ "'";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rst = str.executeQuery(sql); */
		/* String s = rs.getString(2);
		PreparedStatement ps = con.prepareStatement("select * from cities where name=?");
	    ps.setString(1, s);
	   	ps.executeQuery(); */
		
		while(rs.next())
		{
	%>
	<div class="card col-4 m-3" style="width: 18rem;">
	  <div class="card-body">
	    <h5 class="card-title">Store ID : <%=rs.getString(1) %></h5>
		<h4>Address:</h4>
	    <p class="card-text">State: <%=rs.getString(4) %> <br> City: <%=rs.getString(2) %> <br>Place: <%=rs.getString(5) %> <br>  Phone Number: <%=rs.getString(3) %></p>
	    
	    
	    <a href="viewItems.jsp?msg=<%=rs.getString(1) %>&state=<%=rs.getString(4) %>&city=<%=rs.getString(2) %>&place=<%=rs.getString(5) %>" class="btn btn-primary" style="background-color:#fac664 ; border-color:white">View Items In Store</a>
		<a href="modifyStore.jsp?msg=<%=rs.getString(1) %>" class="btn btn-primary" style="background-color:#fac664 ; border-color:white">Modify</a>
		<a href="removeStore.jsp?id=<%=rs.getString(1) %>" class="btn btn-primary" style="background-color:#fac664 ; border-color:white">Remove</a>	  
	  </div>
	</div>
	<%
	}
	}catch(Exception e){
		System.out.print(e);
	}%>
	
	</div>
</body>
</html>