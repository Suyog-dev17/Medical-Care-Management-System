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
<link rel="stylesheet" href="addpatient.css">
</head>
<body>
<header>
<nav id="nav-bar">
<div class="nav-main" >
<div class="nav-left" >
<div class="logo"><img src="img/2019-10-30.png" width="80px" height="80px"></div>
<div class="cms"><h2>Medical Care Management System</h2></div>
</div>
</div>
        </nav>
</header>
<%
String appointment_id=request.getParameter("appointment_id");
try{
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
	Statement stat=connect.createStatement();
	ResultSet rs=stat.executeQuery("select * from appointments where appointment_id='"+appointment_id+"'");
		rs.next();
	%>
	<form action="updatevalue1.jsp" method="post">
<div class="log">
               <div class="log2"><br><br>
                  	<input type="text" name="aname" id="1" placeholder="Appointment Id"  style="width: 200px" value="<%=rs.getString(1) %>" />
                <p id="7" style="font-size:x-small;color: red"></p>

				
               
            
               
                    <input type="text" name="type" id="4" placeholder="Room No" style="width: 200px"  value="<%=rs.getString(4) %>" />
                    <p id="11" style="font-size: x-small;color: red"></p>
                    <br>
               <div class="search_categories">
               <div class="select">
               <select name="fname">
				<%
				ResultSet rs1=stat.executeQuery("select * from patients");  
				while(rs1.next())
				{
				%>
				<option value="<%=rs1.getString("Patient_id")%>">
				<%=rs1.getString("Patient_id")%>
				</option>
			<% } %>
				
				</select>
                </div>
                </div>
                <br>
                <br>
                <br>
                <br>
                   <div class="search_categories">
               <div class="select">
               <select name="phone">
				<%
				ResultSet rs2=stat.executeQuery("select * from doctors");  
				while(rs2.next())
				{
				%>
				<option value="<%=rs2.getString("d_id")%>">
				<%=rs2.getString("d_id")%>
				</option>
			<% } %>
				
				</select>
                </div>
                </div>
                <br>
                <br>
                    <button type="submit"  class="log_b"><b>Update Data</b></button>
                </div>
                </div>
           </div>
</form>
<%
}
else{
response.sendRedirect("receptionist.jsp");
}
}catch(Exception e){
out.println(e);
}
%>