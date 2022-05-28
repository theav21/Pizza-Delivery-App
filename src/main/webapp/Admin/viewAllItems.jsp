<%@ include file="adminHeader.jsp" %>
<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>

<div class = "container">
<%
	String msg=request.getParameter("msg");
	if("done".equals(msg)){
	%>
	<h1>Pizza Details modified!</h1>
	<%} %>
	<%
	if("undone".equals(msg)){
	%>
	<h1>Something went wrong!</h1>
	<%} %>
<table class="table" style="background-color:#fac664">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Pizza Name</th>
      <th scope="col">Category</th>
      <th scope="col">Price</th>
      <th scope="col">Store Id</th>
      <th scope="col">Image Id</th>
      <th scope="col">Modify</th>
    </tr>
  </thead>
  <tbody>
  <%
  try{
		Connection con=ConnectionDatabase.createConnection();
		Statement st=con.createStatement();
		Statement str = con.createStatement();
		ResultSet rs=st.executeQuery("select * from pizza_items");
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
    <tr>
      <th scope="row"><%=rs.getString(1) %></th>
      <td><%=rs.getString(2) %></td>
      <td><%=rs.getString(3) %></td>
      <td><%=rs.getString(4) %></td>
      <td><a href="viewItems.jsp?msg=<%= rs.getString(5) %>"><%=rs.getString(5) %></a></td>
      <td><a href="viewImages.jsp?id=<%= rs.getString(6) %>"><%=rs.getString(6) %></a></td>
      <td><a href="modifyPizza.jsp?id=<%= rs.getString(1) %>">Modify</a></td>
      
    </tr>
    <%
	}
	}catch(Exception e){
		System.out.print(e);
	}%>
  </tbody>
</table>
</div>