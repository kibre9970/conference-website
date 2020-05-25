<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>

<%   

     String userid = session.getAttribute("userid")+"";
     String uname = session.getAttribute("uname")+"";    
     String rcount="";
     String ucount="";  
%>

<HTML>
<head>
</head>
<BODY  bgcolor = ghostwhite>


<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>


  

<table border=3 align="center" width=300>
<td bgcolor=palegreen> <FONT  face="verdana" size=5 COLOR=midnightblue><center>Offline Checking</CENTER></font></td>
</table>

<br><br>
   <%try {
           PreparedStatement pstmt = null;
           PreparedStatement pstmt2 = null;
           pstmt = con.prepareStatement("select count(*) from mail where read = 'n' and userid = ?");
           pstmt.setString(1,userid);                           
           pstmt2 = con.prepareStatement("select count(*) from mail where read = 'y' and userid = ?");              pstmt2.setString(1,userid);
           ResultSet rs1 = pstmt.executeQuery();
           ResultSet rs2 = pstmt2.executeQuery();
           if(rs1.next())
              ucount = rs1.getString(1);


           if(rs2.next())
              rcount = rs2.getString(1);

           %>
           <center><br><a href = writeoffline.jsp><img src = images/write.jpg border=0></a></center>                   

           <center><br><a href = readoffline.jsp><img src = images/read2.jpg border=0></a><br>                   

                  &nbsp;&nbsp;&nbsp;<font color = green size = 5><b>-Read(<%= rcount%>)<br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-UnRead(<%= ucount%>)</font></b></center>
                

          <% if(pstmt != null)
               pstmt.close();
               con.close();
         }
          catch(Exception e) {
           e.printStackTrace();
             out.println("ERROR: "+ e + "\n");
           }
%>

<br><br>
<table border = 2 width = 300 align = center bgcolor = palegreen><tr height = 10 >
<td> 
</td></tr></table>

</form>
</BODY>
</HTML>

