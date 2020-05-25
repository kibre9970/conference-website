<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>

<%
String nkey = request.getParameter("kname");
String drname = request.getParameter("drname");
String userid = session.getAttribute("userid")+"";
String uname = session.getAttribute("uname")+"";
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
         pstmt = con.prepareStatement("update roomdetails set rin = ? where roomname= ? and moderator = ?");   
         pstmt.setString(1,nkey);
         pstmt.setString(2,drname);
         pstmt.setString(3,userid);                    
         int cc = pstmt.executeUpdate();
          }
         finally 
         {
            if(pstmt != null)
               pstmt.close();
            if(con != null)
               con.close();
         } 
 %>
<jsp:forward page="myrooms.jsp"/>