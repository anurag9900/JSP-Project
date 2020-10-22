<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, javax.servlet.*" errorPage="" %>
<%
String login = (String)session.getAttribute("login");
if("yes".equals(login)){
	RequestDispatcher rd=null;
	
	if("Employee".equals((String)request.getParameter("type")) && "Employee".equals((String)session.getAttribute("type")))
		{
		rd=request.getRequestDispatcher("employeelogin.jsp");}
	else if("HR".equals((String)request.getParameter("type")) && "HR".equals((String)session.getAttribute("type")))
		{
		rd=request.getRequestDispatcher("HRlogin.jsp");}
	else
		rd=request.getRequestDispatcher("loginerror.jsp");
	rd.forward(request, response);	
}
else{
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="header.jsp"/>
<head>
  <title>Menu</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>



<div >

<nav class="navbar navbar-default">
    <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">Payroll Engine</a>
    </div>
    <ul class="nav navbar-nav" style="float: right">
      <li><a href="index.jsp">Home</a></li>
	<li><a href="login.jsp?type=HR">HR</a></li>
	<li><a href="login.jsp?type=Employee">Employee</a></li>
	<li><a href="MailInfo.jsp">Contact</a></li>
    </ul>
  </div>
  
</nav>
</div>

<div class="col-sm-4">
</div>

<div class="col-sm-4">

    <br>
    <br>
    <form class="text-center" id="form" name="form" method="post" action="Login">

    <p class="h4 mb-4">Login as <%=(String)request.getParameter("type")%></p>

    <!-- Email -->
    <div class="form-group ">
    <input type="text" name="loginid" class="form-control" placeholder="Username" required="required" data-error="Username is required">
	<br>
	
    <!-- Password -->
    
    <input type="password" name ="password" class="form-control" placeholder="Password" required="required" data-error="Password is required">

    
	<input type="hidden" name="type" value="<%=(String)request.getParameter("type")%>" />
	</div>
    <br>
    
    
    <button class="btn btn-info btn-block" type="submit">Login</button>


<%
        if ("Employee".equals(request.getParameter("type"))) {
    %>
        <a href="signup.jsp">New to Payroll Engine? Sign Up</a>
    <%
        } 
    %>

    <p>&nbsp;</p>
    <%//{	out.println("<div class=errortext align=center><font color=red>Invalid Login ID or Password.</div>");}
		if("loginerror".equals((String)request.getParameter("msg"))){
			 %>
			 <tr><td><Strong>invalid combination of Username and Password</Strong></td></tr>
			  <%}
		%>  
    

</form>
      

</body>
</html>
<%}%>
