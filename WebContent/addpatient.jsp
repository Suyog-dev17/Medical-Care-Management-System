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
ResultSet result = null;
ResultSet result1=null;
int rs=0;
connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
String lname = request.getParameter("lname");
String phone = request.getParameter("phone");
String dtype = request.getParameter("type");
String make =  request.getParameter("make");
String model =  request.getParameter("model");
String model1 =  request.getParameter("model1");
String model2 =  request.getParameter("model2");
String description  = request.getParameter("description");
String receptionistid=(session.getAttribute("user_id")).toString();

stat=connect.createStatement();
stat1=connect.createStatement();

result1=stat1.executeQuery("select patient from count");
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
did="P"+(++c)+'0'+'0';
}
else{
did="P"+c+(++b)+'0';
}
}
else{
did="P"+c+b+(++a);
}
rs = stat.executeUpdate(" update count set patient='"+did+"' where patient='"+id+"' ");
rs = stat.executeUpdate("insert into patientinfo values ('"+did+"','"+description+"')");
rs = stat.executeUpdate("insert into patients values ('"+did+"','"+lname+"','"+phone+"','"+dtype+"','"+make+"','"+model+"','"+model1+"','"+model2+"')");

response.sendRedirect("receptionist.jsp#Patients");

}
connect.close();
}
catch(Exception e){
out.println(e);
}
%>
</body>
</html>