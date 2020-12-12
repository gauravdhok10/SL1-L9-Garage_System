<!DOCTYPE HTML>
<%@page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@include file="sidemenu.html" %>

<html>
<head>
<title>Vehical View</title>
<link rel="stylesheet" href="css/table.css">
<link rel="stylesheet" href="css/style.css">
<style>
	#viewb {
	background-color : #d100d1;
	color:#d7e3fc;
}
.head {
font-size:25px;
color:black;
padding:7px;
margin-bottom:4px;
width:100%;
background-color :#c266ff;
}
</style>
</head>
<body>
<div class="content">
<div class="heading">
<h2>Your Vehical</h2>
</div>
<%
String uid=session.getAttribute("userid").toString();
Connection con = ConnectionProvider.getCon();
Statement statement = null;
ResultSet rs = null;
PreparedStatement ps;

try {
	ps = con.prepareStatement("SELECT * from Vehical where U_id=?;");
	ps.setString(1, uid);
	rs =ps.executeQuery();
%>
<center>
<div class="head">Your Vehical</div>

<TABLE cellpadding="15" >
<tr>
<td><b>Vehical Id</b></td>
<td><b>User Id</b></td>
<td><b>Vehical No</b></td>
<td><b>Company</b></td>
<td><b> Model</b></td>
<td><b>color</b></td>
<td><b>DOEntry</b></td>
<td><b>DOExit</b></td>
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
<td><%=rs.getString(8)%></td>
</tr>
<% 
}
%>
</TABLE>
<%
} catch (Exception ex) {

out.println("Unable to connect to database.");
}
%>

</TABLE><TABLE>
<TR>
<TD><FORM ACTION="home.jsp" method="get" >
<button type="submit"><-- back</button></TD>
</TR>
</TABLE>
</center>
</div>
</body>
</html>