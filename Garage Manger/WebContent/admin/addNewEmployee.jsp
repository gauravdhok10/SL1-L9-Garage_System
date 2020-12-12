<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="sidemenu.html" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/Add.css" >
<title>Add new Employee-Admin</title>
<style >
#addnewe {
	background-color : #d100d1;
	color:#d7e3fc;
}
</style>
</head>
<body>
	<div class="content">
	<h1>Add New Employee - Admin</h1>
	<form action="addNewEmployeeAction.jsp" method="post">
	<label> Name</label>
	<input type="text" name="employeename" placeholder="Enter Employee Name" required><br>
	<label> Email</label>
	<input type="email" name="employeeemail" placeholder="Enter Employee Email" required><br>
	<label> Phone</label>
	<input type="number" name="employeemobilenumber" placeholder="Enter Employee Phone" required><br>
	<label> Salary</label>
	<input type="number" name="employeesalary" placeholder="Enter Employee Salary" required><br>
	<label> Address</label>
	<input type="text" name="employeeaddress" placeholder="Enter Employee Address" required><br>
	<label> Date of Joining</label>
	<input type="date" name="edoj" placeholder="Enter Date of Joining" required><br>
	<label> Date of Birth</label>
	<input type="date" name="edob" placeholder="Enter Date of Birth" required><br>
	<%
	String date=null;
	ResultSet rs1=null;
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps1;
	String sql,fname;
	fname=null;
	%>
	<!-- ---------------------------------------User Name  -->
	<%
		try
		{
		sql = "SELECT * FROM Service";
		ps1 = con.prepareStatement(sql);
		rs1 = ps1.executeQuery(); 
	%>
	<label>Select Service :
	<input list="ServiceName" name="sname" /></label>
	<datalist id="ServiceName">
		<%
			while(rs1.next())
			{
			 fname = rs1.getString("S_name"); 
			%>
			<option value="<%=fname %>"><%=fname %></option>
			<%
			}
		%>
		</datalist>
		<br>
		<%
	}
	catch(SQLException e)
	{ 
	out.println(e);
	}
	%>
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