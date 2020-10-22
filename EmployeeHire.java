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


@WebServlet("/Hire")
public class EmployeeHire extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String employeeid=request.getParameter("employeeid");
		String employeename=request.getParameter("employeename");
		String hiredate=request.getParameter("hiredate");
		String sin=request.getParameter("sin");
		String gross=request.getParameter("gross");
		String hours=request.getParameter("hours");
		String garnishment=request.getParameter("garnishment");
		String status="Active";
		String TermDate="12/31/9999";
		boolean flag=false;
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		    Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=payroll;user=anurag;password=1234");
		   	Statement stmt = con.createStatement();
		   //	String query = "select * from login where loginid ='" + loginid+"'";
		   			//+ "' and type='"+type+"'";
		   	String query_check="select employeeid from employee_details where employeeid='"+employeeid+"'";
		   	ResultSet rs1 = stmt.executeQuery(query_check);
		   	   
		   	while(rs1.next())
			{
		   		String pass= rs1.getString("employeeid");
			 	if( pass.equals(employeeid)) {
					flag=true;
					break;
				}		
			}	
		   	rs1.close();
		   	String query_check_sin="select sin from employee_details where sin="+sin+"";
		   	ResultSet rs_sin = stmt.executeQuery(query_check_sin);	
		   	while(rs_sin.next())
			{	String pass= rs_sin.getString("sin");
			 	if( pass.equals(sin)) {
					flag=true;
					break;
				}		
			}	
		   	rs_sin.close();
		   	HttpSession session=request.getSession();	
		   	if(flag==false)
		   	{
		   	String query= "insert into employee_details values("+employeeid+",'"+employeename+"','"+hiredate+"',"+sin+","+gross+","+hours+","+garnishment+",'"+status+"','"+TermDate+"');";
		   	stmt.executeUpdate(query);
		   	session.setAttribute("msg", "success");
		   	RequestDispatcher rd=request.getRequestDispatcher("newhire.jsp?msg=success");
			rd.forward(request, response);
		   	}
			else{
			 	session.setAttribute("msg", "notsuccess");
				RequestDispatcher rd=request.getRequestDispatcher("newhire.jsp?msg=notsuccess");
				rd.forward(request, response);
			}
		}catch(Exception e){
			System.out.print(e);
		}
				
	}

}
