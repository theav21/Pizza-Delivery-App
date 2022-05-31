<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>
<html>
<head>
<title>Bill</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
<h2 style="text-align:center">Bill</h2>
<hr>
<table class="table" style="background-color:#fac664 ; margin:20px">
  <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Mobile Number</th>
      <th scope="col">Address</th>
      <th scope="col">State</th>
      <th scope="col">City</th>
      <th scope="col">Available Balance</th>
    </tr>
  </thead>
<%
String email = session.getAttribute("email").toString();
try
{
	int total=0;
	int sno=0;
	Connection con=ConnectionDatabase.createConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill'");
	while(rs.next())
	{
		total=rs.getInt(1);
	}
	ResultSet rs2=st.executeQuery("select * from users inner join cart where cart.email='"+email+"' and cart.status='bill'");
	while(rs2.next())
	{
		
%>
	
  <tbody>
  
    <tr>
    <%sno=sno+1; %>
      <th style="padding:10px" scope="row"><%=rs2.getString(1) %></th>
      <td style="padding:10px"><%=rs2.getString(3) %></td>
      <td style="padding:10px"><%=rs2.getString(5) %></td>
      <td style="padding:10px"><%=rs2.getString(6) %></td>
      <td style="padding:10px"><%=rs2.getString(7) %></td>
      <td style="padding:10px"><%=rs2.getString(8) %></td>
      <td style="padding:10px"><i class = "fa fa-inr"></i><%=rs2.getString(12) %></td>
    </tr>
    
    </tbody>
</table>

    
 <%
 break;
	 }
 %>
 	<table class="table" style="background-color:#fac664 ; margin:20px">
  <thead>
  
  <h2 style="text-align:center; margin-top:20px">TOTAL:<i class = "fa fa-inr"></i> <%out.println(total); %></h2>
  
 
    <tr>
      <th scope="col">S.no</th>
      <th scope="col">Product Name</th>
      <th scope="col">Category</th>
      <th scope="col">Price</th>
      <th scope="col">Quantity</th>
      <th scope="col">Sub Total</th>
    </tr>
  </thead>
  <%
  ResultSet rs1=st.executeQuery("select * from cart inner join pizza_items where cart.product_id=pizza_items.id and cart.email='"+email+"' and cart.status='bill' ");
  while(rs1.next())
  {
	  sno=sno+1;
  %>
   <tbody>
  
    <tr>
    <%sno=sno+1; %>
      <th style="padding:10px" scope="row"><%out.println(sno); %></th>
      <td style="padding:10px"><%=rs1.getString(17) %></td>
      <td style="padding:10px"><%=rs1.getString(18) %></td>
      <td style="padding:10px"><%=rs1.getString(19) %></td>
      <td style="padding:10px"><%=rs1.getString(3) %></td>
      <td style="padding:10px"><%=rs1.getString(5) %></td>
    </tr>
    <%} %>
    </tbody>
	</table>
	<br>
	<br>
	
	<div style="text-align:center">
	<a style="text-align:center" href ="continueShopping.jsp"><button class="btn btn-warning" >Continue Shopping</button></a>
 	</div>
 	<br>
	<br>
 <%

 }catch(Exception e){
 	System.out.println(e);
 }%>
   
  </div>
</body>
</html>