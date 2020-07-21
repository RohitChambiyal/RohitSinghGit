<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.jsp1.servlet3class"%>
<%@page import="java.sql.*"%>  

    
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
<div >
<% session=request.getSession(false); %>
<%
if(session.getAttribute("user")==null){
	
	response.sendRedirect("Login.jsp");
	out.print("Please Login First");
}

%>


</div>
<div style="margin:0px 0px 0px 80px;background-image:url(image/back151.jpg);z-index: -90;" >
<%
boolean checking=false;
String reqtype= request.getParameter("reqtype");
String category=request.getParameter("category");
String email=request.getParameter("email");
String issue= request.getParameter("issue");
String uname = (String)session.getAttribute("user");
String cno ="";
Connection con = null;
Connection con2 = null;
Statement st=null;
Statement st2=null;
ResultSet rs = null;
ResultSet rs2 = null;
boolean re = false;
try {
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db2","root","helloworld");
	con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db2","root","helloworld");
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
	String s2 ="INSERT INTO COMPLAINT VALUES(null,'"+uname+"','"+reqtype+"','"+category+"','"+email+"','"+issue+"','Pending','Waiting');";
	System.out.println(s2);
	PreparedStatement pst2 = con.prepareStatement(s2);
	pst2.execute();
	rs = pst2.getResultSet();
	re =true;


	
} catch (Exception e1) {

	System.out.println(e1);
	e1.printStackTrace();
	re = false;

}

%>
<%if (re==true){ %>
<div align="center">
<h1>Request Registration Status</h1>
<h2>Request ID : <%=cno%></h2>
Request Registered Successfully<img src="images/greentick2.png" >
</div>
<%} else if(re==false){ %>
<div align="center">
<h1>Request Registration Status</h1>

Request Registration Failed<img src="images/redcross2.png" >
</div>
<%} %>



</div>
</body>
</html>