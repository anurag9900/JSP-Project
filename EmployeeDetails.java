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


@WebServlet("/EmployeeDetails")
public class EmployeeDetails extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String login_id=Login.loginid;
		String login_type=Login.type;
		String employeeid=request.getParameter("employeeid");
		String employee_name = null;
		String employee_hiredate = null;
		String employee_sin=null;
		String employee_gross=null;
		String employee_hours=null;
		String employee_garnishment=null;
		String employee_status=null;
		boolean flag=false;
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		    Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=payroll;user=anurag;password=1234");
		   	Statement stmt = con.createStatement();
		   	String query_check="select * from employee_details where employeeid='"+employeeid+"'";
		   	ResultSet rs1 = stmt.executeQuery(query_check);  
		   	while(rs1.next())
			{	
		   		employee_name=rs1.getString("Name");
		   		employee_hiredate=rs1.getString("HireDate");
		   		employee_sin=rs1.getString("sin");
		   		employee_gross=rs1.getString("gross");
		   		employee_hours=rs1.getString("hours");
		   		employee_garnishment=rs1.getString("garnishment");
		   		employee_status=rs1.getString("Status");
		   		break; 
			}	
		   	rs1.close();
		   	HttpSession session=request.getSession();	
		   	session.setAttribute("employee_name", employee_name);
		   	session.setAttribute("employee_id", employeeid);
		   	session.setAttribute("employee_hiredate", employee_hiredate);
		   	session.setAttribute("employee_sin", employee_sin);
		   	session.setAttribute("employee_gross", employee_gross);
		   	session.setAttribute("employee_hours", employee_hours);
		   	session.setAttribute("employee_garnishment", employee_garnishment);
		   	session.setAttribute("employee_status", employee_status);
		   	
		   	
		   	if(login_type.equals("HR"))
		   	{
		   		RequestDispatcher rd=request.getRequestDispatcher("displayemployeedetails.jsp");
				rd.forward(request, response);
		   	}
			else{
				RequestDispatcher rd=request.getRequestDispatcher("e_displayemployeedetails.jsp");
				rd.forward(request, response);
			}
		}catch(Exception e){
			System.out.print(e);
		}
				
	}

}
