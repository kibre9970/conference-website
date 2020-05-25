<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>
<%   
     String userid = session.getAttribute("userid")+"";
     String uname = session.getAttribute("uname")+""; 
    
     String rname = request.getParameter("rname");
     String rin = request.getParameter("rin");     
     boolean flag = true;    

%>
    <html>
    <head>
    <title> Create Room</title>
    </head>
    <body>
   
<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>

<%
 try {
           PreparedStatement pstmt = null;
           PreparedStatement pstmt2 = null;
           PreparedStatement pstmt3 = null;
           PreparedStatement pstmt4 = null;
           pstmt2 = con.prepareStatement("select * from roomdetails where roomname=?");
           pstmt2.setString(1,rname);  
           ResultSet rs = pstmt2.executeQuery();

           if(rs.next())
           {
	     	   out.println("<br><br><br><br><center><font color = midnightblue size = 6> Already '"+rname+"' Room Existed</font></center>");
	     	   out.println("<br><br><br><center><a href = createroom.jsp><img src='images/tryagain.jpg' border=0></a></center>");
               flag = false;              
               if(pstmt2 != null)
                 pstmt2.close();
                con.close();
           
           }
           else if(userid.compareTo("admin") != 0)
           {  
              pstmt3 = con.prepareStatement("select count(*) from roomdetails where moderator = ?");
              pstmt3.setString(1,userid);  
              ResultSet rs2 = pstmt3.executeQuery();          
              if(rs2.next())
              {
               
               int c=rs2.getInt(1);
               
	     	   if(c > 2)
               {
               flag = false;
               out.println("<br><br><br><br><center><font color = midnightblue size = 6>");
               out.println("You have exceeded the limit("+c+") to create new room </font></center>");

   
               if(userid.equals("admin"))
	     	   out.println("<br><br><br><center><a href = adminmainscreen.jsp><img src='images/home3.jpg' border=0></a></center>");
	     	   else out.println("<br><br><br><center><a href = conferencemain.jsp><img src='images/home3.jpg' border=0></a></center>");

               } 
               }
                             
               if(pstmt3 != null)
                 pstmt3.close();
                
           
           }
                
           
           if(flag == true)  
           {  
           pstmt = con.prepareStatement("insert into roomdetails values(?,?,?)"); 
           pstmt.setString(1,rname);                  
           pstmt.setString(2,rin);                  
           pstmt.setString(3,userid);           

           int cou = pstmt.executeUpdate();
    

           pstmt4 = con.prepareStatement("create table "+rname+"(userid varchar2(25), text long)"); 

           int co = pstmt4.executeUpdate();
%>
             
           <br><br><br> 
           <font color = green size = 6><center> Successfully Created The Room </center></font>
           <br><br><br>
           <font color = blue size = 6><center><a href = writeoffline.jsp>Send Group mail to invite the persons to conference</a></center>

           <br><br>
           <% if(userid.equals("admin"))
           out.println("<center><a href = adminmainscreen.jsp>Send Later</a></center></font>");
           else out.println("<center><a href = conferencemain.jsp>Send Later</a></center></font>");   %>       

           </body> 
   <%        

           
           if(pstmt != null)
               pstmt.close();
            con.close();

           }
         }
          catch(Exception e) {
           e.printStackTrace();
             out.println("ERROR: "+ e + "\n");
           }
         
%>
