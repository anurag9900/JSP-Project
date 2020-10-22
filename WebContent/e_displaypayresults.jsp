<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
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
String startdate = (String)session.getAttribute("startdate");
String enddate = (String)session.getAttribute("enddate");
String employee_hours = (String)session.getAttribute("employee_hours");
String employee_gross = (String)session.getAttribute("employee_gross");
String employee_fedtax = (String)session.getAttribute("employee_fedtax");
String employee_cpp = (String)session.getAttribute("employee_cpp");
String employee_ei = (String)session.getAttribute("employee_ei");
String employee_garnishment = (String)session.getAttribute("employee_garnishment");
String employee_deductions = (String)session.getAttribute("employee_deductions");
String employee_netpay = (String)session.getAttribute("employee_netpay");
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
    <td><form id="form1" name="form1" method="post" action="DisplayPayResults">
      <table class="table">
        <tr>
          <td >Below are your Payresults</td>
          </tr>
        <tr>
          <td valign="top">Full Name:<%= employee_name %></td>
        </tr>
         <tr>
          <td valign="top">Employee ID: :<%= employee_id %></td>
        </tr>
        <tr>
          <td valign="top">Pay Period Start Date:<%= startdate %></td>
        </tr>
        <tr>
          <td valign="top">Pay Period End Date :<%= enddate %></td>
        </tr>
        <tr>
          <td valign="top">Hours Working Per Week::<%= employee_hours %> </td>
        </tr>
         <tr>
          <td valign="top">Gross Amount::<%= employee_gross %> </td>
        </tr>
         <tr>
          <td valign="top">Federal Tax: :<%= employee_fedtax %></td>
        </tr>
        <tr>
          <td valign="top">Canada Pension Plan (CPP): :<%= employee_cpp %></td>
        </tr>
        <tr>
          <td valign="top">Employee Insurance(EI): :<%= employee_ei %></td>
        </tr>
        <tr>
          <td valign="top">Garnishment::<%= employee_garnishment %> </td>
        </tr>     
         <tr>
          <td valign="top">Total Deductions: :<%= employee_deductions %></td>
        </tr>   
        <tr>
          <td valign="top">Net Pay:<%= employee_netpay %></td>
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
