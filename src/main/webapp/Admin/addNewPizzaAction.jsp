<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>


<%

String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
//String img=request.getParameter("img");




try{
	Connection con=ConnectionDatabase.createConnection();
	PreparedStatement ps = con.prepareStatement("insert into pizza values(?,?,?,?)");
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,category);
	ps.setString(4,price);
	
	
	
	ps.executeUpdate();
	response.sendRedirect("addNewPizza.jsp?msg=done");
}
catch(Exception e){
	response.sendRedirect("addNewPizza.jsp?msg=undone");
}
%>
