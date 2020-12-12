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
	#viewpay {
	background-color : #d100d1;
	color:#d7e3fc;
}
</style>
</head>
<body>
<div class="content">
<div class="heading">
<h2>All Payment</h2>
</div>
<%
try {
	Connection con = ConnectionProvider.getCon();
	Statement statement = null;
	ResultSet rs = null;
	statement = con.createStatement();
	rs = statement.executeQuery("SELECT * from Payment");
%>
<TABLE cellpadding="15">
<tr>
<td><b>Pay Id</b></td>
<td><b>Pay Date</b></td>
<td><b>Pay Mode</b></td>
<td><b>Payment amount</b></td>
<td><b>Bill Id</b></td>
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