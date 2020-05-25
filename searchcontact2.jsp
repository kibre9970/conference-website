<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>
<%
     String userid = session.getAttribute("userid")+"";
     String uname = session.getAttribute("uname")+"";  
   String sname = request.getParameter("sname");
   String tuserid = "";
   boolean flag = false;
   boolean flag1 = false;
%>

<html>
<head>
<title>Search Contact Page</title>
 </head>
<body>
<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>
<%
     try {
           PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("select userid from userdetails where name like ?");   
           pstmt.setString(1,sname);                  
           ResultSet rs1 = pstmt.executeQuery();
           while(rs1.next())
           {
             tuserid = rs1.getString(1);
             flag = true; 
             if(!flag1)
             { flag1 = true;
          %>    
           <center><font color = green face = Lucida Console><h1><u>Userid's Corresponding to the given name</u></h1></font></center>
           <br><br>
           <center>
           <table border="6" cellspacing="1"  WIDTH="30%">
           
          <% }
             out.println("<tr><td height=20  align=left><font size=6 color=blue><center>" + tuserid + "</font></td></tr>");                    
                          
           }

           if(flag == false)
           {
             out.println("<br><br><br><br><center><h1><font color = RED>No Entries found with given name</font></h1>");
             out.println("<br><a href = Searchcontact.jsp><img src = images/tryagain.jpg border=0></a></center>");                   
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
        </table>  <br> <br> <br>
        <center><br>
 
       <% if(userid.equals("admin"))
             out.println("<a href = adminmainscreen.jsp>");
         else out.println("<a href = conferencemain.jsp>"); %>

         <h2><img src = images/HOME1.GIF></h2></a></center><br><br>                   
 
 	  </body>  
			  </html>  
