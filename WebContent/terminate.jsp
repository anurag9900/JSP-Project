<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Menu</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>

<table class="table">
  <tr>
    <td valign="top">
	
	<table class="table">
      <tr>
        <td bgcolor="#F2F2F2" ><a href="newhire.jsp">Hire Employee</a></td>
      </tr>
      <tr>
        <td bgcolor="#F2F2F2" ><a href="employeedetails.jsp">Employee Details</a></td>
      </tr>
      <tr>
        <td bgcolor="#F2F2F2"><a href="employeepayresults.jsp">Employee Payresults</a></td>
      </tr>
       <tr>
        <td bgcolor="#F2F2F2"><a href="runpayroll.jsp">Run Payroll</a></td>
      </tr>
      <tr>
        <td bgcolor="#F2F2F2"><a href="terminate.jsp">Terminate Employee</a></td>
      </tr>
    </table>
	
	</td>
    <td><form id="form1" name="form1" method="post" action="Terminate">
      <table class="table">
     <p>&nbsp;</p>
     	<%
		if("notsuccess".equals((String)request.getParameter("msg"))){
			 %>
			 <tr><td><Strong>Enter Correct Employee ID</Strong></td></tr>
			  <%}
		%>  
		 <%
		if("success".equals((String)request.getParameter("msg"))){
			 %>
			 <tr><td><Strong>Employee Terminated Successfully</Strong></td></tr>
			  <%}
		%>  
        <tr>
          <td >Enter Employee Details</td>
          </tr>
        <tr>
          <td valign="top">Enter Employee Number</td>
		  <td><textarea cols="40" rows="1" class="inputtext" name="employeeid"></textarea></td>
        </tr>
         <tr>
        <td>Enter Termination Date</td>
        <td><textarea cols="40" rows="1" class="inputtext" name="termdate"></textarea></td>
        </tr>
		<tr>
          <td >
		  <input type="hidden" name="authorid" value="<%=(String)session.getAttribute("loginid")%>" />
  		  <input type="hidden" name="author" value="<%=(String)session.getAttribute("user")%>" />
		  </td>
          </tr>
        <tr>
          <td ><input type="submit" value="Submit" class="inputtext" />
		  <input type="reset" value="Reset" class="inputtext"/>
		  </td>
          </tr>
      </table>
        </form>	</td>
  </tr>
</table>

</body>
</html>
