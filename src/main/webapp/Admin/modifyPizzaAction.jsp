<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>


<% 
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String storeId = request.getParameter("store_id");
String imgId=request.getParameter("img_id");


try{
	Connection con=ConnectionDatabase.createConnection();
	Statement st = con.createStatement();
	st.executeUpdate("update pizza_items set name='"+name+"' , category='"+category+"' ,price='"+price+"' ,store_id='"+storeId+"' , pizza_img_id='"+imgId+"' where id='"+id+"'");
	
	
	response.sendRedirect("viewAllItems.jsp?msg=done");
}
catch(Exception e){
	response.sendRedirect("viewAllItems.jsp?msg=undone");
}
%>