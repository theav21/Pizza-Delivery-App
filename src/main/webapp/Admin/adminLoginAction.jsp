<%

String email = request.getParameter("email");
String password = request.getParameter("pass");

try{
	if("admin@gmail.com".equals(email) && "admin".equals(password)){
		session.setAttribute("email",email);
		response.sendRedirect("adminHome.jsp");
		
	}
	else{
		response.sendRedirect("adminLogin.jsp?msg=notExist");
	}
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("adminLogin.jsp?msg=invalid");
}
%>