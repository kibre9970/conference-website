<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>


<%

   String userid = session.getAttribute("userid")+"";
   String uname = session.getAttribute("uname")+"";  
   
   String suserid = request.getParameter("suserid");
   String tname = "";
   String tadd = "";
   String temail = "";
   String tphone = "";
   String tsex = "";
   String tcity = "";
   boolean flag = false;
%>

<html>
<head>
<title>View Profile Page</title>
 </head>

       
<body>
 

<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>



<%
     try {
           PreparedStatement pstmt = null;

           pstmt = con.prepareStatement("select * from userdetails where userid = ?");   
           pstmt.setString(1,suserid);                  

           ResultSet rs1 = pstmt.executeQuery();

           if(rs1.next())
           {
             tname = rs1.getString(2);
             tadd  = rs1.getString(3);
             tphone = rs1.getString(5);
             temail = rs1.getString(6);
             tsex = rs1.getString(7);
             tcity = rs1.getString(10);
             flag = true; 
             
          %>    
           <center><font color = green face = Lucida Console><h1><u>User Profile</u></h1></font></center>
           <br>           <center>
           <table border="3" cellspacing="1"  WIDTH="30%">
                      
           <tr><td height="20"  align=left><font size=6 color=darkBLUE>&nbsp;&nbsp;&nbsp;User Id</font>
           </td><td  align = left><font color = green size = 6>&nbsp;&nbsp;&nbsp;<%=suserid%></font></td></tr>

           <tr><td height="20"  align=left><font size=6 color=darkBLUE>&nbsp;&nbsp;&nbsp;Name</font>
           </td><td  align = left><font color = green size = 6>&nbsp;&nbsp;&nbsp;<%=tname%></font></td></tr>

           <tr><td height="20"  align=left><font size=6 color=darkBLUE>&nbsp;&nbsp;&nbsp;Address</font>
           </td><td  align = left><font color = green size = 6>&nbsp;&nbsp;&nbsp;<%=tadd%></font></td></tr>
           
           <tr><td height="20"  align=left><font size=6 color=darkBLUE>&nbsp;&nbsp;&nbsp;Phone</font>
           </td><td  align = left><font color = green size = 6>&nbsp;&nbsp;&nbsp;<%=tphone%></font></td></tr>

           <tr><td height="20"  align=left><font size=6 color=darkBLUE>&nbsp;&nbsp;&nbsp;E-Mail</font>
           </td><td  align = left><font color = green size = 6>&nbsp;&nbsp;&nbsp;<%=temail%></font></td></tr>

           <tr><td height="20"  align=left><font size=6 color=darkBLUE>&nbsp;&nbsp;&nbsp;Sex</font>
           </td><td  align = left><font color = green size = 6>&nbsp;&nbsp;&nbsp;<%=tsex%></font></td></tr>


           <tr><td height="20"  align=left><font size=6 color=darkBLUE>&nbsp;&nbsp;&nbsp;City</font>
           </td><td  align = left><font color = green size = 6>&nbsp;&nbsp;&nbsp;<%=tcity%></font></td></tr>
               
          <% }

           if(flag == false)
           {
             out.println("<br><br><br><br><center><h1><font color = RED>User Id not found</font></h1>");
             out.println("<br><a href = viewprofile.jsp><h2>Click here to try again</h2></a></center>");                   
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
        </table>  <br>  <br>
        <center><br>
        <% if(userid.equals("admin")) 
              out.println("<a href = adminmainscreen.jsp>");
           else  out.println("<a href = conferencemain.jsp>"); %>
         <h2><img src = images/HOME1.GIF border=0></h2></a></center><br><br>                   
 	  </body>  
</html>  
