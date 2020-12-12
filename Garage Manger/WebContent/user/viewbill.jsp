<!DOCTYPE HTML>
<%@page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@include file="sidemenu.html" %>

<html>
<head>
<title>Bill View</title>
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
<h2>All Bills</h2>
</div>
<%
String uid=session.getAttribute("userid").toString();
Connection con = ConnectionProvider.getCon();
Statement statement = null;
ResultSet rs = null;
PreparedStatement ps;

try {
	ps = con.prepareStatement("SELECT * from Bill_Main where U_id=? and Status='Not Paid';");
	ps.setString(1, uid);
	rs =ps.executeQuery();
%>
<center>
<div class="head">Due Bill</div>

<TABLE cellpadding="15" >
<tr>
<td><b>Bill Id</b></td>
<td><b>User Id</b></td>
<td><b>Vehical Id</b></td>
<td><b>Cost</b></td>
<td><b> Generated_Date</b></td>
<td><b>Status</b></td>
<td><b>Pay Id</b></td>
<td><b>Pay</b></td>
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

<td>
<a href='paybill.jsp?p=<%=rs.getString("B_id")%>' class="btn btn-danger">Pay</a>
</td>
</tr>
<% 
}
%>
</TABLE>
<%
} catch (Exception ex) {
%>
<%
out.println("Unable to connect to database.");
}
%>
<%
try {
%>
<div class="head" >Paid Bill</div>
<%
    ps = con.prepareStatement("SELECT * from userpayment where U_id=? and Cost is Not Null;");
	ps.setString(1, uid);
	rs =ps.executeQuery();
%>

<TABLE cellpadding="15">
<tr>

<td><b>Bill Id</b></td>
<td><b>Vehical No</b></td>
<td><b>V model</b></td>
<td><b> Generated_Date</b></td>
<td><b>Cost</b></td>
<td><b>Pay Date</b></td>
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

} catch (Exception ex) {
%>

<%
out.println("Unable to connect to database.");
}
%>
	 <%
    String msg=request.getParameter("msg");
    if("valid".equals(msg))
    {	
	    %>
	    <h2>Successfully Added</h2>
	    <%
    } %>
    
    <%
    if("invalid".equals(msg))
    {	
	    %>
	    <h2>Some thing Went Wrong! Try Again</h2>
		<%
	} %>
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