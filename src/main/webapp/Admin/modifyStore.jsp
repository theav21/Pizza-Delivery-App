<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>
<%@ include file ="adminHeader.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div class="container">
	<%
  	int msg = Integer.parseInt(request.getParameter("msg"));
	try{
		Connection con=ConnectionDatabase.createConnection();
		Statement st=con.createStatement();
		Statement str = con.createStatement();
		ResultSet rs=st.executeQuery("select * from stores where id='"+ msg +"'");
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
	<form action="modifyStoreAction.jsp" method="post">
	<h1 style="text-align:center;margin-top:20px">Modify Store Data</h1>
	<h3 style="text-align:center;margin-top:50px">Store ID: <% out.println(msg); %></h3>
		<input type="hidden" name="id" value="<%out.println(msg); %>">
		<br>
		Enter City<input class="form-control form-control-lg"  type="text"  name="city" value="<%=rs.getString(2) %>"  required>
		<br>
		Enter Phone Number<input class="form-control form-control-lg"  type="text" name="phone" value="<%=rs.getString(3)%>"  required>
		<br>
		<!-- Choose Image<input type="file" name="photo" size="50" > -->
		<input class="btn bg-dark text-light" type="submit" value="Modify" >
	
	
	
	</form>
	<%
	}
	}catch(Exception e){
		System.out.print(e);
	}%>
	
	</div>

</body>
</html>