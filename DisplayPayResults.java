package Payroll_JSP;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/DisplayPayResults")
public class DisplayPayResults extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String login_id=Login.loginid;
		String login_type=Login.type;
		String employeeid=request.getParameter("employeeid");
		String payperiodnumber=request.getParameter("payperiodnumber");
		String startdate=null;
		String enddate=null;
		String employee_hours=null;
		String employee_gross=null;
		String employee_fedtax=null;
		String employee_cpp=null;
		String employee_ei=null;
		String employee_garnishment=null;
		String employee_name = null;
		String employee_deductions=null;
		String employee_netpay=null;
		boolean flag=false;
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		    Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=payroll;user=anurag;password=1234");
		   	Statement stmt = con.createStatement();
		   	String query_check="select * from payroll_details where employeeid='"+employeeid+"' and payperiod='"+payperiodnumber+"';";
		   	ResultSet rs1 = stmt.executeQuery(query_check);  
		   	
		   	while(rs1.next())
			{	
		   		employee_name=rs1.getString("EmployeeName");
		   		startdate=rs1.getString("StartDate");
		   		enddate=rs1.getString("EndDate");
		   		employee_hours=rs1.getString("hours");
		   		employee_gross=rs1.getString("gross");
		   		employee_fedtax=rs1.getString("FedTax");
		   		employee_cpp=rs1.getString("CPP");
		   		employee_ei=rs1.getString("EI");
		   		employee_garnishment=rs1.getString("Garnishment");
		   		employee_deductions=rs1.getString("TotalDeductions");
		   		employee_netpay=rs1.getString("NetPay");
		   		break; 
			}	
		   	rs1.close();
		   	HttpSession session=request.getSession();	
		   	session.setAttribute("employee_name", employee_name);
		   	session.setAttribute("employee_id", employeeid);
		   	session.setAttribute("startdate", startdate);
		   	session.setAttribute("enddate", enddate);
		   	session.setAttribute("employee_hours", employee_hours);
		   	session.setAttribute("employee_gross", employee_gross);
		   	session.setAttribute("employee_fedtax", employee_fedtax);
		   	session.setAttribute("employee_cpp", employee_cpp);
		   	session.setAttribute("employee_ei", employee_ei);
		   	session.setAttribute("employee_garnishment", employee_garnishment);
		   	session.setAttribute("employee_deductions", employee_deductions);
		   	session.setAttribute("employee_netpay", employee_netpay);
		   	if(login_type.equals("HR"))
		   	{
		   		RequestDispatcher rd=request.getRequestDispatcher("displaypayresults.jsp");
				rd.forward(request, response);
		   	}
			else{
				RequestDispatcher rd=request.getRequestDispatcher("e_displaypayresults.jsp");
				rd.forward(request, response);
			}
		}catch(Exception e){
			System.out.print(e);
		}
				
	}

}
