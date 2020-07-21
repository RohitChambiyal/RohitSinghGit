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
<body background="images/fds.jpg" style="color:white;">
<script>
var check = function() {
  if (document.getElementById('password').value ==
    document.getElementById('confirmpassword').value) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'Passwords matching';
    document.getElementById('submit').disabled = false;
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'Passwords not matching';
    document.getElementById('submit').disabled = true;
  }
}
</script>
<div style="padding: 0px 0px 0px 340px;">
<% session=request.getSession(false); %>




<h1>Enter Details to Create Bank Account</h1>
<form action ="Signingin.jsp" method="post" style="padding:0px 0px 0px 120px;">
<br>
        <label style="font-family:cursive">Enter Name : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;</label>
             <input name ="uname" id = "name"type= "text" title="Only Alphabets and Digits allowd in username" pattern="[^\s][^ !@#$%^&*]+" required>
            <br>
            <br><label style="font-family:cursive">Mobile Number :    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
            <input name="pnumber"id = "numbers"type= "text" pattern="(?=.*\d).{10,}" title="Must be greater than 10 digits and numbers only" required>
            <br>
            <br><label style="font-family:cursive">Select Age : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
            <select name ="age">
            <% for(int i=1;i<100;i++){ %>
            <option><%=i %></option>
            <%} %>
           
            </select>
            <br>
            <br>
           <label style="font-family:cursive">Address: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input name ="address" id = "address"type= "text" title="Must contain >1 words,space , pincode and at least 8 Characters" pattern="(?=.*\d)(?=.*\s)(?=.*[a-zA-Z]).{8,}" required>
            <br>
            <br>
            <label style="font-family:cursive">Enter password : &nbsp;&nbsp;&nbsp;&nbsp;</label> 
            <input  onkeyup='check();' name ="pname" id = "password"type= "password" title="at least 1 uppercase, 1 lowercase, 1 symbol !@#$%^&*, and 1 numeric is required with minimum length = 8" pattern="(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}"required>
            <br>
            <br>
        <label style="font-family:cursive">Re-enter password :</label>
         <input onkeyup='check();' id="confirmpassword" pattern="(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}"  type= "password" required><br>
			
			<span style="margin:10px 0px 10px 170px;background-color:black;" id='message'></span>
        <div style="padding : 0px 20px 0px 130px;">
            <input type ="submit" value ="Sign Up">
            </form>
            </div>
            
            <p id="e" style="color: red"></p>
           
           
        
        
        </div>
</div>
</body>
</html>