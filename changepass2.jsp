<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>

<%
   String userid = session.getAttribute("userid")+"";
   String uname = session.getAttribute("uname")+""; 
   String opass = request.getParameter("opass");      
   String npass = request.getParameter("npass");
   String pass="";  
   String tuserid="";
   boolean flag = false;
%>

<html>
<head>
<title>Password change Page</title>
 </head>
<body>
<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>
<% 
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
         pstmt = con.prepareStatement("select * from password");   
         rs = pstmt.executeQuery();
         while(rs.next()) 
         {
           tuserid = rs.getString(1); 
           pass = rs.getString(2);
           if(userid.equals(tuserid) && pass.equals(opass))                    
           {
             flag = true;           
             break;
           }
         }
         if(flag == false)
         {%>
            <h1><font color = RED><center>Type correct old password</center></font></h1>
            <br><a href = changepass.jsp><h2><center>Click here to try again</center></h2></a></center>

         <%} 
         else
         {
           pstmt = con.prepareStatement("update password set pwd = ? where userid = ?");
           pstmt.setString(1,npass);
           pstmt.setString(2,tuserid);
           int rowcount = pstmt.executeUpdate();
           %>
           <br><br>  
           <font color=green size=6><b><center>Your Password has changed</center></b> </font><br><br>
           <% if(userid.equals("admin"))  
                out.println("<a href='adminmainscreen.jsp'  target = '_top'>");
              else out.println("<a href='conferencemain.jsp'  target = '_top'>"); %>
           <font color=red size=6><b><center>Click to go back</center></b> </font></a><br><br>
         <%
         }                   
       }
      finally {
       if(pstmt != null)
         pstmt.close();
         con.close();
       } 
 %>
</body>  
</html>