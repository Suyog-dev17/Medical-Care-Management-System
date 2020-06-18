<%@ page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logging in.....</title>
</head>
<body>
<%

try

{
	
	Connection connect = null;
	Statement stat = null;
	ResultSet result = null;
	
	ResultSet res=null;
	int rs=0;
	out.println("abc");
    Class.forName("com.mysql.jdbc.Driver").newInstance();
	String host = "jdbc:mysql://localhost:3306/medicalcare";
    String uName = "root";
    String uPass = "password";
    connect = DriverManager.getConnection(host,uName,uPass);
	if(!connect.isClosed())
	{
		String name=request.getParameter("name");
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String repass=request.getParameter("confirm");
		String desig=request.getParameter("desig");
		
		stat=connect.createStatement();
		if(desig.equals("Pharmacist")){
			
			res=stat.executeQuery("select email from login_details where email='"+email+"'");
					if(!res.next()){
			result=stat.executeQuery("select pharmacist from count");
			result.next();
			String p_id = result.getString(1);
			char a,b,c;
			String p;
			int i=p_id.length()-1;
			System.out.println(i);
			a=p_id.charAt(i);
			b=p_id.charAt(i-1);
			c=p_id.charAt(i-2);
			if(a=='9') {
				if(b=='9'){
					p="P"+(++c)+'0'+'0';
          		}
				else{
					p="P"+c+(++b)+'0';
				}
			}
			else{
				p="P"+c+b+(++a);
			}
			rs = stat.executeUpdate("insert into pharmacists values('"+p+"','"+name+"')");
			rs = stat.executeUpdate(" update count set pharmacist='"+p+"' where pharmacist='"+p_id+"' ");
			rs = stat.executeUpdate("insert into login_details values ('"+email+"','"+username+"','"+password+"','"+p+"')");
			
			response.sendRedirect("index.html");
		}
				
		else{response.sendRedirect("error.jsp");}
		}
		else if(desig.equals("Doctor"))
		{
			res=stat.executeQuery("select email from login_details where email='"+email+"'");
			 	if(!res.next()){
								result=stat.executeQuery("select doctor from count");
								result.next();
								String d_id = result.getString(1);
								char a,b,c;
								String d;
								int i=d_id.length()-1;
								System.out.println(i);
								a=d_id.charAt(i);
								b=d_id.charAt(i-1);
								c=d_id.charAt(i-2);
								if(a=='9') {
												if(b=='9'){
													d="D"+(++c)+'0'+'0';
												}
												else{
													d="D"+c+(++b)+'0';
												    }
											}
			                       else{
				                        d="D"+c+b+(++a);
			                           } 
			
				
				rs = stat.executeUpdate("insert into doctors values('"+d+"','"+name+"')");
				rs = stat.executeUpdate("update count set doctor='"+d+"' where doctor='"+d_id+"'");
				rs = stat.executeUpdate("insert into login_details values ('"+email+"','"+username+"','"+password+"','"+d+"')");
			
				response.sendRedirect("index.html");
			                }

			else{response.sendRedirect("error.jsp");}
		}
		else {
			res=stat.executeQuery("select email from login_details where email='"+email+"'");
			if(!res.next()){
							result=stat.executeQuery("select receptionist from count");
							result.next();
							String r_id = result.getString(1);
							char a,b,c;
							String r;
							int i=r_id.length()-1;
							System.out.println(i);
							a=r_id.charAt(i);
							b=r_id.charAt(i-1);
							c=r_id.charAt(i-2);
							if(a=='9') {
										if(b=='9'){
											r="R"+(++c)+'0'+'0';
								                  }
								else{
									r="R"+c+(++b)+'0';
								    }
									   }
							else{
								r="R"+c+b+(++a);
							}
			
				
							rs = stat.executeUpdate("insert into receptionists values('"+r+"','"+name+"')");
							rs = stat.executeUpdate("update count set receptionist='"+r+"' where receptionist='"+r_id+"'");
							rs = stat.executeUpdate("insert into login_details values ('"+email+"','"+username+"','"+password+"','"+r+"')");
			
				response.sendRedirect("index.html");
			}
	else{response.sendRedirect("error.jsp");}
			}
	}
	  connect.close();

}
catch(Exception e){
	out.println(e);
			      }
%>
</body>
</html>