<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% session= request.getSession(false); %>

<div style="border-left: 6px solid red; border-radius:5px;
  background-color: black;padding: 0px 0px 20px 20px; background-image:url('images/.jpg');">
<div style="padding:10px 0px 0px 390px;color :white;font-size:30px;">
Welcome To INDIAN BANK Portal


<img style="padding:0px 0px 0px 190px;"align="middle" width="90"  height = "90"src="images/banklogo1.jpg">


</div>

<button style="margin:0px 0px 0px 30px;"><a href="Login.jsp">LOGIN</a></button>
<button style="margin:0px 0px 0px 30px;"><a href="Welcome.jsp">MY ACCOUNT</a></button>
<!-- close account/ Balance/ Details(summary)/ Donation -->
<button style="margin:0px 0px 0px 30px;"><a href="withdraw.jsp">WITHDRAW</a></button>
<button style="margin:0px 0px 0px 30px;"><a href="transfer.jsp">TRANSFER</a></button>
<button style="margin:0px 0px 0px 30px;"><a href="depositing.jsp">DEPOSIT</a></button> 
<button style="margin:0px 0px 0px 30px;"><a href="Signup.jsp">NEW ACCOUNT</a></button>
<button style="margin:0px 0px 0px 30px;"><a href="about.jsp">ABOUT</a></button>
<button style="margin:0px 0px 0px 30px;"><a href="request.jsp">REQUEST</a></button>
<button style="margin:0px 0px 0px 30px;"><a href="Logout.jsp">LOGOUT</a></button>
</div>
</body>
</html>