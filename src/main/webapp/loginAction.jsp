<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>

<%
	String email = request.getParameter("email");
	String pwd = request.getParameter("pass");
	int i = 0;
	try{
		Connection con = ConnectionDatabase.createConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from users where email ='"+email+"' and password='"+pwd+"' ");
		while(rs.next()){
			i=1;
			session.setAttribute("email",email);
			response.sendRedirect("home.jsp");
		}
		if(i==0)
			response.sendRedirect("signup.jsp?msg=notExist");
	}catch(Exception e){
		System.out.println(e);
		response.sendRedirect("signup.jsp?msg=invalid");
	}

%>