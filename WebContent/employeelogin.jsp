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
<body>
<jsp:include page="header.jsp"/>

<jsp:include page="menu.jsp"/>

<div class="container-fluid">

<div class="text-center">
	<%
	if("added".equals((String)request.getParameter("msg")))
	out.print("<div align=center class=errortext>Developer added</div>");
	%>
</div>
<table class="table">
  <tr>
    <td valign="top">
	
	<table class="table">
      <tr>
      <td bgcolor="#F2F2F2"><a href="e_employeedetails.jsp">Your Details</a></td>
      </tr>
      <tr>
        <td bgcolor="#F2F2F2"><a href="e_employeepayresults.jsp">Your Payresults</a></td>
      </tr>
    </table></td>
    <td><p>Welcome</p>
      <ul>
        <li>Display Your Details</li>
        <li>Display Your Payresults</li>
      </ul></td>
  </tr>
  
</table>
</div>
</body>
</html>
