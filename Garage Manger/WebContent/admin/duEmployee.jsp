<!DOCTYPE HTML>
<%@page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@include file="sidemenu.html" %>
<html>
<head>
<title>Employee Delete Update</title>
<link rel="stylesheet" href="css/table.css">
<style>
	#DUEmp {
	background-color : #d100d1;
	color:#d7e3fc;
}
</style>
</head>
<body>
<div class="content">
<div class="heading">
<h2>All Employee</h2>
</div>
<%
try {
	Connection con = ConnectionProvider.getCon();
	Statement statement = null;
	ResultSet rs = null;
	statement = con.createStatement();
	rs = statement.executeQuery("SELECT * from Employee");
%>
<TABLE cellpadding="15">
<tr>
<td><b>E id</b></td>
<td><b>Name</b></td>
<td><b>Email</b></td>
<td><b>Phone</b></td>
<td><b>Salary</b></td>
<td><b>Address</b></td>
<td><b>Date of Joining</b></td>
<td><b>Date of Birth</b></td>
<td><b>Delete</b></td>
<td><b>Update</b></td>
</tr>
<%
while (rs.next()) {
%>
<tr>
<td><%=rs.getString("E_id")%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(8)%></td>
<td>
	<a href='dEmployeeAction.jsp?d=<%=rs.getString("E_id")%>' class="btn btn-danger">Delete</a>
</td>
<td>
	<a href='uEmployeeAction.jsp?u=<%=rs.getString("E_id")%>' class="btn btn-warning">Update</a>
</td>
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