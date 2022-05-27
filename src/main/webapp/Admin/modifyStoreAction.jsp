<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>


<% 
String id=request.getParameter("id");
String city=request.getParameter("city");
String phone=request.getParameter("phone");


try{
	Connection con=ConnectionDatabase.createConnection();
	Statement st = con.createStatement();
	st.executeUpdate("update stores set city_name='"+city+"' , phone_num='"+phone+"' where id='"+id+"'");
	
	
	response.sendRedirect("adminHome.jsp?msg=done");
}
catch(Exception e){
	response.sendRedirect("adminHome.jsp?msg=undone");
}
%>