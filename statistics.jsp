<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ page errorPage="error.jsp" %>
<%@ include file="DBConn.jsp" %>


<%  String userid = session.getAttribute("userid")+"";
    String uname = session.getAttribute("uname")+"";
    
    %>

<HTML>
<HEAD>
<title> Statistics </title>

</HEAD>
<BODY bgColor=skyblue >


<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>

<% try {
           PreparedStatement pstmt = null;
           PreparedStatement pstmt2 = null;
           pstmt = con.prepareStatement("select count(*) from password");   
           ResultSet rs = pstmt.executeQuery();
           int c = 0;
           if(rs.next())
             c = rs.getInt(1);
           pstmt2 = con.prepareStatement("select count(*) from clientonline");   
           ResultSet rs2 = pstmt2.executeQuery();
           int c2 = 0;
           if(rs2.next())
             c2 = rs2.getInt(1);   
           pstmt2 = con.prepareStatement("select count(distinct roomname) from clientonline");   
           ResultSet rs3 = pstmt2.executeQuery();
           int cor = 0;
           if(rs3.next())
             cor = rs3.getInt(1);   
           pstmt2 = con.prepareStatement("select count(*) from roomdetails");   
           ResultSet rs4 = pstmt2.executeQuery();
           int c4 = 0;
           if(rs4.next())
             c4 = rs4.getInt(1);  
%>
             
           <table border=0 width = '60%' align = center>
           <tr><td align = 'center'><font size =5 color=brown><b>Total no.of users : <%= c%></td></tr>
           <tr><td align = center><font size =5 color=brown><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Online: <%= c2%></td></tr>
           <tr><td align = center><font size =5 color=brown><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Offline: <%= c-c2%></td></tr>


           <tr><td>&nbsp;</td></tr>
           <tr><td align = center><font size =5 color=green><b>Total no.of rooms : <%= c4%></td></tr>
           <tr><td align = center><font size =5 color=green><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Active: <%= cor%></td></tr>
           <tr><td align = center><font size =5 color=green><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Inactive: <%= c4-cor%></td></tr>
           </table>  
<form action = viewstatistics.jsp method = post>
<br><br>
          <center> <font color=blue size=5 face =verdana><b>View Active</b></font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

  <select name = active>
         <option selected>Users</option> 
         <option>Rooms</option> 
  </select></center>
<br><br><center>  <input type = submit name = view1 value = ' view '></center>


<br><br>
          <center> <font color=blue size=5 face =verdana><b>View Messages By</b></font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

  <select name = message>
         <option selected>Room</option> 
         <option>UserId</option> 
  </select></center><br>
<center><font color = green size = 5>Room:&nbsp;&nbsp;&nbsp;&nbsp;<input type = text name = room size = 15></center> 
<center>UserId:&nbsp;&nbsp;&nbsp;<input type = text name = user size = 15></center></font>
<br><br><center>  <input type = submit name = view2 value = ' view '></center>
<br><br>
          <center> <font color=blue size=5 face =verdana><b>View Employee List</b></font>
 </center>
<br><br><center>  <input type = submit name = view3 value = ' view '></center>

<%           if(pstmt != null)
               pstmt.close();
               con.close();
         }
          catch(Exception e) {
           e.printStackTrace();
             out.println("ERROR: "+ e + "\n");
           }
%>
</form>
</BODY>
</HTML>