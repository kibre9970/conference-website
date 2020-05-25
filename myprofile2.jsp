<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>
<%   
     String userid = session.getAttribute("userid")+"";
     String uname = session.getAttribute("uname")+""; 

     String tname=request.getParameter("tname");   
  
     String tpin=request.getParameter("tpin");    
     String tadd=request.getParameter("tadd"); 
     String tphone=request.getParameter("tphone");     
     String temail=request.getParameter("temail");      
     String ted=request.getParameter("ted");;     
     String tcou=request.getParameter("tcou");;     
     String tcity=request.getParameter("tcity");;     
     String tstate=request.getParameter("tstate");;     
     String tdob=request.getParameter("tdob");;     

  
 try {
           PreparedStatement pstmt = null;
                             
           pstmt = con.prepareStatement("update userdetails set name=?, zip=?, phone=?, city=?, address=?,email=?,education=?,country=?,state=?,dob=?  where userid=?"); 
           pstmt.setString(1,tname);                  
           pstmt.setString(2,tpin);                  
           pstmt.setString(3,tphone);                  
           pstmt.setString(4,tcity);                  
           pstmt.setString(5,tadd);                  
           pstmt.setString(6,temail);                  
           pstmt.setString(7,ted);                  
           pstmt.setString(8,tcou);                  
           pstmt.setString(9,tstate);                  
           pstmt.setString(10,tdob);                  
           pstmt.setString(11,userid);                            

           int count = pstmt.executeUpdate();
 %>
           <html>
           <head>
            <title> My Profile Updation></title>
           </head>
           <body>
          
<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>


             
           <br><br><br><br><br><br>  
           <font color = green size = 6><center> Successfully Updated </center></font>
           <br><br><br>
           <center><a href = myprofile.jsp><img src='images/goback.jpg' border=0></a></center>
          
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