<%@page import="com.jsp1.servlet3class"%>  

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<div >
	<jsp:include page="Header.jsp"/>
</div>
<body background ="images/back151.jpg">
<% session=request.getSession(false); %>
<% 
	String holder= (String)session.getAttribute("user");
%>
<div align="center">
<h1>Money Transfer Status</h1>
<img src="images/redcross2.png" >Failed to Transfer Money
</div>



</body>
</html>