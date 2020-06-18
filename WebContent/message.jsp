
<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Medical Care Management System</title>
</head>
<body>
<% try{
Connection connect = null;
Statement stat = null;
int rs=0;
connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
String lname = request.getParameter("name123");
String phone = request.getParameter("email123");
String dtype = request.getParameter("message123");

stat=connect.createStatement();

rs = stat.executeUpdate("insert into messages(patient_name,email,message) values ('"+lname+"','"+phone+"','"+dtype+"')");

response.sendRedirect("index.html");

}
connect.close();
}
catch(Exception e){
out.println(e);
}
%>
</body>
</html>