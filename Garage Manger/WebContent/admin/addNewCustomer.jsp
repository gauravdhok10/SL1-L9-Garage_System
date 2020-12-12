<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="sidemenu.html" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/Add.css" >
<title>Add new User-Admin</title>
<style >
#addnewc {
	background-color : #d100d1;
	color:#d7e3fc;
}
</style>
</head>
<body>
	<div class="content">
	<h1>Add New User - Admin</h1>
	<form action="addNewCustomerAction.jsp" method="post">
	<label>Name</label>
	<input type="text" name="name" placeholder="Enter Name" required><br>
	<label>Email</label>
	<input type="email" name="email" placeholder="Enter Email" required><br>
	<label>Phone</label>
	<input type="number" name="mobilenumber" placeholder="Enter phone" required><br>
	<label>Password</label>
	<input type="password" name="password" placeholder="Enter password" required><br>
	<label>Address</label>
	<input type="text" name="address" placeholder="Enter Address" required><br>
	<label>City</label>
	<input type="text" name="city" placeholder="Enter city" required><br>
	<label>State</label>
	<input type="text" name="state" placeholder="Enter state" required><br>
	
	<input type="submit" value="Add new Customer">
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