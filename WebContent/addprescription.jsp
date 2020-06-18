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
String fname = request.getParameter("fname");
String dtype = request.getParameter("type");
String description  = request.getParameter("description");

stat=connect.createStatement();


rs = stat.executeUpdate("insert into prescriptionsinfo values ('"+fname+"','"+description+"')");
rs = stat.executeUpdate("insert into prescriptions(Patient_id,Diagnosis_Name) values ('"+fname+"','"+dtype+"')");

response.sendRedirect("doctor.jsp");

}
connect.close();
}
catch(Exception e){
out.println(e);
}
%>
</body>
</html>