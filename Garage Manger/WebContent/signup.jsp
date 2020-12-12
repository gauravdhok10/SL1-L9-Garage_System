<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup.css" >
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
<title>Signup</title>
</head>
<body>
	<div class="signup">
	<h2><i>Garage Management</i><h2>
	
	<h1>SignUp</h1>
	<form action="signupAction.jsp" method="post">
	<input type="text" name="name" placeholder="Enter Name" required><br>
	<input type="email" name="email" placeholder="Enter Email" required><br>
	<input type="text" name="mobilenumber" placeholder="Enter phone" required><br>
	<input type="password" name="password" placeholder="Enter password" required><br>
	<input type="submit" value="signup">
	</form>
	<h3><a href="login.jsp">SignIn</a></h3>
	</div>
	 <%
    String msg=request.getParameter("msg");
    if("valid".equals(msg))
    {	
	    %>
	    <h2>Successfully Register</h2>
	    <%
    } %>
    
    <%
    if("invalid".equals(msg))
    {	
	    %>
	    <h2>Some thing Went Wrong! Try Again</h2>
		<%
	} %>    
</body>
</html>