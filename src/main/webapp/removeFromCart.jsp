<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>

<%
String email=session.getAttribute("email").toString();
String product_id=request.getParameter("id");
try
{

	Connection con = ConnectionDatabase.createConnection();
	Statement st= con.createStatement();
	st.executeUpdate("delete from cart where email='"+email+"' and product_id='"+product_id+"' and address is NULL");
	response.sendRedirect("cart.jsp?msg=removed");
	}
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("cart.jsp?msg=error");
	}
%>