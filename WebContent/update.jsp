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
String Patient_id=request.getParameter("Patient_id");
try{
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
	Statement stat=connect.createStatement();
	ResultSet rs=stat.executeQuery("select * from patients where Patient_id='"+Patient_id+"'");
		rs.next();
	%>
	<form action="updatevalue.jsp" method="post">
<div class="log">
               <div class="log2"><br><br>
               
               <input type="text" name="fname" id="1" placeholder="Patient ID"  style="width: 200px" value="<%=rs.getString(1) %>" />
                    <p id="9" style="font-size: x-small;color: red"></p>
                   
               
                    <input type="text" name="lname" id="2" placeholder="Patient Name"  style="width: 200px" value="<%=rs.getString(2) %>" />
                    <p id="9" style="font-size: x-small;color: red"></p>
               
                <input type="text" name="phone" id="3" placeholder="Age"  style="width: 200px" value="<%=rs.getString(3) %>" />
                <p id="10" style="font-size: x-small;color: red"></p>
               
                    <input type="text" name="type" id="4" placeholder="Sex" style="width: 200px" value="<%=rs.getString(4) %>"  />
                    <p id="11" style="font-size: x-small;color: red"></p>
               
                <input type="text" name="make" id="5" placeholder="BloodGroup" style="width: 200px" value="<%=rs.getString(5) %>"  />
                    <p id="12" style="font-size: x-small;color: red"></p>
               
                <input type="text" name="model" id="6" placeholder="Phone Number" style="width: 200px" value="<%=rs.getString(6) %>"  />
                    <p id="13" style="font-size: x-small;color: red"></p>

                  <input type="text" name="model1" id="7" placeholder="Email id" style="width: 200px" value="<%=rs.getString(7) %>"  />
                    <p id="14" style="font-size: x-small;color: red"></p>   

                     <input type="text" name="model2" id="8" placeholder="Address" style="width: 200px" value="<%=rs.getString(8) %>"  />
                    <p id="15" style="font-size: x-small;color: red"></p>

                <br>
              <br>
              <br>

                <div class="button_cont" align="left"><br>
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
	