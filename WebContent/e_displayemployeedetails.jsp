<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Menu</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<% String employee_id = (String)session.getAttribute("employee_id");
String employee_name = (String)session.getAttribute("employee_name");
String employee_hiredate = (String)session.getAttribute("employee_hiredate");
String employee_sin = (String)session.getAttribute("employee_sin");
String employee_gross = (String)session.getAttribute("employee_gross");
String employee_hours = (String)session.getAttribute("employee_hours");
String employee_garnishment = (String)session.getAttribute("employee_garnishment");
%>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>

<table class="table">
  <tr>
    <td valign="top">
	
	<table class="table">
	<%
	if("error".equals((String)request.getParameter("msg")))
	out.print("<div align=center class=errortext>Field Blank or Some Database Error!</div>");
	%>
      <tr>
        <td bgcolor="#F2F2F2" ><a href="e_employeedetails.jsp">Your Details</a></td>
      </tr>
      <tr>
        <td bgcolor="#F2F2F2"><a href="e_employeepayresults.jsp">Your Payresults</a></td>
      </tr>
    </table>
	
	</td>
    <td><form id="form1" name="form1" method="post" action="ReportBug">
      <table class="table">
        <tr>
          <td >Below are your Details</td>
          </tr>
         <tr>
          <td valign="top">Employee Full Name     :<%= employee_name %></td>
        </tr>
        <tr>
          <td valign="top">Employee ID            :<%= employee_id %></td>
        </tr>
		<tr>
          <td valign="top">Hire Date(MM/DD/YYYY)  :<%= employee_hiredate %></td>
        </tr>
        <tr>
          <td valign="top">SIN number             :<%= employee_sin %></td>
        </tr>
         <tr>
          <td valign="top">Gross Annual Income    :<%= employee_gross %></td>
        </tr>
        <tr>
          <td valign="top">Hours Working Per Week :<%= employee_hours %></td>
        </tr>
         <tr>
          <td valign="top">Garnishment Amount     :<%= employee_garnishment %></td>
        </tr>
        <tr>
          <td >
		  <input type="hidden" name="authorid" value="<%=(String)session.getAttribute("loginid")%>" />
  		  <input type="hidden" name="author" value="<%=(String)session.getAttribute("user")%>" />
		  </td>
          </tr>
      </table>
        </form>	</td>
  </tr>
</table>

</body>
</html>
