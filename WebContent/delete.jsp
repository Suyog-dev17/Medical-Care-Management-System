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
	stat.executeUpdate("delete from patients where Patient_id='"+Patient_id+"'");
	stat.executeUpdate("delete from patientinfo where p_id='"+Patient_id+"'");
	char a,b,c;
	String did;
	int i=Patient_id.length()-1;
	a=Patient_id.charAt(i);
	b=Patient_id.charAt(i-1);
	c=Patient_id.charAt(i-2);
	if(a=='0') {
	if(b=='0'){
	did="P"+(--c)+'9'+'9';
	}
	else{
	did="P"+c+(--b)+'9';
	}
	}
	else{
	did="P"+c+b+(--a);
	}
	stat.executeUpdate(" update count set patient='"+did+"' where patient='"+Patient_id+"' ");
	response.sendRedirect("deletesuccess.jsp");
}
}
catch(Exception e){
out.println(e);
}


%>
</body>
</html>