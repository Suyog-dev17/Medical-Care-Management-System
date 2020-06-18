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
String appointment_id=request.getParameter("appointment_id");
try{
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
	Statement stat=connect.createStatement();
	stat.executeUpdate("delete from appointments where appointment_id='"+appointment_id+"'");
	stat.executeUpdate("delete from appointmentinfo where appointment_id='"+appointment_id+"'");
	char a,b,c;
	String did;
	int i=appointment_id.length()-1;
	a=appointment_id.charAt(i);
	b=appointment_id.charAt(i-1);
	c=appointment_id.charAt(i-2);
	if(a=='0') {
	if(b=='0'){
	did="A"+(--c)+'9'+'9';
	}
	else{
	did="A"+c+(--b)+'9';
	}
	}
	else{
	did="A"+c+b+(--a);
	}
	stat.executeUpdate(" update count set appointment='"+did+"' where appointment='"+appointment_id+"' ");
	response.sendRedirect("deletesuccess.jsp");
}
}
catch(Exception e){
out.println(e);
}


%>
</body>
</html>