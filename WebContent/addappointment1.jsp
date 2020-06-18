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
Statement stat1 = null;
Statement stat2 = null;
Statement stat3 = null;
ResultSet result = null;
ResultSet result1=null;
ResultSet result2=null;
ResultSet result3=null;
int rs=0;
connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
String fname = request.getParameter("fname");
String phone = request.getParameter("phone");
String dtype = request.getParameter("type");
String description  = request.getParameter("description");
String receptionistid=(session.getAttribute("user_id")).toString();

stat=connect.createStatement();
stat1=connect.createStatement();

result1=stat1.executeQuery("select appointment from count");
result1.next();

String id = result1.getString(1);
char a,b,c;
String did;
int i=id.length()-1;
a=id.charAt(i);
b=id.charAt(i-1);
c=id.charAt(i-2);
if(a=='9') {
if(b=='9'){
did="A"+(++c)+'0'+'0';
}
else{
did="A"+c+(++b)+'0';
}
}
else{
did="A"+c+b+(++a);
}
rs = stat.executeUpdate(" update count set appointment='"+did+"' where appointment='"+id+"' ");
rs = stat.executeUpdate("insert into appointmentinfo values ('"+did+"','"+description+"')");
rs = stat.executeUpdate("insert into appointments values ('"+did+"','"+fname+"','"+phone+"','"+dtype+"')");

response.sendRedirect("receptionist.jsp");

}
connect.close();
}
catch(Exception e){
out.println(e);
}
%>
</body>
</html>