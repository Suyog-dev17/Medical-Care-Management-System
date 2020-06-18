<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
 <html>
 <head>
 <link rel="stylesheet" href="addmedication.css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
        type="text/javascript"></script>
        
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
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalcare","root","password");
if(!connect.isClosed()){
    Statement stat=connect.createStatement();
    %>
    
    <form action="insertdata.jsp" method="POST">
        <br>
         
        <div class="scrolling" id="maintable">
        <table class="efg">
            <tr>
                <th>Patient Id</th>
                <th>Medicine Name</th>
                <th>Day/Noon/Night</th>
                <th>Units</th>
           </tr>
            <tr id="rows">
               
                    <td>
                        <select name="Patientid" class="sel2">
                        <option value="" disabled selected>Select your option</option>
                <%
                ResultSet rs1=stat.executeQuery("select * from prescriptions");  
                while(rs1.next())
                {
                %>
                <option value="<%=rs1.getString("Patient_id")%>">
                <%=rs1.getString("Patient_id")%>
                </option>
                 <% } %>
                
                </select>
                    </td>
                    <td>
                        <select name="medicines" class="js-example-basic-single">
                   <option value="" disabled selected>Select your option</option>   
                <%
                ResultSet rs2=stat.executeQuery("select * from medicinelist");  
                while(rs2.next())
                {
                %>
                <option value="<%=rs2.getString("medicinenames")%>">
                <%=rs2.getString("medicinenames")%>
                </option>
            <% } %>
                
                </select>
                    </td>
                    <td>
                           <select name="Dosage" class="sel2">
                                              <option value="" disabled selected>Select your option</option>   
                <%
                ResultSet rs3=stat.executeQuery("select * from tb1_dosage");  
                while(rs3.next())
                {
                %>
                <option value="<%=rs3.getString("dosage")%>">
                <%=rs3.getString("dosage")%>
                </option>
            <% } %>
                
                </select>
                    </td>
                    <td>
                        <input type="text" id="text1" name="Units" />
                    </td>
            </tr>
          
        </table>
          </div>  
 
    <div class="button11" id="add_new"><b>Add Row</b></div> 
     <div class="wrapper">
<button class="addcom" type="submit"><b>Insert Data</b></button>
</div>
</form>
<%} %>

    <script type="text/javascript">

        $("#add_new").click(function () { 

    $("#maintable").each(function () {
       
        var tds = '<tr>';
        jQuery.each($('tr:last td', this), function () {
            tds += '<td>' + $(this).html() + '</td>';
        });
        tds += '</tr>';
        if ($('tbody', this).length > 0) {
            $('tbody', this).append(tds);
        } else {
            $(this).append(tds);
        }
    });
});
</script>