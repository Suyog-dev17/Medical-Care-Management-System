<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CMS Server</title>
</head>
<body>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connect = null;
Statement stat = null;
ResultSet result = null;

connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
String email=request.getParameter("email");
String pass=request.getParameter("password");
String user=request.getParameter("username");

stat=connect.createStatement();
String sql="select email,password,username from login_details";
result=stat.executeQuery("select * from login_details");
while(result.next()){
if(result.getString(1).equals(email) && result.getString(2).equals(user) && result.getString(3).equals(pass)){
String id = result.getString(4);
session.setAttribute("user_id",id);
if(id.charAt(0)=='R'){
response.sendRedirect("receptionist.jsp");
}
else response.sendRedirect("p_error.jsp");
}
}
response.sendRedirect("p_error.jsp");
}

connect.close();
}catch(Exception e){
out.println(e);
}
%>
</body>
</html>