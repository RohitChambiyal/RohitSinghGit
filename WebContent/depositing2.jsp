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
	String holder= (String)session.getAttribute("user");
	int amount=Integer.parseInt(request.getParameter("amount"));
	String puser = request.getParameter("puser");
	String pmanager = request.getParameter("pmanager");
	boolean statuss = servlet3class.Deposit(amount,puser,pmanager,holder);
	out.print(statuss);
	%>
<%
if(statuss==true){
	out.print("Amount Added");
//response.sendRedirect("Login.jsp"); %>
	<jsp:forward page="confirmdeposit.jsp"></jsp:forward>
<%}
else{
		//response.sendRedirect("Signup.jsp");
		out.print("Amount Depositing failed"); %>
		<jsp:forward page="faileddeposit.jsp"></jsp:forward><%
	}%>
	



</body>
</html>