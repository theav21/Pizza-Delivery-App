<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>

<%
String email=session.getAttribute("email").toString();
String id=request.getParameter("id");
try
{

	Connection con = ConnectionDatabase.createConnection();
	Statement st= con.createStatement();
	st.executeUpdate("delete from pizza_items where id='"+id+"'");
	response.sendRedirect("viewAllItems.jsp?msg=removed");
	}
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("viewAllItems.jsp?msg=error");
	}
%>