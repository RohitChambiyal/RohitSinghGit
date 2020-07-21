<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>

<body background="images/bag1.jpg">

<!-- background="https://cdn.pixabay.com/photo/2016/04/15/04/02/water-1330252_960_720.jpg"  style=" background-size: auto;background-repeat:no-repeat;" -->
<div>
	<jsp:include page="Header.jsp"/>
</div>
<% session.invalidate(); %>

<div style="margin: 80px 0px 60px 470px;">

 <form action="Check.jsp" method ="post" style="padding:10px 0px 0px 110px;">
 <h1 style="color:white;border-left:solid 4px red;border-radius:4px;">Login Here</h1>
<!-- 
Get: can use doGet or doPost (when using get appended in url and sent to server)
Post:
 -->
<input type="text" name ="username" placeholder="Enter username" required>
<br><br>
<input type="password" name ="pass" placeholder="Enter pass" required>
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Sign In">

</form> 
</div>
</body>
</html>
