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


@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String employeeid=request.getParameter("employeeid");
		String password=request.getParameter("password");
		String repassword=request.getParameter("repassword");
		boolean flag=false;
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		    Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=payroll;user=anurag;password=1234");
		   	Statement stmt = con.createStatement();
		   	String query_check="select employeeid from employee_details where employeeid='"+employeeid+"'";
		   	
			HttpSession session=request.getSession();
		   	if(!password.equals(repassword)) {
		   		session.setAttribute("msg", "blank");
			   	RequestDispatcher rd=request.getRequestDispatcher("signup.jsp?msg=blank");
				rd.forward(request, response);
		   	}else {
		   	ResultSet rs1 = stmt.executeQuery(query_check);
		   	String query= "insert into login values('"+employeeid+"','"+password+"');";
		   	stmt.executeUpdate(query);
		   	rs1.close();
		   	RequestDispatcher rd=request.getRequestDispatcher("signup.jsp?msg=success");
			rd.forward(request, response);
		   	}
		}catch(Exception e){
			System.out.print(e);
		}
				
	}

}
