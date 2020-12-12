<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String pname = request.getParameter("partname");
String pbrand = request.getParameter("partbrand");
String pprice = request.getParameter("partprice");
String pstock =request.getParameter("partstock");
String pdop =request.getParameter("pdopurchase");

try {
	Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("insert into Parts(P_name,P_brand,P_price,P_stock,P_dateofpurchase) values(?,?,?,?,?);");
    ps.setString(1, pname);
    ps.setString(2, pbrand);
    ps.setString(3, pprice);
    ps.setString(4, pstock);
    ps.setString(5, pdop);

    
    ps.executeUpdate();
    response.sendRedirect("addNewPart.jsp?msg=valid");
}
	catch(Exception e) 
	{
		System.out.println(e);
		response.sendRedirect("addNewPart.jsp?msg=invalid");
	}
