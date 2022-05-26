<%@page import="com.db.connection.ConnectionDatabase" %>
<%@ page import ="java.sql.*" %>

<html>
<head>
<title>Add new Pizza</title>
</head>
<body>
	
	<%
	int id = 1;
	try{
		Connection con = ConnectionDatabase.createConnection();
		Statement st = con.createStatement();
		ResultSet rs=st.executeQuery("select max(id) from pizza");
		while(rs.next())
		{
			id=rs.getInt(1);
			id=id+1;
		}
	}
	catch(Exception e){
		
	}
	%>
	<form action="addNewPizzaAction" method="post">
	<h3 style="text-align:center;margin-top:100px">Pizza ID: <%out.println(id); %></h3>
	<input type="hidden" name="id" value="<%out.println(id); %>">
	<br>
	Enter Name<input type="text" name="name" placeholder="enter name" required>
	<br>
	Enter Category<input type="text" name="category" placeholder="enter Category" required>
	<br>
	Enter Price<input type="number" name="price" placeholder="enter price" required>
	<br>
	Choose Image<input type="file" name="photo" size="50" required>
	<input type="submit" value="submit" >
	</form>
	<%
	String msg=request.getParameter("msg");
	if("done".equals(msg)){
	%>
	<h1>Pizza Added!</h1>
	<%} %>
	<%
	if("undone".equals(msg)){
	%>
	<h1>Something went wrong!</h1>
	<%} %>
</body>
</html>