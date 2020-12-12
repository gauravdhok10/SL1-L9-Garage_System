<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String id = request.getParameter("d");
int no=Integer.parseInt(id);
Connection con = ConnectionProvider.getCon();
PreparedStatement ps = con.prepareStatement("delete from Employee where E_id='"+no+"'");
ps.executeUpdate();
response.sendRedirect("duEmployee.jsp");
%>