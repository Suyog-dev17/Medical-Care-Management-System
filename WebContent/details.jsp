<!DOCTYPE html>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<html>
<style>
.logo1{
float:left;
margin-left:380px;
padding-left: 20px;
padding-top: 10px;
}
.cms1{
padding-left: 100px;
margin-left:470px;
color:#ff8533;
font-family: monospace;
padding-top: 10px;
font-size:18px;
width:auto;
}
.wrappe{
	text-align:auto;
	margin-left:650px;
}
	.addcon{
	color:black;
    font-family:monospace;
	text-decoration: none;
    background: #ff8533;
    padding: 20px;
    margin:45px 0;
    margin-left:-150px;
    text-align:center;
    width:180px;
    position:absolute;
    border-radius: 40px;
    display: inline-block;
    border: none;
    transition: all 0.4s ease 0s;
    cursor: pointer;
    font-size: 18px;
}
.addcon:hover {
background:red;
color:black;
   
}
	.addcon1{
	color:black;
    font-family:monospace;
	text-decoration: none;
    background: #ff8533;
    padding: 20px;
    margin:45px 0;
    margin-left:150px;
    text-align:center;
    width:220px;
    position:absolute;
    border-radius: 40px;
    display: inline-block;
    border: none;
    transition: all 0.4s ease 0s;
    cursor: pointer;
    font-size: 18px;
}
.addcon1:hover {
background:black;
color:#ff8533;
   
}
</style>
<head>
<meta charset="ISO-8859-1">
<title>Medical Care Management System</title>
<link rel="stylesheet" href="receptionist.css">
</head>
<body>
<header>
<nav id="nav-bar">

<div class="logo1"><img src="img/2019-10-30.png" width="80px" height="80px"></div>
<div class="cms1"><h1>Medical Care Management System</h1></div>
</nav>
</header>

<%
try{
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
	String email=request.getParameter("email");
Statement stat=connect.createStatement();
CallableStatement cst = connect.prepareCall("CALL complete_proc(?,?) ");
cst.setString(1,email);
cst.registerOutParameter(2,Types.VARCHAR);
cst.executeUpdate();
%>
<div class="wr1">
<p style="margin-right:5px;margin-top:-30px;font-family:georgia,garamond,serif;color:#ff8533;background-color:black;font-size:20px;padding:15px;padding-top:20px;width:700px;LINE-HEIGHT:40px;margin-left:400px;text-align:center;border:5px solid;border-color:#ff8533">
    <% out.print(cst.getString(2));%>

</p>
</div>
<div class="wrappe">

<a href="receptionist.jsp"><button class="addcon"><b>Back</b></button></a>
<a href="addpatient.html"><button class="addcon1"><b>Add Patient</b></button></a>
</div>
<%
}
else{
response.sendRedirect("receptionist.jsp");
}
}catch(Exception e){
out.println(e);
}
%>
</body>
</html>