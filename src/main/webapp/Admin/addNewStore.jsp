<%@page import="com.db.connection.ConnectionDatabase" %>
<%@ page import ="java.sql.*" %>
<%@ include file = "adminHeader.jsp" %>

<html>
<head>
<title>Add new Store</title>
</head>
<body>
<%
	String msg=request.getParameter("msg");
	if("done".equals(msg)){
	%>
	<h1>Store Added!</h1>
	<%} %>
	<%
	if("undone".equals(msg)){
	%>
	<h1>Something went wrong!</h1>
	<%} %>
	<%
	int id = 1;
	try{
		Connection con = ConnectionDatabase.createConnection();
		Statement st = con.createStatement();
		ResultSet rs=st.executeQuery("select max(id) from stores");
		while(rs.next())
		{
			id=rs.getInt(1);
			id=id+1;
		} 
	}
	catch(Exception e){
		System.out.print(e);
	}
	%>
	
	<div class="container">
	
	<form action="addNewStoreAction.jsp" method="post">
	<h1 style="text-align:center;margin-top:20px">Add New Store</h1>
	<h3 style="text-align:center;margin-top:50px">Store ID: <% out.println(id); %></h3>
		<input type="hidden" name="id" value="<%out.println(id); %>">
		<br>
		Enter City<input class="form-control form-control-lg"  type="text" name="city" placeholder="enter city" required>
		<br>
		Enter Phone Number<input class="form-control form-control-lg"  type="text" name="phone" placeholder="enter phone number" required>
		<br>
		<!-- Choose Image<input type="file" name="photo" size="50" > -->
		<input class="btn bg-dark text-light" type="submit" value="submit" >
	
	
	
	</form>
	
	</div>
</body>
</html>