<%@page import ="java.util.Random" %>

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


<form action="UploadNow" method ="post" enctype="multipart/form-data">
upload your image

</form>



<h1> value is</h1>
<% int x= Integer.parseInt(request.getParameter("hel")); 
 Object s =session.getAttribute("nam"); 
out.print(s);
Random r = new Random();
int y;%>

<%
for(int i=1;i<=10;i++){
	y=r.nextInt((x*10) );
	out.print(x+" * "+i+" = "+(i*x) +" Random = "+ y 
	+"<br> ");
	if((i*x)== y){
		out.print("matched for row "+i+"<br>");
	}
}
%>


</body>
</html>