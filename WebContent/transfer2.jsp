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
<% session=request.getSession(false); %>
<% 
	String accname= request.getParameter("accname");
	int accno=Integer.parseInt(request.getParameter("accno"));
	int amount=Integer.parseInt(request.getParameter("amount"));
	String holder= (String)session.getAttribute("user");

	String puser = request.getParameter("puser");
	
	boolean statuss = servlet3class.Transfer(amount,puser,accname,accno,holder);
	out.print(statuss);
	%>
<%
if(statuss==true){
	out.print("Amount Deducted");
//response.sendRedirect("Login.jsp"); %>
	<jsp:forward page="confirmtransfer.jsp"></jsp:forward>
<%}
else{
		//response.sendRedirect("Signup.jsp");
		out.print("Amount Deduction failed"); %>
		<jsp:forward page="failedtransfer.jsp"></jsp:forward><%
	}%>
	



</body>
</html>