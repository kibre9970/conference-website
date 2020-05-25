<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>

<%   
     String userid = session.getAttribute("userid")+"";
     String uname = session.getAttribute("uname")+""; 

     String tname = request.getParameter("tname");
     String tuserid = request.getParameter("tuserid");
     String tdob = request.getParameter("tdob");
     String temail = request.getParameter("temail");
     String tphone = request.getParameter("tphone");
     String tcity = request.getParameter("tcity");

 try {
           PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("update addressbook set dob=?, email=?, phone=?, city=? where ouserid=? and userid=?"); 
           pstmt.setString(1,tdob);                  
           pstmt.setString(2,temail);                  
           pstmt.setString(3,tphone);                  
           pstmt.setString(4,tcity);                  
           pstmt.setString(5,userid);                  
           pstmt.setString(6,tuserid);                  
                     
           int count = pstmt.executeUpdate();
 %>
           <html>
           <head>
            <title> Address Book Updation</title>
           </head>
           <body>
          
<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>


             
           <br><br><br><br><br><br>  
           <font color = green size = 6><center> Successfully Updated </center></font>
           <br><br><br>
           <center><a href = addressbook.jsp><img src='images/goback.jpg' border=0></a></center>
          
           </body> 
 </html>
   <%        if(pstmt != null)
               pstmt.close();
               con.close();
         }
          catch(Exception e) {
           e.printStackTrace();
             out.println("ERROR: "+ e + "\n");
           }
%>