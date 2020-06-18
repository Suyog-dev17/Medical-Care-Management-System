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
	String[] Patientid= request.getParameterValues("Patientid");
	String[] Medicines= request.getParameterValues("medicines");
	String[] Dosage= request.getParameterValues("Dosage");
	String[] Units= request.getParameterValues("Units");
	
PreparedStatement pstmt=connect.prepareStatement("insert into medicines(Patient_id,Medicine_name,Dosage,Units) values(?,?,?,?)");
for(int i=0;i<Patientid.length;i++)
{
	if(!(Patientid[i]).equals(""))
	{
		 pstmt.setString(1,Patientid[i]);
         pstmt.setString(2,Medicines[i]);
         pstmt.setString(3,Dosage[i]);
         pstmt.setString(4,Units[i]);
         pstmt.addBatch();
	}
}

int i[]=pstmt.executeBatch();
response.sendRedirect("doctor.jsp");
}
}
catch(Exception e){
out.println(e);
				}

%>
</body>
</html>