<!DOCTYPE HTML>
<%@page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@include file="sidemenu.html" %>
<html>
<head>
<title>Employee & Service View</title>
<link rel="stylesheet" href="css/table.css">
<style>
	#views {
	background-color : #d100d1;
	color:#d7e3fc;
}
</style>
</head>
<body>
<div class="content">
<div class="heading">
<h2>All Service</h2>
</div>
<%
try {
	Connection con = ConnectionProvider.getCon();
	Statement statement = null;
	ResultSet rs = null;
	statement = con.createStatement();
	String QueryString = "SELECT * from Employee_service";
	rs = statement.executeQuery(QueryString);
%>
<TABLE cellpadding="15">
<tr>
<td><b>Employee Id</b></td>
<td><b>Service Id</b></td>
</tr>
<%
while (rs.next()) {
%>
<TR>
<TD><%=rs.getString(1)%></TD>
<TD><%=rs.getString(2)%></TD>
</TR>
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