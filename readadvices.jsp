<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>

<%
     String userid = session.getAttribute("userid")+"";
     String uname = session.getAttribute("uname")+"";  

     String name="";
     String phone="";
     String empid="";
     String address="";
     String message="";
%>
 

<html>
<head> <title> Suggestions </title> 
</head>
<body >

<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>


<font size = '6' color =brown> <center><u>Suggestions</u></center></font>
<br>
<table border=0 width = '80%'>


<%   
          
     
     try {
     
          PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("select * from advices");                              
           ResultSet rs1 = pstmt.executeQuery();
           while(rs1.next())
           {
               name = rs1.getString(1);
               phone = rs1.getString(2);
               empid = rs1.getString(3);
               address = rs1.getString(4);
               message = rs1.getString(5); 
 
   %>
              
               <tr><td width='20%'></td><td align= left><font size=4><b>Name:&nbsp;&nbsp;&nbsp;<%= name%></td><td><a href='deleteadvice.jsp?empid=<%= empid%>&message=<%= message%>'><img src=images/delete1.jpg></a></td></tr>
          <%     out.println("<tr><td></td><td align= left><font size=4><b>Emp Id:&nbsp;&nbsp;&nbsp;"+empid+"</td></tr>");
               out.println("<tr><td></td><td align= left><font size=4><b>Phone:&nbsp;&nbsp;&nbsp;"+phone+"</td></tr>");
               out.println("<tr><td></td><td align= left><font size=4><b>Address:&nbsp;&nbsp;&nbsp;"+address+"</td></tr>");
               out.println("<tr><td></td><td align= left><font size=4><b>Message:&nbsp;&nbsp;&nbsp;<font color=blue>"+message+"</td></tr>");
               out.println("<tr><td></td></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>");
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

</table>
</BODY>
</HTML>

