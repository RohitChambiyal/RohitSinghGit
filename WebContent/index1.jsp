<%@page import="com.jsp1.secclass"%>  

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<jsp:include page="Header.jsp"/>

</div>

<%! String name = "yes"; %>
<% session.setAttribute("nam",name); %>
<%! int x =5; %>
<h1> Enter The number whose table you want :</h1>

<form action = "Check.jsp">
<input type="number" name = "hel" placeholder="enter name">
<input type ="submit">

</form>
</body>
</html>