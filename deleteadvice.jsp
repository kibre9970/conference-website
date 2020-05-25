<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>
<%   
     String empid = request.getParameter("empid");
     String message = request.getParameter("message");

 try {
           PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("delete from advices where empid = ? and message = ?");   
           pstmt.setString(1,empid);     
           pstmt.setString(2,message);                                               

           int count = pstmt.executeUpdate();

           if(pstmt != null)
               pstmt.close();
               con.close();
          
         }
          catch(Exception e) {
           e.printStackTrace();
             out.println("ERROR: "+ e + "\n");
           }
           
%>
<jsp:forward page="readadvices.jsp"/>

