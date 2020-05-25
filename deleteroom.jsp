<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>

<%
String drname = request.getParameter("drname");
String userid = session.getAttribute("userid")+"";
String uname = session.getAttribute("uname")+"";
    PreparedStatement pstmt = null;
    PreparedStatement pstmt2 = null;
    PreparedStatement pstmt3 = null;
    ResultSet rs = null;

    try {
         String q = "drop table " + drname;
         pstmt = con.prepareStatement(q);   
         
         int cc = pstmt.executeUpdate();

         pstmt2 = con.prepareStatement("delete from roomdetails where roomname = ?");   
         pstmt2.setString(1,drname);
 
         int c = pstmt2.executeUpdate();

         pstmt3 = con.prepareStatement("update clientonline set roomname = null where roomname = ?");   
         pstmt3.setString(1,drname);
          int ccc = pstmt3.executeUpdate();

          }
         finally 
         {
            if(pstmt != null)
               pstmt.close();
               con.close();
         } 
 %>

<jsp:forward page="myrooms.jsp"/>

          
