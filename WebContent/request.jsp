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

<div align="center" style=" ">
<h1 style="  ">Request Form</h1> 
</div>
<div   style="margin: 0px 10px 10px 470px   ; border-radius: 10px;  display: inline-block;;background-color:black;color:white;">
<div align ="right" style="margin: 10px  10px 0px 0px ;">

<a style="color: red ;"href="requestcheck.jsp">*Check Request Status</a>
 </div>
<form action ="request2.jsp" method="post" style="padding:0px 20px 20px 20px;"> 
<br>
         
        
        
        <label style="font-family:cursive">Select Request Type</label> 
        <select name="reqtype">
        <option>General</option>
        <option>Complaint</option>
        <option>Urgent</option>
        <option>Fraud</option>
        <option>Other</option>
        </select>
        <br>
        <br> 
        <label style="font-family:cursive">Select Request Category &nbsp;&nbsp;&nbsp;&nbsp;</label> 
        <select name="category">
        <option>Balance</option>
        <option>General Details</option>
        <option>Deposit</option>
        <option>Transfer</option>
        <option>Withdraw</option>
        <option>Other</option>
        </select>
        <br>
        <br>    
        <label style="font-family:cursive">Email: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
        <input name ="email" id = "email"type= "text">
            <br>
            <br>
        <label style="font-family:cursive">Enter Issue</label> 
        <textarea style="margin:0px 0px 0px 100px;"id = "y" name ="issue"> </textarea>
        <br>
        <br>
        
        <div style="padding : 0px 20px 0px 130px;">
            <input type ="submit" value ="Submit">
            </div>
            </form>
            
</div>
</body>
</html>