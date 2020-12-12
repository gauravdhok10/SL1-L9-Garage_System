<!DOCTYPE HTML>
<%@page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@include file="sidemenu.html" %>

<html>
<head>
<title>Part View</title>
<link rel="stylesheet" href="css/table.css">
<style>
	#viewpart {
	background-color : #d100d1;
	color:#d7e3fc;
}
</style>
</head>
<body>
<div class="content">
<div class="heading">
<h2>All Parts</h2>
</div>
<%
try {
	Connection con = ConnectionProvider.getCon();
	Statement statement = null;
	ResultSet rs = null;
	statement = con.createStatement();
	rs = statement.executeQuery("SELECT * from Parts");
%>
<TABLE cellpadding="15">
<tr>
<td><b>Name</b></td>
<td><b>Brand</b></td>
<td><b>Price</b></td>
<td><b>Stock</b></td>
<td><b> Date of Purchase</b></td>

</tr>
<%
while (rs.next()) {
%>
<tr>
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
</TABLE><TABLE>
<TR>
<TD><FORM ACTION="adminHome.jsp" method="get" >
<button type="submit"><-- back</button></TD>
</TR>
</TABLE>
</div>
</body>
</html>