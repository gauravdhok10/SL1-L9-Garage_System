<!DOCTYPE HTML>
<%@page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@include file="sidemenu.html" %>

<html>
<head>
<title>Bill View</title>
<link rel="stylesheet" href="css/table.css">
<style>
	#viewb {
	background-color : #d100d1;
	color:#d7e3fc;
}
</style>
</head>
<body>
<div class="content">
<div class="heading">
<h2>All Bills</h2>
</div>
<%
try {
	Connection con = ConnectionProvider.getCon();
	Statement statement = null;
	ResultSet rs = null;
	statement = con.createStatement();
	rs = statement.executeQuery("SELECT * from Bill_Main");
%>
<TABLE cellpadding="15">
<tr>
<td><b>Bill Id</b></td>
<td><b>User Id</b></td>
<td><b>Vehical Id</b></td>
<td><b>Cost</b></td>
<td><b> Generated_Date</b></td>
<td><b>Status</b></td>
<td><b>Pay Id</b></td>
</tr>
<%
while (rs.next()) {
%>
<tr>
<td><%=rs.getString(1)%></td>
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
</TABLE><TABLE>
<TR>
<TD><FORM ACTION="adminHome.jsp" method="get" >
<button type="submit"><-- back</button></TD>
</TR>
</TABLE>
</div>
</body>
</html>