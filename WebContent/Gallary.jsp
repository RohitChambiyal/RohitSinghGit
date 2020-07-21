<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function showAlert(){
alert("Please Login First");
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<div>

	<jsp:include page="Header.jsp"/>
</div>
<body>
<% session=request.getSession(false);
%>
<div style="padding: 10px 0px 60px 380px;">
<% session=request.getSession(false); %>
<%
if(session.getAttribute("user")==null){
	out.print("Please Login First");
	response.sendRedirect("Login.jsp");
	
}

%>
<a style="margin: 0px 0px 0px 380px;" href="Logout.jsp">Logout</a>
<br>
</div>





  <!--    <form action="Uploading.jsp" method="post" enctype="multipart/form-data">  
    <h2>Select Your File: </h2> <input type="file" name="fname"/><br/>  
      <input type="image" />  
    </form>  -->
<div style="margin: 30px 0px 60px 580px;">
<form action = "Uploading.jsp" method = "post"
         enctype = "multipart/form-data">
         <input type = "file" name = "hello" size = "50" />
         <br><br>
         <input type = "submit" value = "Upload Image" />
      </form>
</div>

</body>
</html>