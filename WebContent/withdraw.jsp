<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<div>
	<jsp:include page="Header.jsp"/>
</div>
<body background ="images/back151.jpg">
<div style="padding: 10px 0px 20px 380px;">
<% session=request.getSession(false); %>
<%
if(session.getAttribute("user")==null){
	
	response.sendRedirect("Login.jsp");
	out.print("Please Login First");
}

%>
</div>
<div  style="margin: 0px    555px 10px  510px;black;">
<h1 style="  ">Withdraw Form</h1> 
</div>
<div  style="margin: 0px 10px 10px  400px;border-radius: 10px;  display: inline-block;;background-color:black;color:white;">

<form action ="withdraw2.jsp" method="post" style="padding:10px 20px 10px 20px;">
<br>
        
        
        
            
        <label style="font-family:cursive">Enter Amount To Be Withdrawn:&nbsp;</label> <input id = "amount"type= "number" name ="amount"> 
        <br>
        <br>
        <label style="font-family:cursive">Account Owner's Password : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <input name ="puser" id = "p1"type= "password" required>
        <br>
        <br>
        <label style="font-family:cursive">Branch-Manager's Password : &nbsp;&nbsp;&nbsp;&nbsp;</label> <input name ="pmanager" id = "p1"type= "password" required>
        <div style="padding : 0px 20px 5px 130px;">
            <input type ="submit" value ="Withdraw">
            </div>
            </form>
</div>
</body>
</html>