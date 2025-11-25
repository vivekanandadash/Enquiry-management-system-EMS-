<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<h2>Login form</h2>
  <form action="logins" method="post">
  Enter email:<input type="text" name="email"><br><br>
  Enter password:<input type="password" name="password"><br><br>
  <input type="submit" value="Login">
  </form>
  <% 
  if(request.getAttribute("result")!=null){
	 out.println(request.getAttribute("result"));
	 
  }
  %>
</body>
</html>