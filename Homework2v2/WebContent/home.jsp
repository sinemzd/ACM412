<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
<% 
Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;

String user = "panda1";
String password = "1234";

try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost/deneme?useSSL=false" ,user,password);
%>

<form method="post" action="login.jsp">
<center><h2 style="color:orchid">Login Page with JSP</h2></center>
<table border ="1" align="center" style="color:palevioletred">
<tr>
<td>Name:</td>
<td><input type="text" name="name"></td>
</tr>
<tr>
<td>Password:</td>
<td><input type="password" name="password"></td>
</tr>
<%
}
catch(SQLException e){
	out.println("home"+e);
}
%>
<tr>
<td></td>
<td><input type="submit" value="submit"></td>
</table>
</form>
</body>
</html>