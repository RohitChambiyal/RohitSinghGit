<%@page import="java.util.Scanner"%>
<%@page import="java.io.File"%>
<%@page import="com.jsp1.servlet3class"%>  
<%@page import="java.sql.*"%>  


<%@ page import="com.oreilly.servlet.MultipartRequest" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<div>
	<jsp:include page="Header.jsp"/>
</div>
<body background ="images/back151.jpg">

<% session=request.getSession(false); %>
<div style="padding: 10px 0px 60px 380px;">
<% session=request.getSession(false); %>
<%
if(session.getAttribute("user")==null){
	
	response.sendRedirect("Login.jsp");
	out.print("Please Login First");
}

%>

<br>
</div>


    <%  
    MultipartRequest m = new MultipartRequest(request, "/media/rohit/The Castle/Java/Workspace/myBanking/WebContent/images");
    

Scanner myScanner = null;





File f =m.getFile("hello");
String s=f.getName();
out.print("<br>");
servlet3class.set(s);


String i ="images/"+s;




      
    %>  
   
<div align="center">
<h1>Profile Picture Updated</h1>
Please reload image by right clicking if doesn't load<img src="images/greentick2.png" >
</div>
    <%
boolean checking=false;
Connection con = null;
Statement st=null;
ResultSet rs = null;
boolean re = false;
String uname = (String)session.getAttribute("user");


try {
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db2","root","helloworld");
} catch (Exception e11) {
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
	
	
	String s2 ="UPDATE NEWACCOUNT SET IMAGENAME ='"+i+"'  where USERNAME ='"+uname+"' ;";
	System.out.println(s2);
	PreparedStatement pst2 = con.prepareStatement(s2);
	pst2.execute();
	rs = pst2.getResultSet();
	
	
} catch (Exception e1) {
	// TODO Auto-generated catch block
	//System.out.println("not correct");
	e1.printStackTrace();
	re = false;
}
%>
    
    
    
</body>
</html>