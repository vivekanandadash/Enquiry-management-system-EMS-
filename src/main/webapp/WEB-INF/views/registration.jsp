<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "Menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Student Registration Form</h2>
<form action="registration" method="post">
<pre>
Enter your name:<input type="text" title="Enter your name" placeholder="mike thomsan" name = "name"><br>
Enter your email:<input type="text" title="Enter a valid email like: name@example.com" required="required" placeholder="name@gmail.com" name = "email"><br>
Enter your Number:<input type="text" title="Enter a 10 Digit mobile number" placeholder="10-Digit-Number" name = "number"><br>
Enter your Course:<input type="text" title="Enter your Course Name" placeholder="Mathmatics" name = "course"><br><br>
<input type="submit" value="Submit">

<%
if(request.getAttribute("result")!=null){ 
	out.println(request.getAttribute("result"));
}
%>
</pre>
</form>
</body>
</html>