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
<div style="margin:0px 0px 0px 80px;background-image:url(image/back151.jpg);z-index: -90;" >
<%
boolean checking=false;
String reqtype= "";
String category="";
String email="";
String issue= "";
String uname = (String)session.getAttribute("user");
String cno ="";
Connection con = null;

Statement st=null;

ResultSet rs = null;

boolean re = false;
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
	String s2 ="SELECT * from COMPLAINT where USERNAME ='"+uname+"';";
	System.out.println(s2);
	PreparedStatement pst2 = con.prepareStatement(s2);
	pst2.execute();
	rs = pst2.getResultSet();
	re =true;
	%>
<div align="center">
<h1>Request Status</h1>
</div>
   
<table border=3 align=center style="text-align: center;  border-color:black;">
 <thead>
                <tr class="warning" >
                    <td ><h4>COMPLAINT NO</h4></td>
                    <td><h4>REQUEST TYPE</h4></td>
                    <td><h4>REQUEST CATEGORY</h4></td>
                    <td><h4>EMAIL</h4></td>
                    <td><h4>ISSUE</h4></td>
                    <td><h4>STATUS</h4></td>
                    <td><h4>RESPONSE</h4></td>

                </tr>
            </thead>
        <%while(rs.next())
        {
            %>
            <tr>
                <td><%out.print(rs.getString(1));%></td>
                <td><%out.print(rs.getString(3));%></td>
                <td><%out.print(rs.getString(4));%></td>
                <td><%out.print(rs.getString(5));%></td>
                <td><%out.print(rs.getString(6));%></td>
                <td><%out.print(rs.getString(7));%></td>
                <td><%out.print(rs.getString(8));%></td>
                
            </tr>
            <%
        }%>
        </table><br>
    <%} catch (Exception e1) {

	System.out.println(e1);
	e1.printStackTrace();
	re = false;

}

%>

</div>
</body>
</html>