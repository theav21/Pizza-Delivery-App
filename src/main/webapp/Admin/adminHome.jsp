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
	
	    <p class="card-text">City: <%=rs.getString(2) %> <br> Phone Number: <%=rs.getString(3) %></p>
	    
	    
	    <a href="viewItems.jsp?msg=<%=rs.getString(1) %>" class="btn btn-primary" style="background-color:#fac664 ; border-color:white">View Items In Store</a>
		<a href="viewItems.jsp?msg=<%=rs.getString(1) %>" class="btn btn-primary" style="background-color:#fac664 ; border-color:white">Modify</a>	  
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