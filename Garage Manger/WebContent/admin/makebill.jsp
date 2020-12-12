<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@page import="project.ConnectionProvider" %>
<%@include file="sidemenu.html" %>
<html>
<head>
<title>Make Bill</title>
<style type="text/css">
#make {
	background-color : #d100d1;
	color:#d7e3fc;
}
body {
background-color:#e6f0ff;
text-align:center;
margin-top:20vh;
}
.content {
  margin-left: 270px; /* Same as the width of the sidenav */
  font-size: 18px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}
form {
background-color : white;
Padding:20px;
width:60%;
text-align:left;
border-radius:5px;
margin-left:auto;
margin-right:auto;
}
form input {
	margin : 5px;
}
</style>
</head>
<body>
<div class="content">
<h2 class="msg">Make Bill</h2>

	<%
		Connection con = ConnectionProvider.getCon();
		PreparedStatement ps1,s1,s2;
		String sql,fname;
		fname=null;
		ResultSet rs1,rss1,rss2;
	%>
	<form action="makebillAction.jsp" method="post">
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
		</br>
		<%
	}
	catch(SQLException e)
	{ 
	out.println(e);
	}
	%>
	<!-- ---------------------------------------Vehical Number  -->
	<%
		try
		{
		sql = "SELECT * FROM Vehical";
		ps1 = con.prepareStatement(sql);
		rs1 = ps1.executeQuery(); 
	%>
	<label>Select Vehical No :
	<input list="VehicalNo" name="vno" /></label>
	<datalist id="VehicalNo">
		<%
			while(rs1.next())
			{
			 fname = rs1.getString("V_no"); 
			%>
			<option value="<%=fname %>"><%=fname %></option>
			<%
			}
		%>
		</datalist>
		</br>
		<%
	}
	catch(SQLException e)
	{ 
	out.println(e);
	}
	%>
	<!----------------------------- Service Name 1----------------------- -->
	<%
		try
		{
		sql = "SELECT * FROM Service";
		s1 = con.prepareStatement(sql);
		rss1= s1.executeQuery(); 
	%>
	<label>Select Service :
	<input list="ServiceName" name="sname1" /></label>
	<datalist id="ServiceName">
		<%
			while(rss1.next())
			{
			 fname = rss1.getString("S_name"); 
			%>
			<option value="<%=fname %>"><%=fname %></option>
			<%
			}
		%>
		</datalist>
		
		<%
	}
	catch(SQLException e)
	{ 
	out.println(e);
	}
	%>
	
			<!-- Service Name 1  Part Used 1 -->
			<%
				try
				{
				sql = "SELECT * FROM Parts";
				s2 = con.prepareStatement(sql);
				rss2= s2.executeQuery(); 
			%>
			<br>
			<label>Select Part :
			<input list="PartName" name="pname1" /></label>
			<datalist id="PartName">
				<%
					while(rss2.next())
					{
					 fname = rss2.getString("P_name"); 
					%>
					<option value="<%=fname %>"><%=fname %></option>
					<%
					}
				%>
				</datalist>
				
				<%
			}
			catch(SQLException e)
			{ 
			out.println(e);
			}
	%>
	<br>
	<label>Select No. Part :
	<input type="number" name="partsused1" placeholder="No. Of Parts Used"></br></label>
	<input type="submit" value="Make Bill">
	</form>
	
	 <%
    String msg=request.getParameter("msg");
    if("valid".equals(msg))
    {	
	    %>
	    <h2>Successfully Generated <a href="viewgenbill.jsp"> View Bill</a></h2>
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
