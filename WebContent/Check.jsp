<%@page import="com.jsp1.secclass"%> 
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

<body>
<% session=request.getSession(false); %>

<% String user= request.getParameter("username");
	String p = request.getParameter("pass");
	boolean status = secclass.hey(user,p);
	out.print(status);
	%>
	
<%
if(status==true){
session.setAttribute("user", user); }
else{
	session=null;}%>

<%
if(session!=null){
	response.sendRedirect("Welcome.jsp");
}
else{
	response.sendRedirect("loginfailed.jsp");
}
%>
	
	
</body>
</html>