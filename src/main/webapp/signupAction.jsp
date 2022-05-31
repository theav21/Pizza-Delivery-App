<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>
<%
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String phone = request.getParameter("phonenum");
    int i=0;
    int exp_month=0;
    int exp_year=0;
    int amount=0;
    String credit = "----";
    try {
        Connection con = ConnectionDatabase.createConnection();
        //Statement st = con.createStatement();
        Statement st = con.createStatement();
        ResultSet rs=st.executeQuery("select * from users");
        while(rs.next()){
        	if(email.equals(rs.getString(3))){
        		response.sendRedirect("signup.jsp?msg=exist");
        		i=1;
        		break;
        	}
        }
        if(i==0){
        PreparedStatement ps = con.prepareStatement("insert into users(first_name,last_name,email,password,phone,credit_card_number,exp_month,exp_year,total_amount) values (?,?,?,?,?,?,?,?,?)");
        ps.setString(1, fname);
        ps.setString(2, lname);
        ps.setString(3,email);
        ps.setString(4, pwd);
        ps.setString(5,phone);
        ps.setString(6,credit);
        ps.setInt(7,exp_month);
        ps.setInt(8,exp_year);
        ps.setInt(9,amount);

        ps.executeUpdate();
       	response.sendRedirect("signup.jsp?msg=valid");
        }
    } 
    catch (Exception e) {
        //Handle errors for Class.forName
        System.out.println(e);
        response.sendRedirect("signup.jsp?msg=invalid");
    }

%>