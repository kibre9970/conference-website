<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>

<%  String userid = session.getAttribute("userid")+"";
    String uname = session.getAttribute("uname")+"";
    String buserid = request.getParameter("sname"); 
%>

<HTML>
<HEAD>
<title> Ban User</title>

</HEAD>
<BODY bgColor=skyblue >
<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>

<% try {
           PreparedStatement pstmt = null;
           PreparedStatement pstmt2 = null;
           pstmt = con.prepareStatement("delete password where userid = ?");   
           pstmt.setString(1,buserid);
           int c = pstmt.executeUpdate();
           pstmt2 = con.prepareStatement("delete security where userid = ?");   
           pstmt2.setString(1,buserid);
           c = pstmt2.executeUpdate();
           pstmt = con.prepareStatement("select * from clientonline where userid = ?");   
           pstmt.setString(1,buserid);
           ResultSet rs= pstmt.executeQuery();
		   if(rs.next())
		   {
				pstmt2 = con.prepareStatement("delete clientonline where userid = ?");   
				pstmt2.setString(1,buserid);
				c = pstmt2.executeUpdate();
		   }
           pstmt = con.prepareStatement("select * from userdetails where userid = ?");   
           pstmt.setString(1,buserid);
           rs= pstmt.executeQuery();
		   if(rs.next())
		   {
	           pstmt = con.prepareStatement("delete userdetails where userid = ?");   
		       pstmt.setString(1,buserid);
			   c = pstmt.executeUpdate();
		   }
           pstmt = con.prepareStatement("update empdetails set AC_STATUS='n' where userid = ?");   
           pstmt.setString(1,buserid);
		   c = pstmt.executeUpdate();


           if(c > 0)
           {
             out.println("<br><br><br><center><font color = green size = 6>User has been deleted</font></center>");
             out.println("<br><br><br><br><center><a href = 'adminmainscreen.jsp'><img src = images/home4.jpg border=0></a></center>");
           }
           else {  
             out.println("<br><br><br><center><font color = green size = 6>User '"+buserid+"' Doesn`t Exist</font></center>");
             out.println("<br><br><br><br><center><a href = 'adminmainscreen.jsp'><img src = images/home4.jpg border=0></a></center>");
           }
           if(pstmt != null)
               pstmt.close();
               con.close();
          
         }
          catch(Exception e) {
           e.printStackTrace();
             out.println("ERROR: "+ e + "\n");
           }
         
%>

</BODY>
</HTML>


