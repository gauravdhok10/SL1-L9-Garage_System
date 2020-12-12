<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="sidemenu.html" %>
<%
String id1 = request.getParameter("u");
int no=Integer.parseInt(id1);
%>
<!DOCTYPE html>
<html>
<head>
<style>
.update {

margin-left:300px;

}
.update input {
margin:15px;
}
</style>

<title>Update Employee -Admin</title>
</head>
<body>
<div class="update">
<%
Connection con = ConnectionProvider.getCon();
PreparedStatement ps=null;
Statement statement = null;
ResultSet rs = null;
String id=null;
try {
	
	statement = con.createStatement();
	rs = statement.executeQuery("select * from Employee where E_id='"+no+"'");
	while(rs.next()){
	%> 
		<div class="signup">
	<h1>Update Employee - Admin</h1>
	<form action="" method="post">
	<%id=rs.getString(1);%>

	<label>Name &nbsp;</label>
	<input type="text" name="name" placeholder="Enter Name" value='<%=rs.getString(2)%>' required><br>
	<label>Email &nbsp;</label>
	<input type="email" name="email" placeholder="Enter Email" value='<%=rs.getString(3)%>' required><br>
	<label>Number &nbsp;</label>
	<input type="number" name="mobilenumber" placeholder="Enter phone" value='<%=rs.getString(4)%>' required><br>
	<label>Salary &nbsp;</label>
	<input type="text" name="salary" placeholder="Enter Salary" value='<%=rs.getString(5)%>' required><br>
	<label>Address &nbsp;</label>
	<input type="text" name="address" placeholder="Enter Address" value='<%=rs.getString(6)%>' required><br>
	<label>Date of join &nbsp;</label>
	<input type="date" name="dateofjoin" placeholder="Enter Date of join" value='<%=rs.getString(7)%>' required><br>
	<label>Date of Birth &nbsp;</label>
	<input type="date" name="dateofbirth" placeholder="Enter Date of Birth" value='<%=rs.getString(8)%>' required><br>
	<button type="submit">Update</button>
	<% } 

	%>
	</form>
		 <TABLE>
<TR>
<TD>
<button  href="adminHome.jsp"><-- back</a></TD>
</TR>
</TABLE> 
	</div>	
	</div>
	 <%

	 String a = new String(id);
	 String b = request.getParameter("name");
	 String c = request.getParameter("email");
	 String d = request.getParameter("mobilenumber");
	 String e = request.getParameter("salary");
	 String f =request.getParameter("address");
	 String g =request.getParameter("dateofjoin");
	 String h =request.getParameter("dateofbirth");
	 if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null && g!=null && h!=null)
	 {
		 ps = con.prepareStatement("Update User set E_name=?,E_email=?,E_phone=?,E_salary=?,E_address=?,E_dateofjoin=? ,E_dateofbirth=? where U_id='"+a+"';");
		    ps.setString(1, b);
		    ps.setString(2, d);
		    ps.setString(3, c);
		    ps.setString(4, e);
		    ps.setString(5, f);
		    ps.setString(6, g);
		    ps.setString(7, h);
		    
		    ps.executeUpdate();
		    response.sendRedirect("duEmployee.jsp?msg=validu");
		}
	 }
			catch(Exception e) 
			{
				
				e.printStackTrace();
				response.sendRedirect("duEmployee.jsp?msg=notvalidu");
			
			}
	 %> 

</body>
</html>