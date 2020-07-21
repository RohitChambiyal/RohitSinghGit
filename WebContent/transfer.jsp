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
<div style="padding: 10px 0px  0px 380px;">
<% session=request.getSession(false); %>
<%
if(session.getAttribute("user")==null){
	
	response.sendRedirect("Login.jsp");
	out.print("Please Login First");
}

%>
</div>
</div>
<div  style="margin: 0px    545px 10px  520px;black;">
<h1 style="  ">Transfer Form</h1> 
</div>
<div  style="margin: 0px 10px 10px 410px ;border-radius: 10px;  display: inline-block;;background-color:black;color:white;">


<form action ="transfer2.jsp" method="post" style="padding: 20px 20px 20px 20px;"> 
<br>
        
        
        
        <label style="font-family:cursive">Enter Receiver's Account Number : &nbsp;&nbsp;&nbsp;</label> <input name ="accno" id = "p1"type= "number" required>
        <br>
        <br> 
        <label style="font-family:cursive">Enter Receiver's Account Name : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <input name ="accname" id = "p1"type= "text" required>
        <br>
        <br>    
        <label style="font-family:cursive">Enter Amount To Be Transfered:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <input id = "amount"type= "number" name ="amount"> 
        <br>
        <br>
        <label style="font-family:cursive">Account Owner's Password : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <input name ="puser" id = "p1"type= "password" required>
        <br>
        <br>
        
        <div style="padding : 0px 20px 0px 180px;">
            <input type ="submit" value ="Transfer">
            </div>
            </form>
            
</div>
</body>
</html>