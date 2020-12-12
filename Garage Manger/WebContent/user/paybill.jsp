<!DOCTYPE HTML>
<%@page import="project.ConnectionProvider" %>
<%@page import="project.findcostbybid" %>
<%@page import="project.getdate" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@include file="sidemenu.html" %>
<%
String id3 = request.getParameter("p");
String bid = String.valueOf(id3);
String cost=findcostbybid.getcost(id3);
String date=getdate.getcurdate();
Connection con = ConnectionProvider.getCon();
PreparedStatement ps=null;
Statement statement = null;
ResultSet rs = null;

	
	
%>
<html>
<head>
<title>Bill View</title>
<link rel="stylesheet" href="css/table.css">
<style>
	#viewb {
	background-color : #d100d1;
	color:#d7e3fc;
}
body {
background-color:#e6f0ff;
text-align:center;
}
.content {
  margin-left: 270px; /* Same as the width of the sidenav */
  font-size: 20px; /* Increased text to enable scrolling */
  padding: 0px 10px;
  width:60%;
  
}label {
	padding:10px;
	
}
form {
			background-color:white;
box-shadow:0px 7px 9px 0px rgba(50, 50, 50, 0.62);
			width:50%;
			margin-left:auto;
			margin-right:auto;
			padding:20px;
		}
		h1 {
		  color: #3C1874;
		}
		input {
		padding : 10px;
		margin:10px;
		border-radius:5px;
		}
}
.msg {
margin-top :0;
color: #3C1874;
}
nav {
	text-align:right;
}
nav li{
	
	display:inline-block;
}
a {
color:black;
 
}

input ,select {
margin:10px;
}
</style>
</head>
<body>
<div class="content">
<div class="heading">
<h2>Pay Bills</h2>
</div>
<div class="paybill">
	<h1>Make Payment</h1>
	<form action="" method="post">
	<label>Enter B ID :</label>
	<input type="text" name="bid" value='<%=bid %>' required><br>
	<label>Enter Date :</label>
	<input type="text" name="p_date" placeholder="Enter Date" value='<%=date %>' required><br>
	<label>Enter Mode :</label>
	<select name="Mode" required>
    <option value="1">Online</option>
    <option value="2">Cash</option>
  	</select>
  	<br>
  	<label>Enter Ammount</label>
	<input type="number" name="payammount" placeholder="Payment Ammount" value='<%=cost %>' required>
	<input type="submit" value="Make Payment">
	</form>
	</div>
<%
    try {
	 String a = request.getParameter("p_date");
	 String b = request.getParameter("Mode");
	 String c = request.getParameter("payammount");
	 String d = request.getParameter("bid");
	 
	 if(a!=null && b!=null && c!=null && d!=null)
	 {
		 ps = con.prepareStatement("insert into Payment( P_date , P_mode,P_ammount,B_id) values(?,?,?,?);");
		    ps.setString(1, a);
		    ps.setString(2, b);
		    ps.setString(3, c);
		    ps.setString(4, d);
		    
		    ps.executeUpdate();
		    response.sendRedirect("viewbill.jsp?msg=valid");
	}
    } catch(Exception e) {
    	
			response.sendRedirect("viewbill.jsp?msg=notvalid");
	 }
	 %> 
	
</div>
</body>
</html>