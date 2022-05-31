<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>

<%
String email=session.getAttribute("email").toString();
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String phoneNum = request.getParameter("phoneNum");
String creditCardNum = request.getParameter("cardnumber");
String expMonth = request.getParameter("expmonth");
String expYear = request.getParameter("expyear");
String status = "bill";
int total = Integer.parseInt(request.getParameter("total"));
int amount=0;
int left_amount=0;



try{
	Connection con = ConnectionDatabase.createConnection();
	
	Statement st = con.createStatement();
	ResultSet rs= st.executeQuery("select total_amount from users where email='"+email+"'");
	while(rs.next()){
		amount=rs.getInt(1);
		left_amount=amount-total;
	}
	PreparedStatement ps = con.prepareStatement("update users set address=?,state=?,city=?,credit_card_number=?,exp_month=?,exp_year=?,total_amount=? where email='"+email+"'");
	ps.setString(1,address);
	ps.setString(3,city);
	ps.setString(2,state);
	ps.setString(4,creditCardNum);
	ps.setString(5,expMonth);
	ps.setString(6,expYear);
	ps.setInt(7,left_amount);
	ps.executeUpdate();
	

	
	
	PreparedStatement ps1 = con.prepareStatement("update cart set address=?,city=?,state=?,mobile_number=?,status=? where email=? and address is NULL");
	ps1.setString(1,address);
	ps1.setString(2,city);
	ps1.setString(3,state);
	/* ps1.setString(4,country); */
	ps1.setString(4,phoneNum);
	/* ps1.setString(6,paymentMethod);
	ps1.setString(7,transactionId); */
	ps1.setString(5,status);
	ps1.setString(6,email);
	ps1.executeUpdate();
	response.sendRedirect("bill.jsp");
	
}
catch(Exception e){
		System.out.println(e);
}
%>

	
	