<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>

<%
   String userid = session.getAttribute("userid")+"";
   String uname = session.getAttribute("uname")+"";              
   String rname = request.getParameter("rname");
   String rin = request.getParameter("rin");    %>
<html>
<head>
<title> Login Check </title>
</head>
<body >
<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>
<%
try {
           PreparedStatement pstmt3 = null;
           pstmt3 = con.prepareStatement("select * from roomdetails where roomname=? and rin=?");
           pstmt3.setString(1,rname);  
           pstmt3.setString(2,rin);  
           ResultSet rs = pstmt3.executeQuery();
           if(rs.next())
           {
             PreparedStatement pstmt2 = null;
             pstmt2 = con.prepareStatement("update clientonline set roomname=? where userid=?");
             pstmt2.setString(1,rname);  
             pstmt2.setString(2,userid);  

             int cc = pstmt2.executeUpdate(); 

             out.println("<br><br><br><br><center><font color = midnightblue size = 6> You are Succeded</font></center>");
	     	 out.println("<br><br><br><center><a href = conference.jsp?rname="+rname+"&rin="+rin+">");
             out.println("<img src='images/proceed.jpg' border=0></a></center>");                            
        
           } 
           else
           {
	     	 out.println("<br><br><br><br><center><font color = midnightblue size = 6> Wrong Room Name/PassWord </font></center>");
	     	 out.println("<br><br><br><center><a href = loginroom.jsp><img src='images/tryagain.jpg' border=0></a></center>");                            
           }              
    
           
           if(pstmt3 != null)
               pstmt3.close();
               con.close();
         }
          catch(Exception e) {
           e.printStackTrace();
             out.println("ERROR: "+ e + "\n");
           }
%>
</body>
</html>