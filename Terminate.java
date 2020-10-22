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


@WebServlet("/Terminate")
public class Terminate extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String employeeid=request.getParameter("employeeid");
		String termdate=request.getParameter("termdate");
		boolean flag=false;
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		    Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=payroll;user=anurag;password=1234");
		   	Statement stmt = con.createStatement();
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
		   	HttpSession session=request.getSession();	
		   	if(flag==true)
		   	{
		   	String query= "update employee_details set status='Terminated',termdate='"+termdate+"' where employeeid='"+employeeid+"'";
		   	stmt.executeUpdate(query);
		   	session.setAttribute("msg", "success");
		   	RequestDispatcher rd=request.getRequestDispatcher("terminate.jsp?msg=success");
			rd.forward(request, response);
		   	}
			else{
			 	session.setAttribute("msg", "notsuccess");
				RequestDispatcher rd=request.getRequestDispatcher("terminate.jsp?msg=notsuccess");
				rd.forward(request, response);
			}
		}catch(Exception e){
			System.out.print(e);
		}
				
	}

}
