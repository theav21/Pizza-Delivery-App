<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>

<%
String email=session.getAttribute("email").toString();
String id=request.getParameter("id");
try
{

	Connection con = ConnectionDatabase.createConnection();
	Statement st= con.createStatement();
	st.executeUpdate("delete from stores where id='"+id+"'");
	response.sendRedirect("adminHome.jsp?msg=removed");
	}
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("adminHome.jsp?msg=error");
	}
%>