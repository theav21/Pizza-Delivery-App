<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>

<% 
String id=request.getParameter("id");
String city=request.getParameter("city");
String phone=request.getParameter("phone");


try{
	Connection con=ConnectionDatabase.createConnection();
	PreparedStatement ps = con.prepareStatement("insert into stores values(?,?,?)");
	ps.setString(1,id);
	ps.setString(2,city);
	ps.setString(3,phone);
	
	
	
	
	ps.executeUpdate();
	response.sendRedirect("addNewStore.jsp?msg=done");
}
catch(Exception e){
	response.sendRedirect("addNewStore.jsp?msg=undone");
}
%>