<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String ename = request.getParameter("employeename");
String eemail = request.getParameter("employeeemail");
String emobilenumber = request.getParameter("employeemobilenumber");
String eaddress =request.getParameter("employeeaddress");
String esalary =request.getParameter("employeesalary");
String edoj =request.getParameter("edoj");
String edob =request.getParameter("edob");
String sname =request.getParameter("sname");
String eid=null,sid=null;
ResultSet rs1=null;
try {
	Connection con = ConnectionProvider.getCon();
	
    PreparedStatement ps = con.prepareStatement("insert into Employee(E_name,E_email,E_phone,E_salary,E_address,E_dateofjoin,E_dateofbirth) values(?,?,?,?,?,?,?);");
    ps.setString(1, ename);
    ps.setString(2, eemail);
    ps.setString(3, emobilenumber);
    ps.setString(4, esalary);
    ps.setString(5, eaddress);
    ps.setString(6, edoj);
    ps.setString(7, edob);
    
    ps.executeUpdate();
    
    ps = con.prepareStatement("select E_id from Employee where E_email=?; ");
	ps.setString(1,eemail);
	rs1 = ps.executeQuery(); 
	if(rs1.next()){
    	eid = rs1.getString("E_id"); 
	}
	ps = con.prepareStatement("select S_id from Service where S_name=?; ");
	ps.setString(1,sname);
	rs1 = ps.executeQuery(); 
	if(rs1.next()){
    	sid = rs1.getString("S_id"); 
	}
	ps = con.prepareStatement("insert into Employee_service(E_id,S_id) values(?,?);");
    ps.setString(1, eid);
    ps.setString(2, sid);
    ps.executeUpdate();
    response.sendRedirect("addNewEmployee.jsp?msg=valid");
}
	catch(Exception e) 
	{
		System.out.println(e);
		response.sendRedirect("addNewEmployee.jsp?msg=invalid");
	}
%>
