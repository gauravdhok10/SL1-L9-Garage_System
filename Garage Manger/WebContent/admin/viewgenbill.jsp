<%@page import="project.ConnectionProvider" %>
<%@ page import="java.io.*" %> 
<%@page import="java.sql.*" %>
<%@page import="project.findcostbybid" %>
<%@include file="sidemenu.html" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%  String name = (String)session.getAttribute("billuname");  
    String uid = (String)session.getAttribute("billuid");
    String bid = (String)session.getAttribute("billid");
    String pid = (String)session.getAttribute("partid");
    String date = (String)session.getAttribute("date");
    String pusded = (String)session.getAttribute("partused");
    String sname = (String)session.getAttribute("sname");
   
    String cost =findcostbybid.getcost(bid);
    %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
 #genbill {
	background-color : #d100d1;
	color:#d7e3fc;
}
    .invoice-box {
        max-width: 800px;
        margin-left: 300px;
        padding: 30px;
        border: 1px solid #eee;
        box-shadow: 0 0 10px rgba(0, 0, 0, .15);
        font-size: 16px;
        line-height: 24px;
        font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
        color: #555;
    }
    
    .invoice-box table {
        width: 100%;
        line-height: inherit;
        text-align: left;
    }
    
    .invoice-box table td {
        padding: 5px;
        vertical-align: top;
    }
    
    .invoice-box table tr td:nth-child(2) {
        text-align: right;
    }
    
    .invoice-box table tr.top table td {
        padding-bottom: 20px;
    }
    
    .invoice-box table tr.top table td.title {
        font-size: 45px;
        line-height: 45px;
        color: #333;
    }
    
    .invoice-box table tr.information table td {
        padding-bottom: 40px;
    }
    
    .invoice-box table tr.heading td {
        background: #eee;
        border-bottom: 1px solid #ddd;
        font-weight: bold;
    }
    
    .invoice-box table tr.details td {
        padding-bottom: 20px;
    }
    
    .invoice-box table tr.item td{
        border-bottom: 1px solid #eee;
    }
    
    .invoice-box table tr.item.last td {
        border-bottom: none;
    }
    
    .invoice-box table tr.total td:nth-child(2) {
        border-top: 2px solid #eee;
        font-weight: bold;
    }
        
    /** RTL **/
    .rtl {
        direction: rtl;
        font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
    }
    
    .rtl table {
        text-align: right;
    }
    
    .rtl table tr td:nth-child(2) {
        text-align: left;
    }
    </style>

</head>
<body>
	<div class="invoice-box">
        <table cellpadding="0" cellspacing="0">
            <tr class="top">
                <td colspan="2">
                    <table>
                        <tr>
                            <td class="title">
                               <h3>Garage Mangement</h3>
                            </td>
                            
                            <td>
                                Bill #: <%=bid %><br>
                                Created: <%=date %><br>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
            <tr class="information">
                <td colspan="2">
                    <table>
                        <tr>
                            <td>
                                Garage, Inc.<br>
                                12345 Sunny Road<br>
                                NAG, MH 12345
                            </td>
                            
                            <td>
                               <%=name %><br>
                              <%=uid %>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
         
            <tr class="heading">
                <td>
                    Service
                </td>
                
                <td>
                    Price
                </td>
            </tr>
            
            <tr class="item">
                <td>
                    <%=uid %>
                </td>
                
                <td>
                    ₹ <%=cost %>
                </td>
            </tr>
            
            
            <tr class="total">
                <td></td>
                
                <td>
                   Total: ₹ <%=cost %>
                </td>
            </tr>
        </table>
    </div>
	<center><h2>Successfully Generated <a href="adminHome.jsp"> Home Page</a></h2></center>
</body>
</html>