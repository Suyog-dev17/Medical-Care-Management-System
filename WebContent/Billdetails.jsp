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
<link rel="stylesheet" href="doctor.css">
<style>
.abcd{
margin:60px 0px;
margin-left:250px;
margin-bottom:0px;
background-color:#ff8533;
width:150px;
padding:20px;
text-align:center;
font-size:20px;
}
.abed{
margin:-62px 0px;
margin-left:500px;
background-color:black;
color:#ff8533;
width:50px;
padding:20px;
text-align:center;
font-size:20px;
}
</style>
</head>
<body>
	     <header>
        <nav id="nav-bar">
<div class="nav-main">
<div class="nav-left" >
<div class="logo"><img src="img/2019-10-30.png" width="80px" height="80px"></div>
<div class="cms"><h2>Medical Care Management System</h2></div>
</div>
</div>
</nav>
</header>
<%
try{
	String P_id=request.getParameter("Patient_id");
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
Statement stat=connect.createStatement();
ResultSet result=stat.executeQuery("select M.Medicine_name,N.cost,M.Units from medicines M,medicinelist N where M.Patient_id='"+P_id+"' and M.Medicine_name=N.medicinenames");
int i=0;
int sum=0;
%>
<div class="scrolling">
<table class="def">
<tr>
<th><% out.print("Sl No"); %></th>
<th><% out.print("Medicine Name"); %></th>
<th><% out.print("Cost/Unit"); %></th>
<th><% out.print("No of Units"); %></th>
</tr>
<%
while(result.next()){
%>
<tr>
<td><% out.print(++i); %></td>
<td><% out.print(result.getString(1)); %></td>
<td><% out.print(result.getInt(2)); %></td>
<td><% out.print(result.getInt(3)); %></td>
</tr><%sum=sum+(result.getInt(2)*result.getInt(3));
}
%>
</table>
</div>
<div class="abcd"><b>Total Bill is</b></div><div class="abed"><b><%out.print(sum);%></b></div>

<%
}
else{
response.sendRedirect("pharmacist.jsp");
}
}catch(Exception e){
out.println(e);
}
%>
</div>
</body>
</html>