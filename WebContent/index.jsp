<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html lang="en">
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
<div >
<nav class="navbar navbar-default">
  
    
    <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Payroll Engine</a>
    </div>
    <ul class="nav navbar-nav " style="float: right">
      <li><a href="index.jsp">Home</a></li>
      <li><a href="login.jsp?type=HR">HR</a></li>
      <li><a href="login.jsp?type=Employee">Employee</a></li>
      <li><a href="MailInfo.jsp">Contact</a></li>
    </ul>
  </div>
 

</nav>
</div>
 <center>
 <h1 class="my-4">Welcome to Payroll Engine</h1>
<img src="images/payroll.jpg" style="width: 550px!important;"><br>
</center>

<div class="row">

<div class="container">

    

    <!-- Marketing Icons Section -->
    <div class="row">
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Payroll Engine</h4>
          <div class="card-body">
            <p class="card-text">This Engine help in administration of Employee's financial records, including salaries, wages, bonuses, deductions and net pay. Payroll register keeps track of all Employees information and organize payroll tasks.</p>
          </div>
         </div>
      </div>
      </div>
      </div>
      </div>
</body>
</html>
