<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	if("admin@gmail.com".equals(email) & "admin".equals(password))
	{
		session.setAttribute("email",email);
		response.sendRedirect("admin/adminHome.jsp");
	}
	else
	{
		int z=0;
		try {
			Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("select * from User where U_email=? and U_pass=?;");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs =ps.executeQuery();
	            while(rs.next())
	            {
	            	z=1;
	            	session.setAttribute("email",email);
	            	response.sendRedirect("user/home.jsp");
	            }
	            	if(z==0)
	            		response.sendRedirect("login.jsp?msg=notexist");
			}
			catch(Exception e) 
			{
				System.out.println(e);
				response.sendRedirect("login.jsp?msg=invalid");
			}
	}	
%>
