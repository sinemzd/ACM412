<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
<%! 
String userName;
String userPass;
%>
<%
Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;

String user = "panda1";
String pass = "1234";

String sql = "select * from deneme.people where name=? and surname=?";

String name = request.getParameter("name");
String password = request.getParameter("password");

if((!(name.equals(null) || name.equals("")) && !(password.equals(null) || password.equals("")))) {

	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/deneme?useSSL=false",user,pass);
		ps = conn.prepareStatement(sql);
		ps.setString(1,name);
		ps.setString(2,password);
		rs = ps.executeQuery();
		
		if(rs.next()) {
			userName = rs.getString("name");
			userPass = rs.getString("surname");
			
			if(name.equals(userName) && password.equals(userPass)) {
				session.setAttribute("name",userName);
				response.sendRedirect("welcome.jsp");
			}
		
		}else 
			response.sendRedirect("error.jsp");
			rs.close();
			ps.close();
	} catch(SQLException e){
		out.println(e);
	}
} 
else {
%>

<center><p style="color:purple">Error In Login</p></center>

<% 
getServletContext().getRequestDispatcher("/home.jsp").include(request, response);
}
%>
</body>
</html>