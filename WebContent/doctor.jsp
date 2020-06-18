<!DOCTYPE html>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Medical Care Management System</title>
<link rel="stylesheet" href="doctor.css">
</head>
<body>
<header>
<nav id="nav-bar">
<div class="nav-main">
<div class="nav-left" >
<div class="logo"><img src="img/2019-10-30.png" width="80px" height="80px"></div>
<div class="cms"><h2>Medical Care Management System</h2></div>
</div>
<div class="nav-right"><br>
<button class="tab" onclick="openTab(event,'Prescriptions')"><b>Prescription</b></button>
<button class="tab" onclick="openTab(event,'Appointments')"><b>View Appointments</b></button>
<button class="tab" onclick="openTab(event,'Medications')"><b>Medications</b></button>
<a class="ancho" href="logout.jsp"><b>Logout</b></a>
          </div>
</div>
        </nav>
</header>
<div id="user">
<% try{
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
String d_id=(session.getAttribute("user_id")).toString();
Statement stat=connect.createStatement();
ResultSet r=stat.executeQuery("select name from doctors where d_id='"+d_id+"'");
r.next();
%><%
}
}catch(Exception e){
out.println(e);
}
%>
</div>
<div id="Prescriptions" class="tabs">
<%
try{
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
String r_id=(session.getAttribute("user_id")).toString();
Statement stat=connect.createStatement();
Statement stat1=connect.createStatement();
ResultSet result=stat.executeQuery("select a.Patient_id,p.Patient_name,a.Diagnosis_Name,a.Prescription_Date from prescriptions a,patients p where a.Patient_id=p.Patient_id");
%>
<div class="scrolling">
<table class="def">
<tr>
<th><% out.print("Patient ID"); %></th>
<th><% out.print("Patient Name"); %></th>
<th><% out.print("Diagnosis Name"); %></th>
<th><% out.print("Prescription Date"); %></th>
</tr>
<%
while(result.next()){
%>
<tr>
<td><% out.print(result.getString(1)); %></td>
<td><% out.print(result.getString(2)); %></td>
<td><% out.print(result.getString(3)); %></td>
<td><% out.print(result.getString(4)); %></td>
<td><a href="addmedication.jsp" class="btndell">Add Medication</a></td>
</tr><%
}
%>
</table>
</div>
<%
}
else{
response.sendRedirect("doctor.jsp");
}
}catch(Exception e){
out.println(e);
}
%>
<div class="wrapper1">
<a href="addprescription.html"><button class="addcom"><b>Set Prescription</b></button></a>
</div>
</div>
<div id="Medications" class="tabs">
<%
try{
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
String rid=(session.getAttribute("user_id")).toString();
Statement stat=connect.createStatement();
Statement stat1=connect.createStatement();
ResultSet result=stat.executeQuery("select * from medicines");
%>
<div class="scrolling">
<table class="def">
<tr>
<th><% out.print("Patient_id"); %></th>
<th><% out.print("Medicine_name"); %></th>
<th><% out.print("Dosage"); %></th>
<th><% out.print("Units"); %></th>
</tr>
<%
while(result.next()){
%>
<tr>
<td><% out.print(result.getString(1)); %></td>
<td><% out.print(result.getString(2)); %></td>
<td><% out.print(result.getString(3)); %></td>
<td><% out.print(result.getString(4)); %></td>
<td><a href='deletemedication.jsp?Medicine_name=<%=result.getString("Medicine_name") %>' class="btndel">Delete</a></td>
</tr><%
}
%>
</table>
</div>
<%
}
else{
response.sendRedirect("doctor.jsp");
}
}catch(Exception e){
out.println(e);
}
%>
<div class="wrapper222">
<a href="deletemedication1.jsp"><button class="addcom1"><b>Delete All</b></button></a>
</div>
<div class="wrapper221">

<a href="addmedication.jsp"><button class="addcom1"><b>Set Medication</b></button></a>
</div>
</div>
<div id="Appointments" class="tabs">
<%
try{
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
String d_id=(session.getAttribute("user_id")).toString();
Statement stat=connect.createStatement();
Statement stat1=connect.createStatement();
ResultSet result=stat.executeQuery("select a.appointment_id,a.Patient_id,p.Patient_name,p.Age,p.Sex,p.Bloodgroup,a.RoomNo from appointments a,patients p where a.Patient_id=p.Patient_id and  a.d_id='"+d_id+"'");
%>
<div class="scrolling">
<table class="efg">
<tr>
<th><% out.print("Appointment_ID"); %></th>
<th><% out.print("Patient_ID"); %></th>
<th><% out.print("Patient_Name"); %></th>
<th><% out.print("Age"); %></th>
<th><% out.print("Sex"); %></th>
<th><% out.print("Blood Group"); %></th>
<th><% out.print("RoomNo"); %></th>
</tr>
<%
while(result.next()){
%><tr>
<td><% out.print(result.getString(1)); %></td>
<td><% out.print(result.getString(2)); %></td>
<td><% out.print(result.getString(3)); %></td>
<td><% out.print(result.getString(4)); %></td>
<td><% out.print(result.getString(5)); %></td>
<td><% out.print(result.getString(6)); %></td>
<td><% out.print(result.getString(7)); %></td>

</tr><%
}
%>
</table>
</div>
<%
}
else{
response.sendRedirect("doctor.jsp");
}
}catch(Exception e){
out.println(e);
}
%>
<div class="wrapper">

</div>
</div>



<script type="text/javascript">
function openTab(evt,tabname){
 var i;
 var tabcontent = document.getElementsByClassName("tabs");
 for (i = 0; i < tabcontent.length; i++) {
   tabcontent[i].style.display = "none";
 }
 var tablinks = document.getElementsByClassName("tab");
 for (i = 0; i < tablinks.length; i++) {
   tablinks[i].className = tablinks[i].className.replace(" active", "");
 }
 document.getElementById(tabname).style.display = "block";
 evt.currentTarget.className += " active";
}
</script>
</body>
</html>