<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String sname = request.getParameter("servicename");
String sprice = request.getParameter("serviceprice");

try {
	Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("insert into Parts(S_name,S_price) values(?,?);");
    ps.setString(1, sname);
    ps.setString(2, sprice);
  
    ps.executeUpdate();
    response.sendRedirect("addNewPart.jsp?msg=valid");
}
	catch(Exception e) 
	{
		System.out.println(e);
		response.sendRedirect("addNewPart.jsp?msg=invalid");
	}
