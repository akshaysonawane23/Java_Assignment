<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%

String errMsg = (String) request.getAttribute("errMsg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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

header {
	font-family: sans-serif;
	font-weight: bold;
	font-size: 40px;
	color: #1877f2;
	margin-top: -20%;
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

input {
	height: 35px;
	width: 300px;
	border-radius: 4px;
	border: 2px solid rgb(151, 140, 140);
}
</style>
</head>
<body>

	<div>
		<header>Welcome</header>
		<br> <br>
		<form action="./login" method="post">
		   <%if(errMsg!=null&&!errMsg.isEmpty()){%>
		   <h3 style="color: red;"><%=errMsg %></h3>
		   <%} %>

			<table>
				<tr>
					<td><input type="number" name="id" placeholder="Enter your id"></td>
				</tr>

				<tr>
					<td><input type="password" name="password"
						placeholder="Enter your password"></td>
				</tr>
			</table>
			<br> <br>
			<button>Login</button>

		</form>

	</div>

</body>
</html>