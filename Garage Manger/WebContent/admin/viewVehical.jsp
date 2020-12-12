<!DOCTYPE HTML>
<%@page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@include file="sidemenu.html" %>
<html>
<head>
<title>Employee View</title>
<link rel="stylesheet" href="css/table.css">
<style>
	#viewv {
	background-color : #d100d1;
	color:#d7e3fc;
}
</style>
</head>
<body>
<div class="content">
<div class="heading">
<h2>All Vehical</h2>
</div>
<%
try {
	Connection con = ConnectionProvider.getCon();
	Statement statement = null;
	ResultSet rs = null;
	statement = con.createStatement();
	rs = statement.executeQuery("SELECT * from Vehical");
%>
<TABLE cellpadding="15">
<tr>
<td><b>U id</b></td>
<td><b>Vehical No</b></td>
<td><b>V_Company</b></td>
<td><b>V_Model</b></td>
<td><b>V_color</b></td>
<td><b>Date of Entry</b></td>
<td><b>Date of Exit</b></td>
</tr>
<%
while (rs.next()) {
%>
<tr>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
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
</table><table>
<tr>
<td><form ACTION="adminHome.jsp" method="get" >
<button type="submit"><-- back</button></TD>
</tr>
</table>
</div>
</body>
</html>