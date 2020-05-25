<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>

<html>
<head>
	<title>Registration</title>
	<link rel=stylesheet type="text/css" href="style.css">

</head>

<body background="img/background.jpg" bottommargin="0" leftmargin="0" marginheight="0" marginwidth="0" rightmargin="0" topmargin="0">

<center><table width="765" height="100%" cellpadding="0" cellspacing="0" border="0" background="img/mainbackground.jpg"><tr valign="top"><td>

<table width="764" height="97" cellpadding="0" cellspacing="0" border="0">
	<tr valign="top">
<td width="248"><!-- logo image --><img src="source/logoback.jpg" width="400" height="97" border="0" alt=""><!-- end logo image --></td>
<td width="100%" background="img/toplogobg.jpg"><img src="img/toplogobg.jpg" width="22" height="97" border="0" alt=""></td>
	</tr>
</table>
<table width="764" height="42" cellpadding="0" cellspacing="0" border="0">
	<tr valign="top">
<td width="169"><img src="img/left1.jpg" width="169" height="42" border="0" alt=""></td>
<td width="100%" background="img/left1bg.jpg"><img src="img/left1bg.jpg" width="20" height="42" border="0" alt=""></td>
	</tr>
</table>

<table width="764" cellpadding="0" cellspacing="0" border="0">
	<tr valign="top">

<td width="150">
<!-- menu below, copy and paste the menudivider.jpg code as necessary -->
<!-- the &nbsp; is code for a one letter space -->
<img src="img/menudivider.jpg" width="150" height="8" border="0" alt=""><BR>
&nbsp; <a href="index.html">Home</a><BR>
<img src="img/menudivider.jpg" width="150" height="8" border="0" alt=""><BR>
&nbsp; <a href="Admin.html">Administrator</a><BR>
<img src="img/menudivider.jpg" width="150" height="8" border="0" alt=""><BR>
&nbsp; <a href="Client.html">Client Services</a><BR>
<img src="img/menudivider.jpg" width="150" height="6" border="0" alt=""><BR>
&nbsp; <a href="suggestions.html">Suggestions</a><BR>
<img src="img/menudivider.jpg" width="150" height="6" border="0" alt=""><BR>
&nbsp; <a href="sitemap.html">Site Map</a><BR>
<img src="img/menudivider.jpg" width="150" height="6" border="0" alt=""><BR>
&nbsp; <a href="help.html>Help</a><BR>
<img src="img/menudivider.jpg" width="150" height="6" border="0" alt=""><BR>
<!-- end menu -->
</td>
<td width="10">&nbsp;</td>
<td width="744">




<br>
<%

   String str1="";
   String str2="";
   String str3="";
   String str4="";
   String str5="";
   String id="";
 
   boolean flag = false;   
                 
   String userid=request.getParameter("login");
   String empid=request.getParameter("empid");	
   String key=request.getParameter("key");
  
   try
   {      
       Statement stmt=con.createStatement();
       ResultSet rs=stmt.executeQuery("select * from empdetails");
       while(rs.next())
       {
	    str1 = rs.getString(1);
          str2 = rs.getString(2);
          str3 = rs.getString(3);
          str4 = rs.getString(4);
          str5 = rs.getString(5);
		  if(str1.equals(empid))
          {
               flag = true;
               break;
          }
        }
         if(!flag)
	   { 
             
             out.println("<font color = red><center><h1>Sorry Employee Id has not registered");
             out.println("!!!  meet Admin</h1></center>");

	       out.println("</font><br>");
             out.println("<br><br><br><br><br><br><br><br><br>");
	       out.println("<A HREF='register.html' torget = 'f3'><center>");
             out.println("<h2> Click Here To Try Again </h2></center></A>");       
             out.println("<A HREF='index.html' target =_top><center>");
             out.println("<h2>Click Here To go to Home Page</h2></center></A>");
             out.println("</body></html>");
         } 
         else
         if(str3.equals("y"))
         { 
             out.println("<font color = red><center><h1>Sorry You have already User account");
             out.println(" for conference!!!  meet Admin</h1></center>");
	       out.println("</font><br>");
             out.println("<br><br><br><br><br><br><br><br><br>");
	       out.println("<A HREF='index.html' target = _top><center>");
             out.println("<h2>Click Here To go to Home Page</h2></center></A>");          
             out.println("</body></html>");

          }
          else
          if(!(str2.equals(key)))
          {

             out.println("<font color = red><center><h1>Sorry Your key is wrong");
             out.println(" for conference!!!  meet Admin</h1></center>");
	       out.println("</font><br>");
             out.println("<br><br><br><br><br><br><br><br><br>");
             out.println("<A HREF='register.html' torget = 'f3'><center>");
             out.println("<h2> Click Here To Try Again </h2></center></A>");       
             out.println("<A HREF='index.html' target = _top><center>");
             out.println("<h2>Click Here To go to Home Page</h2></center></A>");            
             out.println("</body></html>");

          }
          else
          {           
                          
             out.println("<font color = red><center><h1>Your Emp id and key are valid");
             out.println(".</h1></center>");
	       out.println("</font><br>");
             out.println("<font color = green><center><h1>Your UserID: " + userid);
             out.println(".</h1></center>");
	       out.println("</font><br>");
            
             out.println("<br><br><br><br>");
	       out.println("<A HREF='register2.jsp?userid="+userid+"&empid="+empid+"' ><center>");
             out.println("<h2>Click Here To Continue with Registration process</h2></center></A>");            
             out.println("</body></html>");

          }
        if(stmt != null)
           stmt.close();
           con.close();                 
   
   }
   catch(Exception e) {
        e.printStackTrace();
        out.println("ERROR: "+ e + "\n");
   }
  %>
</td>
<td width="10">&nbsp;</td>
	</tr>
</table>
</td></tr></table></center>
</body>
</html>