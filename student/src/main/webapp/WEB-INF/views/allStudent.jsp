<%@page import="com.te.student.bean.StudentsDetail"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="navbar.jsp"%>
<%
List<StudentsDetail> details = (List<StudentsDetail>) request.getAttribute("details");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Student</title>
<style type="text/css">
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
		<header>All Students Details</header>
		<br> <br>
		<table>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Address</th>
				<th>Password</th>
			</tr>
			<%
			for (StudentsDetail details2 : details) {
			%>
			<tr>
				<td><%=details2.getId()%></td>
				<td><%=details2.getName()%></td>
				<td><%=details2.getAddress()%></td>
				<td><%=details2.getPassword()%></td>
			</tr>

			<%
			}
			%>

		</table>
	</div>
</body>
</html>