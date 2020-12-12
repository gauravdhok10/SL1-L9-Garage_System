<%@page import="project.ConnectionProvider" %>
<%@ page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%
String uname = request.getParameter("uname");
String vno = request.getParameter("vno");
String vco = request.getParameter("vco");
String vmo = request.getParameter("vmo");
String vcolor =request.getParameter("vcolor");
String entry =request.getParameter("entry");

String uid=null;
try {
	PreparedStatement ps;
	ResultSet rs1;
	Connection con = ConnectionProvider.getCon();
	//-------------------featching uid from uname
	ps = con.prepareStatement("select U_id from User where U_name=?; ");
	ps.setString(1,uname);
	rs1 = ps.executeQuery(); 
	if(rs1.next()){
		 uid = rs1.getString("U_id"); 

	}
	
	ps = con.prepareStatement("insert into Vehical(U_id,V_no , V_comp,V_model ,color, DOEntry) values(?,?,?,?,?,?);");
    ps.setString(1, uid);
    ps.setString(2, vno);
    ps.setString(3, vmo);
    ps.setString(4, vco);
    ps.setString(5, vcolor);
    ps.setString(6, entry);
    ps.executeUpdate();
    
    response.sendRedirect("addNewVehical.jsp?msg=valid");
}catch(Exception e) 
{
	System.out.println(e);
	response.sendRedirect("addNewVehical.jsp?msg=invalid");
}
%>	