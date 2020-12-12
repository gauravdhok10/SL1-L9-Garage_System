<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="sidemenu.html" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<link rel="stylesheet" href="css/style.css">
<style>
#db {
background-color : #d100d1;
	color:#d7e3fc;
}
</style>
</head>
<body>
<div class="content">
<nav>
<ul>
	<li><a href="account.jsp">Account</a></li>
	<li><a href="ulogout.jsp">Logout</a></li>
</ul>
</nav>
<%



String email=session.getAttribute("email").toString();
String name=null;
String id=null;
try {
	Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("select U_name,U_id from User where U_email=?;");
    ps.setString(1, email);
    ResultSet rs =ps.executeQuery();
    while(rs.next())
    {
    	name=rs.getString("U_name");
    	id=rs.getString("U_id");
    }
    session.setAttribute("userid",id);
    
    %>
    <center>Welcome <%out.println(name); %></center>
    <% 
}
	catch(Exception e) 
{
	System.out.println(e);
	response.sendRedirect("./login.jsp?msg=invalid");
}

%>


</div>
</body>
</html>