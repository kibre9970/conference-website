<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ page session="true" %>
<%@ include file="DBConn.jsp" %>

<jsp:useBean id="clock" class="java.util.Date" />  

<html>
<head>
	<title>Conference Home Page</title>
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
	String id ="",str1="",str2="",str3="";
	boolean flag1 = false, flag2 = false;
	String userid = request.getParameter("T1");
	String pwdt = request.getParameter("T2"); 
	out.println("<html>");
	out.println("<body>");
	out.println("<br>");
try
{
	Statement st = con.createStatement();
	ResultSet rs=st.executeQuery("select * from password");
	while(rs.next())
	{
		str1 = rs.getString(1);
		str2 = rs.getString(2);
		if(str1.equals(userid))
		{
			flag1 = true;                              
			if(str2.equals(pwdt))
				flag2 = true;
			break;
		}
	}
	rs.close();
	st.close();
	if(!flag1 || !flag2) 	
	{
		out.println("<font color = red><center><h1>Sorry Wrong Id/Password ");
		out.println("!!!</h1></center>");
		out.println("</font><br>");  
		out.println("<A HREF='./Admin.html' ><center>");
		out.println("<h2>Click Here To Try Again</h2></center></A>");
	} 
	else
	{	
		Statement stmt = con.createStatement();
		ResultSet result=stmt.executeQuery("select * from userdetails");
		while(result.next())
		{
			str1 = result.getString(1);
			str2 = result.getString(2);
			if(str1.equals(userid))
				break;
		}
		result.close();
		stmt.close();
//update time and date
		java.util.Date d = new java.util.Date();  
		String dt = d.toString() + " ";
		String tdate = dt.substring(4, 11) + dt.substring(24, 29);
		String ttime = dt.substring(11, 20);  
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		pstmt3 = con.prepareStatement("delete from clientonline  where userid=?");
		pstmt3.setString(1,userid);  
		int ccc = pstmt3.executeUpdate();
		pstmt2 = con.prepareStatement("insert into clientonline values(?,null,?,?)");
		pstmt2.setString(1,userid);  
		pstmt2.setString(2,tdate);  
		pstmt2.setString(3,ttime);  
		int cc = pstmt2.executeUpdate(); 
		out.println("<br>");
		out.println("<h2><font color = green face = verdana><center>You Are the Administrator");
		out.println("</center></font> </h2>");
		out.println("<br>");
// Timing Function
		if(clock.getHours() < 12)
			out.println("<center><img src='images/goodmor.jpg'  alt='conference' border=0 height = 50></center>"); 
		else if(clock.getHours() < 17) 
			out.println("<center><img src='images/goodday.jpg'  alt='conference' border=0 height = 50></center>");
		else
			out.println("<center><img src='images/goodeve.jpg'  alt='conference' border=0 height = 50></center>");
		out.println("<form  action='adminmainscreen.jsp' name = frm target = _top>");
		out.println("<TABLE border=0 align=\"center\"><TR>");
		out.println("<TD>");
		out.println("<font face = 'verdana' color = '#FF69B4' size = 6><center>");
		out.println("<br>" + str2);
		out.println("</center></font>");
//out.println("<input type=hidden name='userid' value = '" + str1 + "' >");
//out.println("<input type=hidden name='uname' value = '" + str2 + "' >");
//uploading session
		session.setAttribute("userid", str1);
		session.setAttribute("uname", str2);
		out.println("</TD></tr><tr><td align = middle>");
		out.println("<br><br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;");           
		out.println("<input type = image name = submit src = images/ctop.jpg></td></tr>");
	}
	out.println("</table>");
	out.println("</form>");
	out.println("</body>");
	out.println("</html>");
}catch(Exception e)
{	
	e.printStackTrace();   
}
%>
</td>
<td width="10">&nbsp;</td>
	</tr>
</table>
</td></tr></table></center>
</body>
</html>