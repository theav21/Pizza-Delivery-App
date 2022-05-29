<%@ include file="adminHeader.jsp" %>
<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>


<%
	String msg=request.getParameter("msg");
	if("done".equals(msg)){
	%>
	<div id="msg" class="alert alert-success alert-dismissible fade show" style="position:absolute;z-index:2;" role="alert">
		  <strong>Pizza Details Modified!</strong>
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	<%} %>
	<%
	if("undone".equals(msg)){
	%>
	<div id="msg" class="alert alert-success alert-dismissible fade show" style="position:absolute;z-index:2;" role="alert">
		  <strong>Something Went Wrong</strong>
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	<%} %>
	<%
	if("removed".equals(msg)){
	%>
	<div id="msg" class="alert alert-danger alert-dismissible fade show" style="position:absolute;z-index:2;" role="alert">
		  <strong>Pizza Removed From Database</strong>
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	<%} %>
	<%
	if("error".equals(msg)){
	%>
	<div id="msg" class="alert alert-danger alert-dismissible fade show" style="position:absolute;z-index:2;" role="alert">
		  <strong>Something Went Wrong!</strong>
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	<%} %>
	<div class = "container">
<table class="table" style="background-color:#fac664">
  <thead>
    <tr>
      <th scope="col">Pizza ID</th>
      <th scope="col">Pizza Name</th>
      <th scope="col">Category</th>
      <th scope="col">Price</th>
      <th scope="col">Store Id</th>
      <th scope="col">Image Id</th>
      <th scope="col">Modify</th>
       <th scope="col">Delete Items</th>
    </tr>
  </thead>
  <tbody>
  <%
  int i=0;
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
			i=i+1;
  %>
    <tr>
      <th scope="row"><%=rs.getString(1) %></th>
      <td><%=rs.getString(2) %></td>
      <td><%=rs.getString(3) %></td>
      <td><%=rs.getString(4) %></td>
      <td><a href="viewItems.jsp?msg=<%= rs.getString(5) %>"><%=rs.getString(5) %></a></td>
      <td><a href="viewImages.jsp?id=<%= rs.getString(6) %>"><%=rs.getString(6) %></a></td>
      <td><a href="modifyPizza.jsp?id=<%= rs.getString(1) %>">Modify</a></td>
      <td><a href="removeItems.jsp?id=<%= rs.getString(1) %>">Remove</a></td>
      
    </tr>
    <%} %>
   
    <%
	   	if(i==0){ %>
    <tr>
        <td align="center" colspan="8">No Pizza Added</td>
    </tr>
    
    <%} %>
    <%
	
	}catch(Exception e){
		System.out.print(e);
	}%>
  </tbody>
</table>
</div>