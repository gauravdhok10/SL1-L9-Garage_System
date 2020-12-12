<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <style>
		body {
		  background-color: #f3f3f3;
		  text-align:center;
		   font-family: sans-serif;
		}
		form {
			background-color :#E8CEBF;
			width:50%;
			margin-left:auto;
			margin-right:auto;
			padding:20px;
		}
		h1 {
		  color: #3C1874;
		}
		input {
		padding : 10px;
		margin:10px;
		}
</style>
        <title>login</title>
</head>
    <body>
    <div class="signup">
    <h2><i>Garage Management</i></h2>
    <h1>Login</h1>
        <form method="post" action="signinAction.jsp">
        <input type="email" name="email" placeholder="Enter Email" required><br>
        <input type="password" name="password" placeholder="Enter password" required><br>
		<input type="submit" value="login">
        </form>
        <h3><a href="signup.jsp">SignUp</a></h3>
    </div>
    
    <%
    String msg=request.getParameter("msg");
    if("notexist".equals(msg))
    {	
	    %>
	    <h2>Incorrect Username Password</h2>
	    <%
    } 
    
    if("invalid".equals(msg))
    {	
	    %>
	    <h2>Some thing Went Wrong! Try Again</h2>
		<%
	} %>    
    </body>
</html>