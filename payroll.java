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


@WebServlet("/runpayroll")
public class payroll extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String employeeid=request.getParameter("employeeid");
		String payperiodnumber=request.getParameter("payperiodnumber");
		String employee_name=null;
		String StartDate=null;
		String EndDate=null;
		String employee_hours=null;
		String employee_gross=null;
		String employee_fedtax=null;
		String employee_cpp=null;
		String employee_ei=null;
		String employee_garnishment=null;
		String employee_deductions=null;
		String employee_netpay=null;
		String employee_status=null;
		boolean flag=false;
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		    Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=payroll;user=anurag;password=1234");
		   	Statement stmt = con.createStatement();
		   	String query_check="select * from employee_details where employeeid='"+employeeid+"'";
		   	ResultSet rs1 = stmt.executeQuery(query_check);	
		   	while(rs1.next())
			{	String pass= rs1.getString("employeeid");
			 	if( pass.equals(employeeid)) {
			 		employee_name=rs1.getString("name");
				   	employee_hours=rs1.getString("hours");
				   	employee_garnishment=rs1.getString("garnishment");
				   	employee_status=rs1.getString("status");
				   	employee_gross=rs1.getString("gross");
					flag=true;
					break;
				}		
			}	
		   	rs1.close();
		   	HttpSession session=request.getSession();	
		   	if(flag==false) {
		   		
		   	session.setAttribute("msg", "failed");
		   	RequestDispatcher rd=request.getRequestDispatcher("runpayroll.jsp?msg=failed");
			rd.forward(request, response);
		   	}
			if(!employee_status.equals("Active")) {
			   	session.setAttribute("msg", "inactive");
			   	RequestDispatcher rd=request.getRequestDispatcher("runpayroll.jsp?msg=inactive");
				rd.forward(request, response);
			   	}
			
			
			if(payperiodnumber.equals("1"))
			{
				StartDate="01/01/2020";
				EndDate="01/31/2020";
			}
			else if(payperiodnumber.equals("2"))
			{
				StartDate="02/01/2020";
				EndDate="02/29/2020";
			}
			else if(payperiodnumber.equals("3")) {
				StartDate="03/01/2020";
				EndDate="03/31/2020";
			}
			else if(payperiodnumber.equals("4"))
			{
				StartDate="04/01/2020";
				EndDate="04/30/2020";
			}
			else if(payperiodnumber.equals("5")) {
				StartDate="05/01/2020";
				EndDate="05/31/2020";
			}
			else if(payperiodnumber.equals("6")) {
				StartDate="06/01/2020";
				EndDate="06/30/2020";
			}
			else if(payperiodnumber.equals("7")) {
				StartDate="07/01/2020";
				EndDate="07/30/2020";
			}
			else if(payperiodnumber.equals("8")) 
			{
				StartDate="08/01/2020";
				EndDate="08/31/2020";
			}
			else if(payperiodnumber.equals("9"))
			{
				StartDate="09/01/2020";
				EndDate="09/30/2020";
			}
			else if(payperiodnumber.equals("10")) {
				StartDate="10/01/2020";
				EndDate="10/31/2020";
			}
			else if(payperiodnumber.equals("11")) {
				StartDate="11/01/2020";
				EndDate="11/30/2020";
			}
			else if(payperiodnumber.equals("12")) {
				StartDate="12/01/2020";
				EndDate="12/31/2020";
			}
		   	if(flag==true)
		   	{
		   		double pay_month=Double.parseDouble(employee_gross)/12;
			   	double fedtax=pay_month*0.13;
			   	double cpp=pay_month*0.05;
			   	double ei=pay_month*0.07;
			   	double deduc=fedtax+cpp+ei;
			   	double net_pay=pay_month-deduc;
			   	employee_fedtax=Double.toString(fedtax);
			   	employee_cpp=Double.toString(cpp);
			   	employee_ei=Double.toString(ei);
			   	employee_deductions=Double.toString(deduc);
			   	employee_netpay=Double.toString(net_pay);
			   	
		   	String query= "insert into payroll_details values('"+employeeid+"','"+employee_name+"','"+payperiodnumber+"','"+StartDate+"','"+EndDate+"',"+employee_hours+","+employee_gross+","+employee_fedtax+","+employee_cpp+","+employee_ei+","+employee_garnishment+","+employee_deductions+","+employee_netpay+");";
		   	stmt.executeUpdate(query);
		   	RequestDispatcher rd=request.getRequestDispatcher("runpayroll.jsp?msg=success");
			rd.forward(request, response);
		   	}
		}catch(Exception e){
			System.out.print(e);
		}
				
	}

}
