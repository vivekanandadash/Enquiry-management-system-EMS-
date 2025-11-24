<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="Menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>update Your number...</h2>
<form action="UpdateRegistration" method="post">
  <pre>

Enter your email:<input type="text" name = "email" value="<%=request.getAttribute("email")%>"><br>
Enter your Number:<input type="text" name = "number" value="<%=request.getAttribute("number")%>"><br><br>
<input type="submit" value="Submit">

</pre>
</form>
<%
if(request.getAttribute("result")!=null){
	out.println(request.getAttribute("result"));
}
%>
</body>
</html>