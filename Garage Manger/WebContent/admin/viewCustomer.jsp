<!DOCTYPE HTML>
<%@page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@include file="sidemenu.html" %>
<html>
<head>
<title>Customer View</title>
<link rel="stylesheet" href="css/table.css">
<style>
	#viewc {
	background-color : #d100d1;
	color:#d7e3fc;
}
</style>
</head>
<body>
<div class="content">
<div class="heading">
<h2>All Customer</h2>
</div>
<%
try {
	Connection con = ConnectionProvider.getCon();
	Statement statement = null;
	ResultSet rs = null;
	statement = con.createStatement();
	rs = statement.executeQuery("SELECT * from User");
%>
<TABLE cellpadding="15" >
<tr>
<td><b>C id</b></td>
<td><b>Name</b></td>
<td><b>Phone</b></td>
<td><b>Email</b></td>
<td><b>Address</b></td>
<td><b>City</b></td>
<td><b>State</b></td>
</tr>
<%
while (rs.next()) {
%>
<tr>
<td><%=rs.getString("U_id")%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(8)%></td>
</tr>
<% } %>
<%
// close all the connections.
rs.close();
statement.close();
con.close();
} catch (Exception ex) {
%>

<%
out.println("Unable to connect to database.");
}
%>
</TABLE>
<TABLE>
<TR>
<TD><FORM ACTION="adminHome.jsp" method="get" >
<button type="submit"><-- back</button></TD>
</TR>
</TABLE>
</div>
</body>
</html>