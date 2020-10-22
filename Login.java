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

@WebServlet("/Login")
public class Login extends HttpServlet {
	
	public static String loginid;
	public static String type;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//loginid=request.getParameter("loginid");
		loginid=request.getParameter("loginid");
		String password=request.getParameter("password");
		type=request.getParameter("type");
		StringBuffer errorBuffer = new StringBuffer();
		boolean flag=false;
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		    Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=payroll;user=anurag;password=1234");
		   	Statement stmt = con.createStatement();
		   	String query = "select * from login where loginid ='" + loginid+"'";
		   			//+ "' and type='"+type+"'";
		   	ResultSet rs = stmt.executeQuery(query);
			while(rs.next())
			{
				String pass= rs.getString("loginpassword");
			 	if( pass.equals(password)) {
					flag=true;
					break;
				}		
			}	
			if (flag){
			
				HttpSession session=request.getSession();
				session.setAttribute("login", "yes");
				//session.setAttribute("type", rs.getString("type"));
				//session.setAttribute("user", rs.getString("name"));
				session.setAttribute("loginid", rs.getString("loginid"));
				RequestDispatcher rd=null;
				rs.close();
				if("Employee".equals(type))
					rd=request.getRequestDispatcher("employeelogin.jsp");
				else if("HR".equals(type))
					rd=request.getRequestDispatcher("HRlogin.jsp");
				rd.forward(request, response);
			}
			else{HttpSession session=request.getSession();
			 	session.setAttribute("msg", "loginerror");
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp?msg=loginerror");
				rd.forward(request, response);
			}
		}catch(Exception e){
			System.out.print(e);
		}
				
	}

}

