
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>
<%
String userid = session.getAttribute("userid")+"";
String uname = session.getAttribute("uname")+"";  %>

<% 

try {
           PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("delete clientonline where userid=?"); 
           pstmt.setString(1,userid);                  
           int count = pstmt.executeUpdate();

}
          catch(Exception e) {
           e.printStackTrace();
             out.println("ERROR: "+ e + "\n");
           }
         


  session.invalidate();  %>
<HTML>
<BODY background = images/pt.gif>
<br><br><br><br><br><br><br><br>

    <font color=brown size=5 face = verdana><b><center>Good Bye,</font> 
                  <font color=blue size=5 face = verdana><%= uname%></center></b></font> 
<br><font color=green size=5 face = verdana><center><b>You have been successfully loggedout</center> </b></font>

<br><br><br> <font color = green size = 5 face = verdana><center><b>
                       <a href = index.html>Main Page</a></center> </b></font>
<br><br><br>
<center><img src = 'images/RABBIT.GIF' border = 0></center>

</BODY>
</HTML>