<%@page import="project.ConnectionProvider" %>
<%@ page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%
String uname = request.getParameter("uname");
String vno = request.getParameter("vno");
String sname1 = request.getParameter("sname1");
String pname1 =request.getParameter("pname1");
String partsused1 =request.getParameter("partsused1");

String uid=null,date=null,vid=null,bid=null,pid=null,sid=null;
try {
	
	PreparedStatement ps;
	ResultSet rs1,rss1,rss2;
	Connection con = ConnectionProvider.getCon();
	//-------------------featching uid from uname
	ps = con.prepareStatement("select U_id from User where U_name=?; ");
	ps.setString(1,uname);
	rs1 = ps.executeQuery(); 
	if(rs1.next()){
		 uid = rs1.getString("U_id"); 
	}
		PreparedStatement ps1 = con.prepareStatement("SELECT CURRENT_TIMESTAMP;");
        rs1 =ps1.executeQuery();
        
        if(rs1.next()){
        	 date = rs1.getString("CURRENT_TIMESTAMP"); 
    	}	

	
	//---------------------featching vid from vno 
	ps = con.prepareStatement("select V_id from Vehical where V_no=?; ");
	ps.setString(1,vno);
	rs1 = ps.executeQuery(); 
	if(rs1.next()){
    	vid = rs1.getString("V_id"); 
	}
	
   	ps = con.prepareStatement("insert into Bill_Main(U_id, V_id ,Generated_Date,Status) values(?,?,?,?);");
    ps.setString(1, uid);
    ps.setString(2, vid);
    ps.setString(3, date);
    ps.setString(4, "Not Paid");
    ps.executeUpdate();
  //---------------------featching bid 
  	ps = con.prepareStatement("select B_id from Bill_Main where U_id=? and V_id=? and Generated_Date=? and Status=?; ");
  	ps.setString(1,uid);
  	 ps.setString(2, vid);
     ps.setString(3, date);
     ps.setString(4, "Not Paid");
  	rs1 = ps.executeQuery(); 
  	if(rs1.next()){
      	bid = rs1.getString("B_id"); 
  	}
    //---------------------featching sid 
  ps = con.prepareStatement("select S_id from Service where S_name=?; ");
  	ps.setString(1,sname1);
  	rs1 = ps.executeQuery(); 
  	if(rs1.next()){
      	sid = rs1.getString("S_id"); 
  	}
    //---------------------featching pid 
  ps = con.prepareStatement("select P_id from Parts where P_name=?; ");
  	ps.setString(1,pname1);
  	rs1 = ps.executeQuery(); 
  	if(rs1.next()){
      	pid = rs1.getString("P_id"); 
  	}  	
  	
  	ps = con.prepareStatement("insert into Bill_Detail(B_id,S_id,P_id ,P_used) values(?,?,?,?);");
    ps.setString(1, bid);
    ps.setString(2, sid);
    ps.setString(3, pid);
    ps.setString(4, partsused1);
    ps.executeUpdate();
    session.setAttribute("billuname",uname);
    session.setAttribute("billuid",uid);
    session.setAttribute("billid",bid);
    session.setAttribute("partid",pid);
    session.setAttribute("partused",partsused1);
    session.setAttribute("date",date);
    session.setAttribute("sname",sname1);
    response.sendRedirect("makebill.jsp?msg=valid");
}
	catch(Exception e) 
	{
		System.out.println(e);
		response.sendRedirect("makebill.jsp?msg=invalid");
	}
%>