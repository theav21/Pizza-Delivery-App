<%@page import="com.db.connection.ConnectionDatabase" %>
<%@ page import ="java.sql.*" %>
<%@ include file = "adminHeader.jsp" %>

<html>
<head>
<title>Add new Pizza</title>
</head>
<body>
<%
	String msg=request.getParameter("msg");
	if("done".equals(msg)){
	%>
	  <div id="msg" class="alert alert-success alert-dismissible fade show" style="position:absolute;z-index:2;" role="alert">
		  <strong>Pizza is added!</strong>
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	<%} %>
	<%
	if("undone".equals(msg)){
	%>
	  <div id="msg" class="alert alert-danger alert-dismissible fade show" style="position:absolute;z-index:2;" role="alert">
		  <strong>Something Went Wrong !</strong>
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	<%} %>
	
	<%
	int id = 1;
	try{
		Connection con = ConnectionDatabase.createConnection();
		Statement st = con.createStatement();
		ResultSet rs=st.executeQuery("select max(id) from pizza_items");
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
	<form action="addNewPizzaAction.jsp" method="post">
	<h1 style="text-align:center;margin-top:20px">Add New Pizza</h1>
	<h3 style="text-align:center;margin-top:50px">Pizza ID: <% out.println(id); %></h3>
		<input type="hidden" name="id" value="<%out.println(id); %>">
		<br>
		Enter Name<input class="form-control form-control-lg"  type="text" name="name" placeholder="enter name" required>
		<br>
		Enter Category<input class="form-control form-control-lg"  type="text" name="category" placeholder="enter Category" required>
		<br>
		Enter Price<input class="form-control form-control-lg"  type="number" name="price" placeholder="enter price" required>
		<br>
		Enter Store ID<input class="form-control form-control-lg"  type="number" name="store_id" placeholder="enter store id" required>
		<!-- Choose Image<input type="file" name="photo" size="50" > -->
		<br>
		Enter Image ID<input class="form-control form-control-lg"  type="number" name="img_id" placeholder="enter image id" required>
		<br>
		<input class="btn bg-dark text-light" type="submit" value="add" >
	
	
	
	</form>
	</div>
</body>
</html>