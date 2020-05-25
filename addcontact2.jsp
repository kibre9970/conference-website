<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>
 <%@ include file="suc.jsp" %> 
<%   
     String userid = session.getAttribute("userid")+"";
     String uname = session.getAttribute("uname")+""; 
     String tname = request.getParameter("tname");
     String tuserid = request.getParameter("tuserid");
     String tdob = request.getParameter("tdob");
     String temail = request.getParameter("temail");
     String tphone = request.getParameter("tphone");
     String tcity = request.getParameter("tcity");

 try {
           PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("insert into addressbook values(?,?,?,?,?,?,?)"); 
           pstmt.setString(1,tname);                  
           pstmt.setString(2,tuserid);                  
           pstmt.setString(3,tdob);                  
           pstmt.setString(4,temail);                  
           pstmt.setString(5,tphone);                  
           pstmt.setString(6,tcity);                  
           pstmt.setString(7,userid);                  
           int count = pstmt.executeUpdate();

    
 %>
 
<html>
<head><title> Address Book Updation></title></head>
<body bgcolor="wheat">
<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>  
<font color=green size=6><center> Successfully Added </center></font>
<br>
<center><a href = addressbook.jsp><img src='images/goback.jpg' border=0></a></center>
</body>

 <%   
	 
     if(pstmt != null)
	    pstmt.close();
    	
	}catch(Exception e)
    {
        e.printStackTrace();
        out.println("ERROR: "+ e + "\n");
    }
    
%> 
