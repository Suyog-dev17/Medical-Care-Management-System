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
	String aname = request.getParameter("aname");
	String fname = request.getParameter("fname");
	String phone = request.getParameter("phone");
	String dtype = request.getParameter("type");
	
PreparedStatement ps=connect.prepareStatement("update appointments set Patient_id=?,d_id=?,RoomNo=? where appointment_id=?");
ps.setString(1,fname);
ps.setString(2,phone);
ps.setString(3,dtype);
ps.setString(4,aname);
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