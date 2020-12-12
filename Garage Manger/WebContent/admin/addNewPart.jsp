<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="sidemenu.html" %>

<!DOCTYPE html>
<html>
<head>
<style>
#addnewp {
	background-color : #d100d1;
	color:#d7e3fc;
}
</style>
<link rel="stylesheet" href="css/Add.css" >
<title>Add new Part-Admin</title>
</head>
<body>
	<div class="content">
	<h1>Add New Part - Admin</h1>
	<form action="addNewPartAction.jsp" method="post">
	<label>Part Name</label>
	<input type="text" name="partname" placeholder="Enter Part Name" required><br>
	<label>Part Brand</label>
	<input type="text" name="partbrand" placeholder="Enter Part Brand" required><br>
	<label>Part Price</label>
	<input type="text" name="partprice" placeholder="Enter Part Price" required><br>
	<label>Part Stock</label>
	<input type="text" name="partstock" placeholder="Enter Part Stock" required><br>
	<label>Part Date of Purchase</label>
	<input type="date" name="pdopurchase" placeholder="Enter Date of Purchase" required><br>
	
	<input type="submit" value="Add new Employee">
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