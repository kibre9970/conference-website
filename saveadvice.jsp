<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>


<html>
<head>
	<title>Saving Advice</title>
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
<%
   String userid = session.getAttribute("userid")+"";
   String uname = session.getAttribute("uname")+"";  
   String sname = request.getParameter("T1");      
   String sphone = request.getParameter("T2");
   String sempid = request.getParameter("id");
   String saddress = request.getParameter("T3");
   String smessage = request.getParameter("message");
%>
<% 
    PreparedStatement pstmt = null;
    try {
         pstmt = con.prepareStatement("insert into advices values(?,?,?,?,?)");
         pstmt.setString(1,sname);
         pstmt.setString(2,sphone);
         pstmt.setString(3,sempid);
         pstmt.setString(4,saddress);
         pstmt.setString(5,smessage);          
         int rowcount = pstmt.executeUpdate();
         if(pstmt != null)
             pstmt.close();
             con.close();  %>
         <br><br><br><br><br><br>  
         <font color = blue size = 6><center>Successfully sent the suggestion</center></font>
         <br><br><br><a href = index.html><center><img src = images/home4.jpg border=0></center></a> 
          
          
   <%    }
      
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