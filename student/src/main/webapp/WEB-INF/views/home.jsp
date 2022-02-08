<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String data = (String) request.getAttribute("msg");
%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<style type="text/css">
div {
	text-align: center;
}
</style>
</head>
<body>
	<div>
		<h1>Welcome</h1>
		<br>
		<h2><%=data%></h2>
	</div>
</body>
</html>