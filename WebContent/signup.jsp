<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Menu</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="mystyle.css" rel="stylesheet" type="text/css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>

<div class="text-center">
<%
if("blank".equals((String)request.getParameter("msg")))
out.println("<div class=errortext>Field Blank | Password and Re-Enter Password mismatch.</div>");
else if("success".equals((String)request.getParameter("msg")))
out.println("<a href=\"login.jsp?type=Employee\">Signup Succes, please click to login</a>");
%>
</div>
<div class="row">
<div class="col-sm-4">
</div>

    <div class="col-sm-4">
	<h2>Signup New Employee</h2>
    <form id="form1" name="form1" method="post" action="SignUp">
      
      <div class="form-group">
          <label >Employee ID:</label>
          <input type="text" name="employeeid" size="20" class="form-control"/>
       </div>
     <div class="form-group">
          <label >Password:</label>
          <input type="password" name="password" size="20" class="form-control"/>
     </div>  
          
      <div class="form-group">
          <label >Re-Enter Password:</label>
          <td><input type="password" name="repassword" size="20" class="form-control"/></td>
       </div>
                 
          <input type="hidden" name="type" value="Tester"/>
        
		  <input type="submit" value="Submit" class="btn btn-default" />
		  <input type="reset" value="Reset" class="inputtext"/>
		  
      </form>
    </div>
   </div> 
 <div class ="row">
 <br>
 <br>
 <div align="center"><a href="manager.jsp">Back</a></div>
 </div>
    </body>
    
</html>
