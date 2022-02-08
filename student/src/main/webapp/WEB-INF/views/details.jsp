<%@page import="com.te.student.bean.StudentsDetail"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="navbar.jsp"%>
<%
String msg = (String) request.getAttribute("msg");
StudentsDetail detail = (StudentsDetail) request.getAttribute("details");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Student</title>
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

td, th {
	border: 1px solid #ddd;
	padding: 8px;
}

table {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
	font-size: 25px;
}

th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #1877f2;
	color: white;
}
</style>
</head>
<body>
	<div>
		<header>Find Student</header>
		<br>
		<%
		if (msg != null && !msg.isEmpty()) {
		%>
		<h3 style="color: red;"><%=msg%>
		</h3>
		<%
		}
		%>
		<br>
		<form action="./details" method="post">
			<input type="number" name="id" placeholder="Enter your Id"> <br>
			<br>
			<button>Find</button>

		</form>
		<br>
		<%
		if (detail != null) {
		%>
		<table>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Address</th>
				<th>Password</th>
			</tr>
			<tr>
				<td><%=detail.getId()%></td>
				<td><%=detail.getName()%></td>
				<td><%=detail.getAddress()%></td>
				<td><%=detail.getPassword()%></td>
			</tr>
		</table>
		<%
		}
		%>
	</div>
</body>
</html>