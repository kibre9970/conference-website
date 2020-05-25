<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 

<html>
<head>
<title>Conference Page</title>
 </head>
<body background = "images/Spacer.gif"> 
<%
   String userid = request.getParameter("userid"); 
         if(userid==null)
            userid="vij";
   String uname = request.getParameter("uname"); 
%>
<font color = red face = verdana size = 5><center>Welcome&nbsp&nbsp&nbsp
<%= uname %></center></font>

  



</body>
</html>
