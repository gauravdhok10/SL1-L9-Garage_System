<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="refresh" content="3;url=../login.jsp"" />
<title>Logout</title>
</head>
<body>
<% session.invalidate(); %>
<p>You have been successfully logout</p>

</body>
</html>