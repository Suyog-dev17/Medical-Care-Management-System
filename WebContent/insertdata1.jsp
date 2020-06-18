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
	String[] Patientid= request.getParameterValues("medicinenames");
	String[] Medicines= request.getParameterValues("cost");
	String[] Dosage= request.getParameterValues("dosage");
	
PreparedStatement pstmt=connect.prepareStatement("insert into medicinelist(medicinenames,cost,Dosage) values(?,?,?)");
for(int i=0;i<Patientid.length;i++)
{
	if(!(Patientid[i]).equals(""))
	{
		 pstmt.setString(1,Patientid[i]);
         pstmt.setString(2,Medicines[i]);
         pstmt.setString(3,Dosage[i]);
         pstmt.addBatch();
	}
}

int i[]=pstmt.executeBatch();
response.sendRedirect("pharmacist.jsp");
}
}
catch(Exception e){
out.println(e);
				}

%>
</body>
</html>