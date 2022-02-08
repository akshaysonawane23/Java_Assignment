<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="navbar.jsp"%>
<%
String msg = (String) request.getAttribute("msg");
String errMsg = (String) request.getAttribute("errMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Student</title>
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
		<header>Add Student</header>
		<br>
		<%
		if (msg != null && !msg.isEmpty()) {
		%>
		<h3 style="color: green;">
			<%=msg%></h3>
		<%
		} else if (errMsg != null && !errMsg.isEmpty()) {
		%>
		<h3 style="color: red;"><%=errMsg%></h3>
		<%
		}
		%>
		<br>

		<form action="./addStudent" method="post">
			<table>
				<tr>
					<td><input type="number" name="id"
						placeholder="Enter Student ID"></td>
				</tr>
				<tr>
					<td><input type="text" name="name"
						placeholder="Enter Student Name"></td>
				</tr>
				<tr>
					<td><input type="text" name="address"
						placeholder="Enter Student Address"></td>
				</tr>
				<tr>
					<td><input type="text" name="password"
						placeholder="Enter Student Password"></td>
				</tr>
			</table>
			<br> <br>
			<button>Add</button>

		</form>
	</div>
</body>
</html>