<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 

<html>
<head>
<title>Conference Page</title>
</head>

<body background = "images/coco.jpg"> 

<%
   String userid = request.getParameter("userid"); 
         if(userid==null)
            userid="vij";
   String uname = request.getParameter("uname"); 
%>

<br><br><br><br>
<a href="addressbook.jsp?userid=<%= userid%>&uname=<%= uname%>" target=f3><font color=red size=4><b>Address Book</b> </font></a><br><br>
<a href="offline.jsp?userid=<%= userid%>&uname=<%= uname%>" target=f3><font  color=red size=4><b>Offline</b></font> </a><br><br>
<a href="conference.jsp?userid=<%= userid%>&uname=<%= uname%>" target=f3><b><font  color=red size=4>Conference</a><br><br>
<a href="changepass.jsp?userid=<%= userid%>&uname=<%= uname%>" target=f3><b><font  color=red size=4>Change Password</a><br><br>
<a href="viewprofile.jsp" target=f3><b><font  color=red size=4>View Profile</a><br><br>
<a href="userstatus.jsp" target=f3><b><font  color=red size=4>User Status</a><br><br>
<a href="Searchcontact.jsp" target=f3><b><font  color=red size=4>Search Contact</a><br><br>

</body>

</html>
