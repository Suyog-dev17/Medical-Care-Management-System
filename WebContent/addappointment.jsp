<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link rel="stylesheet" href="addappointment.css">
<link rel="stylesheet" href="addpatient.css">
<style>
.search_categories1{
	
 font-size:13px;
 padding:10px 8px 10px 14px;
 background:black;
 border-radius:6px;
 overflow:hidden;
 position:relative;
 color:#ff8533;
  border-bottom: 3px solid #ff8533;
  width:180px;
  margin-left:-40px;
  text-align-last:center;
}
.search_categories1 .select{
	width:180px;
	color:#ff8533;
	text-align-last:center;
	background:black;
}
.search_categories1 .select select{
	background:black;
	line-height:1;
	border:0;
	padding:0;
	border-radius:0;
	width:100%;
	position:relative;
	z-index:10;
	font-size: 1em;
	color:#ff8533;
}
.desc{
background:black;
}
</style>
</head>
<body>
<% try{
Connection connect = null;
Statement stat = null;
int rs=0;
connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
stat=connect.createStatement();%>
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
<form action="addappointment1.jsp" method="post">
<div class="log">
               <div class="log2"><br><br>
         <input type="text" name="type" id="4" placeholder="Room No" style="width: 200px">
                    <p id="11" style="font-size: x-small;color: red"></p>
                    <br>
                     <textarea rows="0" cols="200" name="description" id="7" placeholder="Appointment Description" class="desc"></textarea>
                <div class="button_cont" align="left">
                <br>
               <div class="search_categories1">
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
            <div class="search_categories1">
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
                    <button type="submit"  class="log_b"><b>Register</b></button>
                </div>
                </div>
           </div>
</form>
<%}
connect.close();
}
catch(Exception e){
out.println(e);
}
%>


<script type="text/javascript">
            function blank1(){
      var fname=document.getElementById("1").value;
      if(fname==""){
      document.getElementById("8").innerHTML = "*This field cannot be blank";
      }
      else{
      document.getElementById("8").innerHTML = "";
      }
      }
        
            function blank3(){
      var phone=document.getElementById("3").value;
      if(phone==""){
      document.getElementById("10").innerHTML = "*This field cannot be blank";
      }
      else{
      document.getElementById("10").innerHTML = "";
      }
      }
            function blank4(){
      var type=document.getElementById("4").value;
      if(type==""){
      document.getElementById("11").innerHTML = "*This field cannot be blank";
      }
      else{
      document.getElementById("11").innerHTML = "";
      }
      }
           
      </script>
</body>
</html>
                  