<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.jsp1.servlet3class"%>
<%@page import="java.sql.*"%>  

    
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
<div >
<% session=request.getSession(false); %>
<%
if(session.getAttribute("user")==null){
	
	response.sendRedirect("Login.jsp");
	out.print("Please Login First");
}

%>


</div>
<% if(session.getAttribute("user")!=null){ %>
<div style="margin:0px 0px 0px 80px;background-image:url(image/back151.jpg);z-index: -90;" >
<%
boolean checking=false;
int amount =0;
Connection con = null;
Statement st=null;
ResultSet rs = null;
boolean re = false;
String accno = "";
String uname = (String)session.getAttribute("user");

String address = "";
int age = 0;
String phone = "";
String iname="";


try {
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db2","root","helloworld");
} catch (Exception e11) {
	// TODO Auto-generated catch block
	e11.printStackTrace();
}
try {
	st = con.createStatement();
} catch (SQLException e1) {
	// TODO Auto-generated catch block
	e1.printStackTrace();
}

try {
	
	
	String s2 ="select ACCOUNTNO,USERNAME,AMOUNT,ADDRESS,AGE,PHONE,IMAGENAME from NEWACCOUNT where USERNAME ='"+uname+"' ;";
	System.out.println(s2);
	PreparedStatement pst2 = con.prepareStatement(s2);
	pst2.execute();
	rs = pst2.getResultSet();
	
	while(rs.next()) {
		
		
		accno=rs.getString(1);
		uname=rs.getString(2);
		amount=Integer.parseInt(rs.getString(3));
		address=rs.getString(4);
		age=Integer.parseInt(rs.getString(5));
		phone=rs.getString(6);
		iname =rs.getString(7);
	}
	System.out.println("its "+accno +""+ uname+""+ amount+""+ address+""+ age+""+ phone);
} catch (Exception e1) {
	// TODO Auto-generated catch block
	//System.out.println("not correct");
	e1.printStackTrace();
	re = false;
}
%>

<h1 align="center">Welcome <%out.print(session.getAttribute("user")); %></h1>
<h2><u>Account's Summary :-</u></h2>
<div style="margin:0px 0px 10px 40px; ">

<div  style="padding: 0px 10px 10px  40px;width:500px;  display: inline-block;;background-color:black;color:white;">


 
<h3>Account No : <%=accno %></h3> 
<h3>User Name : <%=uname %></h3>
<h3>Balance : <%=amount %></h3> <a style="color: white ;"href="previoustxn.jsp">*Check Previous Transactions</a>
<!-- <h3>Age : <%=age %></h3> -->
<h3>Address : <%=address %></h3>
<h3>Contact Number : <%=phone %></h3>

</div>
<div   style="padding:0px 0px 50px 100px;  display: inline-block;">
 
<img  width="140px" height="140px" src="<%=iname%>"> 
<br>
Change Profile Picture
<br> 
<br>
<form action = "Uploading.jsp" method = "post" enctype = "multipart/form-data">
<span	 >
         <input type = "file" name = "hello"  />
         </span>
         <br><br>
         <input type = "submit" value = "Upload File" />
      </form>
      </div>
</div>



</div>
</body>
</html>
<% }%>