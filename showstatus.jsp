<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>


<%
    String userid = session.getAttribute("userid")+"";
    String uname = session.getAttribute("uname")+"";  


   String tuserid = request.getParameter("suserid");
   String  tabuserid = "";
   String  troom = "";
   String  ttime = "";
   String  tdate = "";
   boolean flag1 = false;
   boolean flag2 = false;   
%>

<html>
<head>
<title>User Status Page</title>
 </head>

       
<body>
 

<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>



<%
     try {
           PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("select * from password");                     

           ResultSet rs1 = pstmt.executeQuery();

           while(rs1.next())
           {
             tabuserid = rs1.getString(1);
             if(tabuserid.equals(tuserid))
             {
                flag1 = true;
                break;
             } 
              
           }

         if(flag1 != true)
         {
             out.println("<br><br><br><br><center><h1><font color = RED>User Id doesn`t exist</font></h1>");
             out.println("<br><a href = userstatus.jsp><h2><img src=images/tryagain.jpg border=0 Click here to try again</h2></a></center>");
         } 
         else
         { 
           pstmt = con.prepareStatement("select * from clientonline");    
           
           ResultSet rs2 = pstmt.executeQuery();

           while(rs2.next())
           {
             tabuserid = rs2.getString(1);
             

             if(tabuserid.equals(tuserid))
             {
                flag2 = true;
                troom = rs2.getString(2);
                tdate = rs2.getString(3); 
                ttime = rs2.getString(4);  
                break;
             } 
              
           } %>
           <center><font color = red><h1><u>User Status</u></h1></font></center>
           <br>
            <center>
           <table border="4" cellspacing="1"  WIDTH="60%">
           <tr><td height="20"  align=left><font size=6 color=darkBLUE>&nbsp;&nbsp;&nbsp;User Id</font>
           </td><td  align = left><font color = green size = 6>&nbsp;&nbsp;&nbsp;<%=tuserid%></font></td></tr>
           
          <% if(flag2 == false)
           { %>
             <tr><td height="20"  align=center><font size=6 color=darkBLUE>Status</font>
             </td><td align = center><font color = green size = 6>&nbsp;&nbsp;&nbsp;<s>Online</s>/Offline</font></td></tr>
           
           <% }
             else { %>

              <tr><td height="20"  align=left><font size=6 color=darkBLUE>&nbsp;&nbsp;&nbsp;Status</font>
             </td><td align = center><font color = green size = 6>&nbsp;&nbsp;&nbsp;Online/<s>Offline</s></font></td></font></tr>

             <tr><td height="20"  align=left><font size=6 color=darkBLUE>&nbsp;&nbsp;&nbsp;LoggedRoom</font>
             </td><td align = center><font color = green size = 6>&nbsp;&nbsp;&nbsp;<%=troom%></font></td></tr>

             <tr><td height="20"  align=left><font size=6 color=darkBLUE>&nbsp;&nbsp;&nbsp;LoginTime</font>
             </td><td align = center><font color = green size = 6>&nbsp;&nbsp;&nbsp;<%=ttime%></font></td></tr>
             
             <tr><td height="20"  align=left><font size=6 color=darkBLUE>&nbsp;&nbsp;&nbsp;LoginDate</font>
             </td><td align = center><font color = green size = 6>&nbsp;&nbsp;&nbsp;<%=tdate%></font></td></tr>
        
             <tr></tr><tr></tr><tr></tr>
             </table> 
             <br><br>
             <table border=0  WIDTH=400>
              
             <tr>
             <td width = '17%'></td><td align = left width = '30%'>
            <% if(userid.equals("admin")) 
               out.println("<a href = adminmainscreen.jsp>");
               else out.println("<a href = conferencemain.jsp>");  %>
             
             <img border=0 src = images/home2.jpg></a></center></tr>  
             </table> 
             
           <% } %>

       <% } 

           
           if(pstmt != null)
             pstmt.close();
             con.close();
         }
          catch(Exception e) {
           e.printStackTrace();
             out.println("ERROR: "+ e + "\n");
           }
%>

 	  </body>  
			  </html>