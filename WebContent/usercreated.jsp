<%@page import="com.jsp1.servlet3class"%>  

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
<% 
	String holder= (String)session.getAttribute("user");
%>
<div align="center">
<h1>Account Creation Status</h1>
Account Created<img src="images/greentick2.png" >
</div>



</body>
</html>