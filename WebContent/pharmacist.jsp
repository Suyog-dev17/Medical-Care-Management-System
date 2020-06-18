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
<button class="tab" onclick="openTab(event,'Prescriptions')"><b>View Prescription</b></button>
<button class="tab" onclick="openTab(event,'Medications')"><b>Medicines List</b></button>
<a class="ancho" href="logout.jsp"><b>Logout</b></a>
          </div>
</div>
        </nav>
</header>
<div id="user">
<% try{
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
String p_id=(session.getAttribute("user_id")).toString();
Statement stat=connect.createStatement();
ResultSet r=stat.executeQuery("select name from pharmacists where p_id='"+p_id+"'");
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
ResultSet result=stat.executeQuery("select p.Patient_id,s.Patient_name,p.Diagnosis_Name,p.Prescription_Date from prescriptions p,patients s where p.Patient_id=s.Patient_id");
%>
<div class="scrolling">
<table class="def">
<tr>
<th><% out.print("Patient_ID"); %></th>
<th><% out.print("Patient Name"); %></th>
<th><% out.print("Diagnosis_Name"); %></th>
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
<td><a href='Billdetails.jsp?Patient_id=<%=result.getString("Patient_id") %>' class="btndell">View Bill Details</a></td>
</tr><%
}
%>
</table>
</div>
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
<div id="Medications" class="tabs">
<%
try{
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
String rid=(session.getAttribute("user_id")).toString();
Statement stat=connect.createStatement();
Statement stat1=connect.createStatement();
ResultSet result=stat.executeQuery("select * from medicinelist");
int i=0;
%>
<div class="wrapper21">

<a href="addmedicines.jsp"><button class="addcom2"><b>Add Medicines</b></button></a>
</div>
<div class="scrolling">
<table class="defg">
<tr>
<th><% out.print("Sl no"); %></th>
<th><% out.print("Medicine name"); %></th>
<th><% out.print("Cost/Unit"); %></th>
<th><% out.print("Dosage"); %></th>
</tr>
<%
while(result.next()){
%>
<tr>
<td><% out.print(++i); %></td>
<td><% out.print(result.getString(1)); %></td>
<td><% out.print(result.getString(2)); %></td>
<td><% out.print(result.getString(3)); %></td>
</tr><%
}
%>
</table>
</div>

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