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
<%

try{
	Connection connect = null;
connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
	
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String phone = request.getParameter("phone");
	String dtype = request.getParameter("type");
	String make =  request.getParameter("make");
	String model =  request.getParameter("model");
	String model1 =  request.getParameter("model1");
	String model2 =  request.getParameter("model2");
PreparedStatement ps=connect.prepareStatement("update patients set Patient_name=?,Age=?,Sex=?,Bloodgroup=?,PhoneNumber=?,Email_id=?,Address=? where Patient_id=?");
ps.setString(1,lname);
ps.setString(2,phone);
ps.setString(3,dtype);
ps.setString(4,make);
ps.setString(5,model);
ps.setString(6,model1);
ps.setString(7,model2);
ps.setString(8,fname);
int i=ps.executeUpdate();
if(i>0)
{
	response.sendRedirect("success3.jsp");
}
else{
	response.sendRedirect("error3.jsp");
	}

}
}
catch(Exception e){

				}

%>
</body>
</html>