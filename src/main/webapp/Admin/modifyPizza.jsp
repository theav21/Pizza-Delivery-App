<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>
<%@ include file ="adminHeader.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modify Pizza</title>
</head>
<body>

<div class="container">
	<%
  	int id = Integer.parseInt(request.getParameter("id"));
	try{
		Connection con=ConnectionDatabase.createConnection();
		Statement st=con.createStatement();
		Statement str = con.createStatement();
		ResultSet rs=st.executeQuery("select * from pizza_items where id='"+ id +"'");
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
	
	<form action="addNewPizzaAction.jsp" method="post">
	<h1 style="text-align:center;margin-top:20px">Add New Pizza</h1>
	<h3 style="text-align:center;margin-top:50px">Pizza ID: <% out.println(id); %></h3>
		<input type="hidden" name="id" value="<%out.println(id); %>">
		<br>
		Enter Name<input class="form-control form-control-lg"  type="text" name="name" value="<%=rs.getString(2) %>" required>
		<br>
		Enter Category<input class="form-control form-control-lg"  type="text" name="category" value="<%=rs.getString(3) %>" required>
		<br>
		Enter Price<input class="form-control form-control-lg"  type="number" name="price" value="<%=rs.getString(4) %>" required>
		<br>
		Enter Store ID<input class="form-control form-control-lg"  type="number" name="store_id" value="<%=rs.getString(5) %>" required>
		<!-- Choose Image<input type="file" name="photo" size="50" > -->
		<br>
		Enter Image ID<input class="form-control form-control-lg"  type="number" name="img_id" value="<%=rs.getString(6) %>" required>
		<br>
		<input class="btn bg-dark text-light" type="submit" value="submit" >
	
	
	
	</form>
	
	<%
	}
	}catch(Exception e){
		System.out.print(e);
	}%>
	
	</div>

</body>
</html>