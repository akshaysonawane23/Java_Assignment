<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="navbar.jsp"%>
<%
Integer data = (Integer) request.getAttribute("data");
String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Student</title>
<style type="text/css">
input {
	height: 35px;
	width: 300px;
	border-radius: 4px;
	border: 2px solid rgb(151, 140, 140);
}

div {
	position: absolute;
	text-align: center;
	background: white;
	top: 48%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 999;
	padding: 150px 32px;
	border-radius: 10px;
	height: 200px;
	box-shadow: 0 10px 20px 0 #879fec;
}

button {
	width: 300px;
	height: 35px;
	background: #1877f2;
	color: rgb(247, 245, 241);
	font-size: 16px;
	font-weight: bold;
	border: none;
	background: #1877f2;
	border-radius: 4px;
}

header {
	font-family: sans-serif;
	font-weight: bold;
	font-size: 40px;
	color: #1877f2;
	margin-top: -20%;
}
</style>
</head>
<body>
	<div>
		<header>Update Data</header>
		<br>
		<%
		if (msg != null && !msg.isEmpty()) {
		%>
		<h3 style="color: green;"><%=msg%></h3>
		<%
		}
		%>
		<br>
		<form action="./updateStudent" method="post">

			<table>
				<tr>
					<td><input type="number" value="<%=data%>" disabled="disabled"></td>
				</tr>
				<tr>
					<td><input type="text" name="name"
						placeholder="Enter Your Name"></td>
				</tr>
				<tr>
					<td><input type="text" name="address"
						placeholder="Enter your Address"></td>
				</tr>
				<tr>
					<td><input type="password" name="password"
						placeholder="Enter your Password"></td>
				</tr>
			</table>
			<br> <br>
			<button>Update</button>
		</form>
	</div>
</body>
</html>