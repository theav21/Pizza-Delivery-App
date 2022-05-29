<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>

<% 
String id=request.getParameter("id");
String state=request.getParameter("state");
String city=request.getParameter("city");
String place=request.getParameter("place");
String phone=request.getParameter("phone");


try{
	Connection con=ConnectionDatabase.createConnection();
	PreparedStatement ps = con.prepareStatement("insert into stores values(?,?,?,?,?)");
	ps.setString(1,id);
	ps.setString(2,city);
	ps.setString(3,phone);
	ps.setString(4,state);
	ps.setString(5,place);
	
	
	
	
	ps.executeUpdate();
	response.sendRedirect("addNewStore.jsp?msg=done");
}
catch(Exception e){
	response.sendRedirect("addNewStore.jsp?msg=undone");
}
%>