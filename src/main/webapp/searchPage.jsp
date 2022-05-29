<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>
<%@ include file="header.jsp" %>
<div class="container">
<table class="table" style="background-color:#fac664">
  <thead>
    <tr>
      <th scope="col">Store ID</th>
      <th scope="col">State</th>
      <th scope="col">City</th>
      <th scope="col">Place</th>
      <th scope="col">Phone Number</th>
      <th scope="col">View Available Items</th>
    </tr>
  </thead>
  <tbody>
  <%
  int z=0;
  try{
	  	String search=request.getParameter("search");
		Connection con=ConnectionDatabase.createConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from stores where state like '%"+search+"%' or city_name like '%"+search+"%' or places like '%"+search+"%'");
		/* String sql = "select * from cities where name='" +rs.getString(2)+ "'";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rst = str.executeQuery(sql); */
		/* String s = rs.getString(2);
		PreparedStatement ps = con.prepareStatement("select * from cities where name=?");
	    ps.setString(1, s);
	   	ps.executeQuery(); */
		
		while(rs.next())
		{
			z=1;
  %>
    <tr>
      <th scope="row"><%=rs.getString(1) %></th>
      <td><%=rs.getString(4) %></td>
      <td><%=rs.getString(2) %></td>
      <td><%=rs.getString(5) %></td>
      <td><%=rs.getString(3) %></td>
      <td><a href="viewItems.jsp?msg=<%=rs.getString(1) %>&state=<%=rs.getString(4) %>&city=<%=rs.getString(2) %>&place=<%=rs.getString(5) %>">View Available Items</a></td>
      
      
    </tr>
    <%}
  }
  catch(Exception e){
	  System.out.println(e);
  }
	   %>
   
  </tbody>
</table>

<% if(z==0){%>
	<h1 style="color:white;text-align:center;">Nothing to show</h1>
<%}%>
</div>