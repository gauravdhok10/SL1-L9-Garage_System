<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String id = request.getParameter("d");
int no=Integer.parseInt(id);
Connection con = ConnectionProvider.getCon();
PreparedStatement ps = con.prepareStatement("delete from Vehical where V_id='"+no+"'");
ps.executeUpdate();
response.sendRedirect("duVehical.jsp");
%>