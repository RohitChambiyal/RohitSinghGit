package com.jsp1;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletConfig;
//import javax.servlet.ServletContext;
////import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import javax.swing.JOptionPane;

//public class secclass extends HttpServlet{
	
/*protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException{
		int n1 = Integer.parseInt(req.getParameter("n1"));
		int n2 = Integer.parseInt(req.getParameter("n2"));
		res.setContentType("text/html");
		
		res.getWriter().print("Sum is <b>"+(n1+n2)+"</b>");
		System.out.println("welcome to hello");
		

	}*/
public class secclass {	
public static boolean hey(String a,String b)  {
		 
	
			
				try {
					Class.forName("com.mysql.jdbc.Driver");
					System.out.println("class mil gyi");
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
				System.out.println("class nhi mili");
				System.out.println("class not found");		
				}
			

		Connection con = null;
		Statement st=null;
		ResultSet rs = null;
		System.out.println("driver called");
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db2","root","helloworld");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			System.out.println("error here");
		}
	
		
		try {
			String s1 ="select USERNAME,PASSWORD from NEWACCOUNT where USERNAME ='"+a+"' and PASSWORD ='"+b+"';";
			System.out.println(s1);

			PreparedStatement pst = con.prepareStatement(s1);
			pst.execute();
			rs = pst.getResultSet();
			
			
		}
		 catch (SQLException e1) {
			System.out.println("statement not run");
			
		}
		try {
			rs.next();
			String u=rs.getString(1);
			String s=rs.getString(2);
			System.out.println(rs.getString(1)+""+rs.getString(2));
			System.out.println(a+""+b);
			
					if( u.equals(a) &&s.equals(b)) {
						return true;
						
						
					}
					 
						else {
			return false;
			}
		}
		 catch (SQLException e1) {
			System.out.println("false in last catch");
			return false;
		}

	}
/*
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException{
		
		HttpSession session = req.getSession(false);
		System.out.println("first");
		String n11 =req.getParameter("n1");
		RequestDispatcher rd;
		String n2 =req.getParameter("n2");
		boolean x = false;
		
		PrintWriter out = res.getWriter();
		
		ServletContext config = getServletContext();
		String back = config.getInitParameter("back");
		
		//out.println("<a href='hello?n1="+n1+"'> click now </a>");
		
		System.out.println(back);
		res.setContentType("text/html");
		//res.getWriter().print("Sum is <b>"+(n1+n2)+"</b>");
		//System.out.println("welcome to hello");
	
			x= hey(n11,n2);
		if(x ==true) {
		System.out.println("found");
		//res.sendRedirect(first.html);
		session = req.getSession();
		session.setAttribute("user",n11);
		res.sendRedirect("welcomeclasss?n1="+n11+"");
		 
		
		
		}
		else if(x==false){
			System.out.println("not found");
			out.write("username not found");
			
			res.sendRedirect("first.html");
		
		}
		
		
	}
	*/
}
