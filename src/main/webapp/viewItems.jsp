<%@ include file="header.jsp" %>
<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>



<%String msg2=request.getParameter("message");
if("added".equals(msg2)){
    %>
    <div class="alert alert-success alert-dismissible fade show" style="position:absolute;z-index:2;left:0px" role="alert">
	  <strong>Item is added to cart!</strong> 
	  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
    <%} %>
    <%
        if("invalid".equals(msg2)){
        %>
        <div class="alert alert-danger alert-dismissible fade show" style="position:absolute;z-index:2;left:0px" role="alert">
		  <strong>Something went Wrong!</strong>
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
        <%} %>
        <%
        if("exist".equals(msg2)){
        %>
        <div class="alert alert-danger alert-dismissible fade show" style="position:absolute;z-index:2;left:0px" role="alert">
		  <strong>Item already in cart!</strong>: Quantity increased
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
        <%} %>
<div class = "container">
<%
  int msg = Integer.parseInt(request.getParameter("msg"));
  String state=request.getParameter("state");
  String city=request.getParameter("city");
  String place =request.getParameter("place");
%>
<h2 style="margin-top:10px">Store ID : <%out.print(msg); %><h4 style="margin-bottom:30px"> <b>Address</b> : State: <%out.print(state); %>, City: <%out.print(city); %>, Place: <%out.print(place); %></h4></h2>

<table class="table" style="background-color:#fac664">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Pizza Name</th>
      <th scope="col">Category</th>
      <th scope="col">Price</th>
      <th scope="col">Add To Cart</th>
    
    </tr>
  </thead>
  <tbody>
  <%
  int i=0;
  try{
		Connection con=ConnectionDatabase.createConnection();
		Statement st=con.createStatement();
		Statement str = con.createStatement();
		ResultSet rs=st.executeQuery("select * from pizza_items where store_id='"+ msg +"'");
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
      <td><a href="addToCartAction2.jsp?id=<%= rs.getString(1) %>&msg=<%=msg%>">Add to cart</a></td>
      
    </tr>
     <%}
	   	if(i==0){ %>
    <tr>
        <td align="center" colspan="6">No Pizza Added</td>
    </tr>
    
    <%} %>
    <%
	
	}catch(Exception e){
		System.out.print(e);
	}%>
  </tbody>
</table>
</div>