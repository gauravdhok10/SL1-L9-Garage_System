<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="sidemenu.html" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/Add.css" >
<style>
#addnews {
	background-color : #d100d1;
	color:#d7e3fc;
}
</style>
<title>Add new Service -Admin</title>
</head>
<body>
	<div class="content">
	<h1>Add New Service - Admin</h1>
	<form action="addNewServiceAction.jsp" method="post">
	<label>Service Name</label>
	<input type="text" name="servicename" placeholder="Enter Service Name" required><br>
	<label>Service Price</label>
	<input type="number" name="serviceprice" placeholder="Enter Service Price" required><br>
	<input type="submit" value="Add New Service"><br>
	</form>
	</div>
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
</body>
</html>