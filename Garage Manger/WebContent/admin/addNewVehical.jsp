
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@page import="project.ConnectionProvider" %>
<%@include file="sidemenu.html" %>
<html>
<head>
<title>Add Vehical</title>
<link rel="stylesheet" href="css/Add.css" >
<style>
#addnewv {
	background-color : #d100d1;
	color:#d7e3fc;
}

</style>
</head>
<body>
<div class="content">
<h2 class="msg">Add Vehical</h2>

	<%
	String date=null;
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("SELECT CURRENT_TIMESTAMP;");
	ResultSet rs1 =ps.executeQuery();

	if(rs1.next()){
		 date = rs1.getString("CURRENT_TIMESTAMP"); 
	}	
		PreparedStatement ps1;
		String sql,fname;
		fname=null;
	%>
	<form action="addNewVehicalAction.jsp" method="post">
	<!-- ---------------------------------------User Name  -->
	<%
		try
		{
		sql = "SELECT * FROM User";
		ps1 = con.prepareStatement(sql);
		rs1 = ps1.executeQuery(); 
	%>
	<label>Select Name :
	<input list="CustomerName" name="uname" /></label>
	<datalist id="CustomerName">
		<%
			while(rs1.next())
			{
			 fname = rs1.getString("U_name"); 
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
	<label>Enter V_no :
	<input type="text" name="vno" placeholder="Enter No. V_no"><br></label>
	<label>Enter  V company :
	<input type="text" name="vco" placeholder="Enter V company"><br></label>
	<label>Enter  V Model :
	<input type="text" name="vmo" placeholder="Enter V Model"><br></label>
	<label>Enter  V Color :
	<input type="text" name="vcolor" placeholder="Enter V color"><br></label>
	<label>Enter Date of V Entry :
	<input type="text" name="entry" placeholder="Enter V Entry Date" value='<%out.println(date);%>'><br></label>
	
	<input type="submit" value="ADD Vehical">
	</form>
	
	 <%
    String msg=request.getParameter("msg");
    if("valid".equals(msg))
    {	
	    %>
	    <h2>Added Successfully <a href="viewvehical.jsp"> View Vehical</a></h2>
	    <%
    } %>
    
    <%
    if("invalid".equals(msg))
    {	
	    %>
	    <h2>Some thing Went Wrong! Try Again</h2>
		<%
	} %>   
</div>	
</body>
</html>
