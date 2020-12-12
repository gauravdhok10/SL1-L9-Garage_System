<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobilenumber = request.getParameter("mobilenumber");
String password = request.getParameter("password");
String address ="";
String city ="";
String state ="";
try {
	Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("insert into User(U_name, U_phone ,U_email,U_pass,U_Address,U_City,U_State ) values(?,?,?,?,?,?,?);");
    ps.setString(1, name);
    ps.setString(2, mobilenumber);
    ps.setString(3, email);
    ps.setString(4, password );
    ps.setString(5, address);
    ps.setString(6, city);
    ps.setString(7, state);
    
    ps.executeUpdate();
    response.sendRedirect("signup.jsp?msg=valid");
}
	catch(Exception e) 
	{
		System.out.println(e);
		response.sendRedirect("signup.jsp?msg=invalid");
	}
%>