<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
</head>
<body>
<h2>Registration List</h2>
<table border="1">
<tr>
<th>name</th>
<th>email</th>
<th>number</th>
<th>course</th>
<th>Delete</th>
<th>Update</th>
</tr>
<%ResultSet result = (ResultSet)request.getAttribute("result");
   while(result.next()){
%>

<tr>
<td><%=result.getString(1)%></td>
<td><%=result.getString(2)%></td>
<td><%=result.getString(3)%></td>
<td><%=result.getString(4)%></td>
<td><a href="DeleteRegistration?email=<%=result.getString(2)%>">Delete</a></td>
<td><a href="UpdateRegistration?email=<%=result.getString(2)%>&number=<%=result.getString(3)%>">Update</a></td>
</tr>

<%}%>
</table>
</body>
</html>