<!DOCTYPE html>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Medical Care Management System</title>
<link rel="stylesheet" href="receptionist.css">
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
<button class="tab" onclick="openTab(event,'Notifications')"><b>Notifications</b></button>
<button class="tab" onclick="openTab(event,'Appointments')"><b>Appointments</b></button>
<button class="tab" onclick="openTab(event,'Patients')"><b>Patient Info</b></button>

<a class="ancho" href="logout.jsp"><b>Logout</b></a>
          </div>
</div>
        </nav>
</header>
<div id="user">
<% try{
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
String r_id=(session.getAttribute("user_id")).toString();
Statement stat=connect.createStatement();
ResultSet r=stat.executeQuery("select name from receptionists where r_id='"+r_id+"'");
r.next();
%><%
}
}catch(Exception e){
out.println(e);
}
%>
</div>

<div id="Notifications" class="tabs">
<%
try{
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
String r_id=(session.getAttribute("user_id")).toString();
Statement stat=connect.createStatement();
Statement stat1=connect.createStatement();
ResultSet result=stat.executeQuery("select * from messages");
%>
<div class="scrolling">
<table class="efg">
<%
while(result.next()){
%>
<div class="wr1">
<p style="margin-right:5px;color:#ff8533;background-color:black;font-size:15px;padding:15px;width:700px;margin-left:200px;text-align:center;"><% out.print(result.getString("date"));%>: 1 Notification from <% out.print(result.getString(1)); %> at <% out.print(result.getString("time")); %> 
<a href='details.jsp?email=<%=result.getString("email") %>' class="btndel11">View Details</a></p>
</div>
<%

}
%>
</table>
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
</div>


<div id="Patients" class="tabs">
<%
try{
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
String r_id=(session.getAttribute("user_id")).toString();
int i=0;
Statement stat=connect.createStatement();
Statement stat1=connect.createStatement();
ResultSet result=stat.executeQuery("select * from patients");
%>
<div class="scrolling">
<table class="def">
<tr>
<th><% out.print("Sl No"); %></th>
<th><% out.print("Patient_ID"); %></th>
<th><% out.print("Patient_Name"); %></th>
<th><% out.print("Age"); %></th>
<th><% out.print("Sex"); %></th>
<th><% out.print("Blood_Group"); %></th>
<th><% out.print("PhoneNumber"); %></th>
<th><% out.print("Email_id"); %></th>
<th><% out.print("Address"); %></th>
</tr>
<%
while(result.next()){
%>
<tr>
<td><% out.print(++i); %></td>
<td><% out.print(result.getString(1)); %></td>
<td><% out.print(result.getString(2)); %></td>
<td><% out.print(result.getString(3)); %></td>
<td><% out.print(result.getString(4)); %></td>
<td><% out.print(result.getString(5)); %></td>
<td><% out.print(result.getString(6)); %></td>
<td><% out.print(result.getString(7)); %></td>
<td><% out.print(result.getString(8)); %></td>
<td><a href='delete.jsp?Patient_id=<%=result.getString("Patient_id") %>' class="btndel">Delete</a></td>
<td><a href='update.jsp?Patient_id=<%=result.getString("Patient_id") %>' class="btndell">Update</a></td>
</tr><%
}
%>
</table>
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
<div class="wrapper1">
<a href="addpatient.html"><button class="addcom"><b>Add Patient</b></button></a>
</div>
</div>

<div id="Appointments" class="tabs">
<%
try{
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
String r_id=(session.getAttribute("user_id")).toString();
Statement stat=connect.createStatement();
Statement stat1=connect.createStatement();
ResultSet result=stat.executeQuery("select a.appointment_id,a.Patient_id,p.Patient_name,a.d_id,a.RoomNo from appointments a,patients p where a.Patient_id=p.Patient_id order by a.appointment_id");
%>
<div class="scrolling">
<table class="efg">
<tr>
<th><% out.print("Appointment_ID"); %></th>
<th><% out.print("Patient_ID"); %></th>
<th><% out.print("Patient_Name"); %></th>
<th><% out.print("Doctor_id"); %></th>
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
<td><a href='delete1.jsp?appointment_id=<%=result.getString("appointment_id") %>' class="btndel">Delete</a></td>
<td><a href='update1.jsp?appointment_id=<%=result.getString("appointment_id") %>' class="btndell">Update</a></td>
</tr><%
}
%>
</table>
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
<div class="wrapper">

<a href="addappointment.jsp"><button class="addcom"><b>Add Appointment</b></button></a>
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