<%@page errorPage="error.jsp"%>
<header>
<div class="topnav">
<%String email=session.getAttribute("email").toString(); %>
<h2>Garage Management</h2>
<a href="addNewCustomer.jsp">Add Customer</a>
<a href="addNewPart.jsp">Add Parts</a>
<a href="addNewService.jsp">Add Service</a>
<a href="viewCustomer.jsp">View Customer</a>
<a href="viewEmployee.jsp">View Employee</a>
<a href="viewService.jsp">View Service</a>
<a href="viewPart.jsp">View Parts</a>
<a href="../login.jsp">Logout</a>
</div>
</header>
