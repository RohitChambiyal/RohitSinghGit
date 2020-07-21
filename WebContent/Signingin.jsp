<%@page import="com.jsp1.servlet3class"%>  

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  session.invalidate();  %>

<% String user= request.getParameter("uname");
	String phone = request.getParameter("pnumber");
	String age = request.getParameter("age");
	String address = request.getParameter("address");
	String p = request.getParameter("pname");
	boolean statuss = servlet3class.heys(user,p,phone,age,address);
	out.print(statuss);
	%>
	
<%
if(statuss==true){
	out.print("User Created");
//response.sendRedirect("Login.jsp"); %>
	<jsp:forward page="usercreated.jsp"></jsp:forward>
<%}
else{
		//response.sendRedirect("Signup.jsp");
		out.print("user creation failed"); %>
		<jsp:forward page="failedusercreation.jsp"></jsp:forward><%
	}%>
	


</body>
</html>