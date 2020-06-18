<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String Patient_id=request.getParameter("Patient_id");
try{
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
    Statement stat=connect.createStatement();
    stat.executeUpdate("delete from medicines where Patient_id='"+Patient_id+"'");
    response.sendRedirect("doctor.jsp");
}
}
catch(Exception e){
out.println(e);
}


%>
</body>
</html>