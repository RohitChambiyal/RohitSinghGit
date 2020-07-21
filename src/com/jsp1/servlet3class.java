package com.jsp1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletContext;
////import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import javax.swing.JOptionPane;

//public class servlet3class extends HttpServlet{
public class servlet3class{
static String s;


public static String set(String x) {
	s = x;
	return("done");
}

public static String get() {
	
	return(s);
}

public static boolean heys(String a,String b,String phone, String age, String address)  {
	 boolean checking=false;
	 int amount =0;
	 String imgs = "images/defaultprofilepic.jpg";
	Connection con = null;
	Statement st=null;
	ResultSet rs = null;
	boolean re = false;

	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
	System.out.println("class nhi mili");
	System.out.println("class not found");		
	}

	
	try {
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db2","root","helloworld");
	} catch (SQLException e11) {
		System.out.println("Mysql databse load ni hua");
		// TODO Auto-generated catch block
		e11.printStackTrace();
	}
//	try {
//		st = con.createStatement();
//	} catch (SQLException e1) {
//		// TODO Auto-generated catch block
//		System.out.println("Mysql databse load ni hua");
//		e1.printStackTrace();
//	}
	
	try {
		// String s1 ="select uname from NEWACCOUNT where upper(uname) = '"+a+";'";
		String s1 ="select * from NEWACCOUNT ";

		PreparedStatement pst = con.prepareStatement(s1);
		pst.execute();
		rs = pst.getResultSet();
		while(rs.next()) {
		if(rs.getString(2).equalsIgnoreCase(a) ||a.isEmpty()==true) {
				checking = true;
			
				System.out.println("user already present");
				
			}
			
		}
		if(checking==false && a.isEmpty()==false && b.isEmpty()==false) {
			System.out.println(phone);
		String s = "insert into NEWACCOUNT values(NULL,'"+a+"','"+b+"',"+amount+",'"+address+"',"+age+",'"+phone+"','"+imgs+"');";
		
		PreparedStatement pst1 = con.prepareStatement(s);
		pst1.execute();
		rs = pst1.getResultSet();
		 System.out.println("added user");
		
		 String s2 = "CREATE TABLE "+a+"_detail (SEQNO INT UNSIGNED NOT NULL AUTO_INCREMENT, TYPE VARCHAR(20), AMOUNT INT(40), DATE VARCHAR(40),PRIMARY KEY(SEQNO), USER1 VARCHAR(30),USER2 VARCHAR(30),BALANCE INT(40));";
			
			PreparedStatement pst2 = con.prepareStatement(s2);
			pst2.execute();
			rs = pst2.getResultSet();
			re =true;
	
	
		}
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		//System.out.println("not correct");
		e1.printStackTrace();
		re = false;
	}
	
	if(re==true) {
		return true;
	}
	else{
		return false;
	}
	
	
	
}


//Amount depositing


public static boolean Deposit(int amount,String upass,String mpass,String holder)  {
	 boolean mchecking=false;
	 boolean uchecking=false;
	int amountold =0; 
	Connection con = null;
	Statement st=null;
	ResultSet rs = null;
	boolean re = false;
	int am =amount;
	String d= (new java.util.Date()).toLocaleString();

	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
	System.out.println("class nhi mili");
	System.out.println("class not found");		
	}

	
	try {
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db2","root","helloworld");
	} catch (SQLException e11) {
		// TODO Auto-generated catch block
		e11.printStackTrace();
	}
	try {
		st = con.createStatement();
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
	try {
		String s1 ="select adminpass from admin;";
		

		PreparedStatement pst = con.prepareStatement(s1);
		pst.execute();
		rs = pst.getResultSet();
		while(rs.next()) {
		if(rs.getString(1).equals(mpass)&& mpass.isEmpty()==false) {
				mchecking = true;
			
				System.out.println("manager password correct");
				
			}
			
		}
		
		String s2 ="select PASSWORD,AMOUNT from NEWACCOUNT where USERNAME ='"+holder+"' and PASSWORD ='"+upass+"';";
		

		

		PreparedStatement pst2 = con.prepareStatement(s2);
		pst2.execute();
		rs = pst2.getResultSet();
		
		while(rs.next()) {
			
			if(rs.getString(1).equals(upass)&& upass.isEmpty()==false) {
				uchecking = true;
			
				System.out.println("user password correct");
				
			}
			amountold=Integer.parseInt(rs.getString(2));
			
			
		}
		
		
		
		if(uchecking==true&&mchecking==true &&  upass.isEmpty()==false &&holder.isEmpty()==false) {
			System.out.println(amount);
			amount = amountold + amount;
			System.out.println(amount);
			
		String s = "update NEWACCOUNT set AMOUNT= "+amount+" where USERNAME ='"+holder+"' and PASSWORD ='"+upass+"';";
		
		PreparedStatement pst1 = con.prepareStatement(s);
		pst1.execute();
		rs = pst1.getResultSet();
		

String s4 = "insert into "+holder+"_detail values(null, 'Deposit',"+ am+", '"+d+"','-', '"+holder+"',"+amount+");";
			
			PreparedStatement pst4 = con.prepareStatement(s4);
			pst4.execute();
			rs = pst4.getResultSet();
			
		re =true;
		 System.out.println("added amount");
		
		}
	} catch (Exception e1) {
		// TODO Auto-generated catch block
		System.out.println("not correct");
		
		re = false;
	}
	
	if(re==true) {
		System.out.println("yes");
		return true;
		
	}
	else{
		return false;
	}
	
	
	
}


//Amount withdraw


public static boolean Withdraw(int amount,String upass,String holder,String mpass)  {
	 boolean bchecking = false;
	 boolean uchecking=false;
	 boolean mchecking = false;
	int amountold =0; 
	Connection con = null;
	Statement st=null;
	ResultSet rs = null;
	boolean re = false;
	int am = amount;
	String d= (new java.util.Date()).toLocaleString();
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
	System.out.println("class nhi mili");
	System.out.println("class not found");		
	}

	
	try {
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db2","root","helloworld");
	} catch (SQLException e11) {
		// TODO Auto-generated catch block
		e11.printStackTrace();
	}
	try {
		st = con.createStatement();
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
	try {
		
String s1 ="select adminpass from admin;";
		

		PreparedStatement pst = con.prepareStatement(s1);
		pst.execute();
		rs = pst.getResultSet();
		while(rs.next()) {
		if(rs.getString(1).equals(mpass)&& mpass.isEmpty()==false) {
				mchecking = true;
			
				System.out.println("manager password correct");
				
			}
			
		}
		
		String s2 ="select PASSWORD,AMOUNT from NEWACCOUNT where USERNAME ='"+holder+"' and PASSWORD ='"+upass+"';";
		

		

		PreparedStatement pst2 = con.prepareStatement(s2);
		pst2.execute();
		rs = pst2.getResultSet();
		
		while(rs.next()) {
			
			if(rs.getString(1).equals(upass)&& upass.isEmpty()==false) {
				uchecking = true;
				
				System.out.println("user password correct");
				
			}
			amountold=Integer.parseInt(rs.getString(2));
			
			
		}
		
		amount = amountold - amount;
		if(amount<0) {
			bchecking=false;
			throw new ArithmeticException("its fault");
		}
		else if(amount>0){
			bchecking =true;
		}
		
		if(mchecking ==true&&uchecking==true && bchecking==true&&  upass.isEmpty()==false &&holder.isEmpty()==false) {
			System.out.println(amount);
			
			System.out.println(amount);
			
		String s = "update NEWACCOUNT set AMOUNT= "+amount+" where USERNAME ='"+holder+"' and PASSWORD ='"+upass+"';";
		
		PreparedStatement pst1 = con.prepareStatement(s);
		pst1.execute();
		rs = pst1.getResultSet();
		

String s4 = "insert into "+holder+"_detail values(null, 'Withdraw',"+ am+", '"+d+"', '"+holder+"','-',"+amount+");";
			
			PreparedStatement pst4 = con.prepareStatement(s4);
			pst4.execute();
			rs = pst4.getResultSet();
		
		
		re =true;
		 System.out.println("added Deducted");
		}
	} catch (Exception e1) {
		// TODO Auto-generated catch block
		//System.out.println("not correct");
		e1.printStackTrace();
		re = false;
	}
	
	if(re==true) {
		return true;
	}
	else{
		return false;
	}
	
	
	
}


//Amount transfer


public static boolean Transfer(int amount,String upass,String accname,int accno,String holder)  {
	 boolean bchecking = false;
	 boolean uchecking=false;
	 boolean mchecking=false;
	int amountoldsender =0;
	int amountoldreceiver =0;
	Connection con = null;
	Statement st=null;
	ResultSet rs = null;
	boolean re = false;
	 String d= (new java.util.Date()).toLocaleString();
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
	System.out.println("class nhi mili");
	System.out.println("class not found");		
	}

	
	try {
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db2","root","helloworld");
	} catch (SQLException e11) {
		// TODO Auto-generated catch block
		e11.printStackTrace();
	}
	try {
		st = con.createStatement();
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
	try {
		String s2 ="select PASSWORD,AMOUNT from NEWACCOUNT where USERNAME ='"+holder+"' and PASSWORD ='"+upass+"';";
		PreparedStatement pst2 = con.prepareStatement(s2);
		pst2.execute();
		rs = pst2.getResultSet();
		
		while(rs.next()) {
			
			if(rs.getString(1).equals(upass)&& upass.isEmpty()==false) {
				uchecking = true;
				
				System.out.println("user password correct");
				
			}
			amountoldsender=Integer.parseInt(rs.getString(2));
			
			
		}
		
		amountoldsender = amountoldsender - amount;
		
		String s1 ="select AMOUNT from NEWACCOUNT where USERNAME ='"+accname+"' and  ACCOUNTNO ="+accno+";";
		PreparedStatement pst1 = con.prepareStatement(s1);
		pst1.execute();
		rs = pst1.getResultSet();
		
		while(rs.next()) {
			mchecking =true;
			
			amountoldreceiver=Integer.parseInt(rs.getString(1));
			
			
		}
		
		amountoldreceiver = amountoldreceiver + amount;
		System.out.println(amountoldreceiver);
		
		if(amountoldsender<0) {
			bchecking=false;
			throw new ArithmeticException("its fault");
		}
		else if(amountoldsender>0){
			bchecking =true;
		}
		
		if(uchecking==true && bchecking==true&& mchecking==true&& upass.isEmpty()==false &&holder.isEmpty()==false) {
		
		String s = "update NEWACCOUNT set AMOUNT= "+amountoldsender+" where USERNAME ='"+holder+"' and PASSWORD ='"+upass+"';";
		
		PreparedStatement pst1ss = con.prepareStatement(s);
		pst1ss.execute();
		rs = pst1ss.getResultSet();
		
		String ss = "update NEWACCOUNT set AMOUNT= "+amountoldreceiver+" where USERNAME ='"+accname+"' and ACCOUNTNO ="+accno+";";
		
			PreparedStatement pst1s = con.prepareStatement(ss);
			pst1s.execute();
			rs = pst1s.getResultSet();
		
			
			String s3 = "insert into "+holder+"_detail values(null, 'Transfer',"+ amount+", '"+d+"', '"+holder+"','"+accname+"',"+amountoldsender+");;";
			
			PreparedStatement pst1sss = con.prepareStatement(s3);
			pst1sss.execute();
			rs = pst1sss.getResultSet();		
			
String s4 = "insert into "+accname+"_detail values(null, 'Transfer',"+ amount+", '"+d+"', '"+holder+"','"+accname+"',"+amountoldreceiver+");;";
			
			PreparedStatement pst4 = con.prepareStatement(s4);
			pst4.execute();
			rs = pst4.getResultSet();		
			
			
			
			
			
			re =true;
		 System.out.println("added Deducted");
		}
	} catch (Exception e1) {
		// TODO Auto-generated catch block
		//System.out.println("not correct");
		e1.printStackTrace();
		re = false;
	}
	
	if(re==true) {
		return true;
	}
	else{
		return false;
	}
	
	
	
}


/*

//main	/*
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException{
		HttpSession session = req.getSession(false);
		if(session==null) {
			session.invalidate();
			res.sendRedirect("first.html");
		}
		else {
		String n1 =req.getParameter("uname");
		boolean done;
		String n2 =req.getParameter("pname");
		String n3= req.getParameter("pnumber");
		String n4= req.getParameter("age");
		String n5= req.getParameter("address");
		PrintWriter out = res.getWriter();
		
		System.out.println(n1);
		System.out.println(n2);
		
		done = heys(n1,n2,n3,n4,n5);
		if(done ==true) {
			out.println("user added");
			res.sendRedirect("first.html");
		}
		else {
			System.out.println("user not added");
			out.println("</script> <script>  alert('User not added')</script>");
    
			res.sendRedirect("signup.html");
		}
			
	}
		}*/
	
	
	
}
