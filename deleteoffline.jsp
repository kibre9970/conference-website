<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>
<%   
     String userid = request.getParameter("userid");
     String tfrom = request.getParameter("tfrom");
     String ttim = request.getParameter("ttime");
	 String ttime1 = ttim.substring(0,23);
	 String ttime2 = ttim.substring(24,34);
	 String ttime = ttime1 + "+" + ttime2;

 try {
           PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("delete mail where userid = ? and whosend = ? and timing = ?");   
           pstmt.setString(1,userid);                  
           pstmt.setString(2,tfrom);                  
           pstmt.setString(3,ttime);                  
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
<jsp:forward page="readoffline.jsp">
   <jsp:param name="userid" value="<%= userid%>"/>
</jsp:forward> 
