<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>
<%
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String phone = request.getParameter("phonenum");
    try {
        Connection con = ConnectionDatabase.createConnection();
        //Statement st = con.createStatement();
        PreparedStatement ps = con.prepareStatement("insert into users values (?,?,?,?,?)");
        ps.setString(1, fname);
        ps.setString(2, lname);
        ps.setString(3,email);
        ps.setString(4, pwd);
        ps.setString(5,phone);

        ps.executeUpdate();
       	response.sendRedirect("signup.jsp?msg=valid");

    } 
    catch (Exception e) {
        //Handle errors for Class.forName
        System.out.println(e);
        response.sendRedirect("signup.jsp?msg=invalid");
    }

%>