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

<table class="table">
  <tr>
    <td valign="top">
	
	<table class="table">
	<%
	if("error".equals((String)request.getParameter("msg")))
	out.print("<div align=center class=errortext>Field Blank or Some Database Error!</div>");
	%>
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
    </table>
	
	</td>
    <td><form id="form1" name="form1" method="post" action="Hire">
      <table class="table">
        <tr>
          <td >Enter Employee Details to hire</td>
          </tr>
           <p>&nbsp;</p>
    <%
		if("success".equals((String)request.getParameter("msg"))){
			 %>
			 <tr><td><Strong>Employee Hire Successfully</Strong></td></tr>
			  <%}
		%>  
		
		<%
		if("notsuccess".equals((String)request.getParameter("msg"))){
			 %>
			 <tr><td><Strong>Employee already exist, cannot hire</Strong></td></tr>
			  <%}
		%>
        <tr>
          <td >
		  <input type="hidden" name="authorid" value="<%=(String)session.getAttribute("loginid")%>" />
  		  <input type="hidden" name="author" value="<%=(String)session.getAttribute("user")%>" />
		  </td>
          </tr>
      </table>
      <table>
      
      <div class="row align-items-center">
      <div class="col-sm-4">
                <div class="form-group">
                    <label for="form_id">Employee ID</label>
                    <input id="form_id" type="text" name="employeeid" class="form-control" placeholder="Please enter employee id *" required="required" data-error="Id is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            </div>
      <div class="row align-items-center">
            <div class="col-sm-4">
                <div class="form-group">
                    <label for="form_name">Employee Full Name</label>
                    <input id="form_name" type="text" name="employeename" class="form-control" placeholder="Please enter employee name *" required="required" data-error="Name is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">	
                    <label for="form_hiredate">Hire Date(MM/DD/YYYY)</label>
                    <input id="form_hidate" type="text" name="hiredate" class="form-control" placeholder="Please enter hire date *" required="required" data-error="HireDate is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        </div>
        <div class="row align-items-center">
            <div class="col-sm-4">
                <div class="form-group">
                    <label for="form_sin">SIN Number</label>
                    <input id="form_sin" type="text" name="sin" class="form-control" placeholder="Please enter employee SIN *" required="required" data-error="SIN is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">	
                    <label for="form_gross">Gross Annual Income</label>
                    <input id="form_gorss" type="text" name="gross" class="form-control" placeholder="Please enter Gross *" required="required" data-error="Amount is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        </div> <div class="row align-items-center">
            <div class="col-sm-4">
                <div class="form-group">
                    <label for="form_hours">Hours Per week</label>
                    <input id="form_name" type="text" name="hours" class="form-control" placeholder="Please enter hours *" required="required" data-error="SIN is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">	
                    <label for="form_garnishment">Garnishment Amount</label>
                    <input id="form_garnishment" type="text" name="garnishment" class="form-control" placeholder="Please enter Garnishment" >
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        </div>
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
